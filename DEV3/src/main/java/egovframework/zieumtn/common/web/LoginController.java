/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.zieumtn.common.web;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.common.service.GPKIVO;
import egovframework.zieumtn.common.service.LoginService;
import egovframework.zieumtn.common.service.LoginVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.service.impl.LoginServiceImpl;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.OwnerService;
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MessageVO;
import egovframework.zieumtn.system.vo.PageVO;
import egovframework.zieumtn.system.vo.sysDeviceVO;
import net.sf.json.JSONObject;

import org.apache.poi.util.SystemOutLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class LoginController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "ownerService")
	private OwnerService ownerService;

	/** CommonService */
	@Resource(name = "commonService")
	private CommonService commonService;


	@Resource(name = "sysDeviceService")
	private SysDeviceService sysDeviceService;

	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;


	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login");

		//String userIp = loginService.getClientIp(request);
		//String regionData = loginService.getCountryCodeByIp(userIp);

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList",list);
		//mv.addObject("regionData", regionData);

		return mv;
	}

	@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST)
	public ModelAndView loginSuccess(LoginVO loginVO, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {

		System.out.println("로그인 프록: " +loginVO.getSessionCdNa());
		JSONObject message = messageService.getMessageObjectByUserRegion(loginVO.getSessionCdNa());

		try {

			LoginVO chk = loginService.loginCheck(loginVO);

			//추후 로그인 페이지에서 지역 선택해서 접속 필요
			/*AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			System.out.println("로그인 auth 확인 - proc" +authInfo );*/
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());


			if (chk == null) {
				ModelAndView mv = new ModelAndView("/login");
				mv.addObject("error", message.get("MSG00001"));        //아이디 또는 패스워드 틀림
				List<?> list = ownerService.getOpenList(null);
				mv.addObject("serviceList",list);
				return mv;
			} else {
				String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
				SimpleDateFormat dateChk = new SimpleDateFormat("yyyy-MM-dd");

				Date toDay = new Date(dateChk.parse(todayfm).getTime());
				Date endDt = new Date(dateChk.parse(chk.getEndDt()).getTime());
				Date useDt = new Date(dateChk.parse(chk.getUseDt()).getTime());

				int compare = endDt.compareTo(toDay);

				if (compare < 0) {
					ModelAndView mv = new ModelAndView("/login");

					mv.addObject("error", message.get("MSG00011")); // 사용기간 만료
					List<?> list = ownerService.getOpenList(null);
					mv.addObject("serviceList",list);
					return mv;
				} else if (!chk.getStatConfirm().contentEquals("1")) {
					ModelAndView mv = new ModelAndView("/login");
					mv.addObject("error", message.get("MSG00012"));  //사용 권한 없음
					List<?> list = ownerService.getOpenList(null);
					mv.addObject("serviceList",list);
					return mv;
				}

			}

			System.out.println("-----------------loginVO--------------");
			System.out.println(loginVO);
			System.out.println("-----------------loginVO--------------");

			AuthVO authVO = loginService.loginAuth(loginVO);


			if (authVO == null) {
				ModelAndView mv = new ModelAndView("/login");
				mv.addObject("error", message.get("MSG00002"));             //로그인 처리에 실패
				List<?> list = ownerService.getOpenList(null);
				mv.addObject("serviceList",list);
				return mv;
			}
			authVO.setSessionCoId(authVO.getCoId());
			authVO.setSessionCoNm(authVO.getCoNm());
			authVO.setSessionUserId(authVO.getUsrId());
			authVO.setSessionUserNm(authVO.getUsrNm());
			authVO.setSessionDeptNm(authVO.getDeptNm());
			authVO.setSessionCotelNo(authVO.getCotelNo());
			String apiKey = UUID.randomUUID().toString();
			authVO.setApiKey(apiKey);

			System.out.println("--------------------authVO-----------");
			System.out.println(authVO);
			System.out.println("--------------------authVO END-------");

			session.setAttribute("authInfo", authVO);

			CommonVO commonVo = new CommonVO();
			List<?> sampleList = commonService.selectCommonList(commonVo);
			commonService.insertLoginHist(authVO);
			commonService.insertApikey(authVO);

			ModelAndView mv = new ModelAndView("/cmmn/loginSuccess");
			// ------------------------------------------------------------------------------------------

			// 위험구분 ( ex> 포트홀, 수직균열, 수평균열, 피로균열 )
			CodeVO codeVO_DV = new CodeVO();
			codeVO_DV.setSessionCoId(authVO.getCoId());
			codeVO_DV.setCdgrpId("DV");
			List<?> codeListDv = codeService.selectCommCodeList(codeVO_DV);

			session.setAttribute("codeListDv", codeListDv);

			// 위험도 ( ex> lv1, lv2, lv3, lv4 )
			CodeVO codeVO_LV = new CodeVO();

			codeVO_LV.setSessionCoId(authVO.getCoId());
			codeVO_LV.setCdgrpId("LV");
			List<?> codeListLv = codeService.selectCommCodeList(codeVO_LV);

			session.setAttribute("codeListLv", codeListLv);

			// 위험도 ( ex> lv1, lv2, lv3, lv4 )
			CodeVO codeVO_SD = new CodeVO();
			codeVO_SD.setSessionCoId(authVO.getCoId());
			codeVO_SD.setCdgrpId("SD");
			List<?> codeListSd = codeService.selectCommCodeList(codeVO_SD);

			session.setAttribute("codeListSd", codeListSd);

			// 개월별 색상 ( ex> lv1, lv2, lv3, lv4 )
			CodeVO codeVO_MC = new CodeVO();
			codeVO_MC.setSessionCoId(authVO.getCoId());
			codeVO_MC.setCdgrpId("MC");
			List<?> codeListMc = codeService.selectCommCodeList(codeVO_MC);

			session.setAttribute("codeListMc", codeListMc);


			// 국가코드 ( )
			CodeVO codeVO_NA = new CodeVO();
			codeVO_NA.setSessionCoId(authVO.getCoId());
			codeVO_NA.setCdgrpId("NA");
			List<?> codeListNa = codeService.selectCommCodeList(codeVO_NA);

			session.setAttribute("codeListNa", codeListNa);

			// ------------------------------------------------------------------------------------------

			mv.addObject("resultList", sampleList);
			mv.addObject("menuList", authVO.getMenuList());

			return mv;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));           //로그인 처리에 실패
			return mv;
		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));           //로그인 처리에 실패
			return mv;
		}

	}
/*
	@RequestMapping(value = "/loginGPKI.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView loginGPKI(GPKIVO gpkiVO, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {
		JSONObject message = messageService.getMessageObject();
		try {

			AuthVO authVO = loginService.loginGPKI();

			System.out.println("Authvo 확인-gpki"+ authVO);

			if (gpkiVO.getSignType() != null && authVO.getUsrId().equals("")) {
				ModelAndView mv = new ModelAndView("/login");
				List<?> list = ownerService.getOpenList(null);
				mv.addObject("serviceList",list);
				mv.addObject("error", message.get("MSG00002"));
				return mv;
			}
			authVO.setSessionCoId(authVO.getCoId());
			authVO.setSessionCoNm(authVO.getCoNm());
			authVO.setSessionUserId(authVO.getUsrId());
			authVO.setSessionUserNm(authVO.getUsrNm());
			authVO.setSessionDeptNm(authVO.getDeptNm());
			authVO.setSessionCotelNo(authVO.getCotelNo());
			session.setAttribute("authInfo", authVO);

			CommonVO commonVo = new CommonVO();
			List<?> sampleList = commonService.selectCommonList(commonVo);
			commonService.insertLoginHist(authVO);
			ModelAndView mv = new ModelAndView("/cmmn/loginSuccess");
			mv.addObject("resultList", sampleList);
			mv.addObject("menuList", authVO.getMenuList());

			return mv;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));
			return mv;
		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));
			return mv;
		}

	}*/

	@RequestMapping(value = "/logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout(LoginVO loginVO, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
		if (authInfo!= null) {
			System.out.println("-----------------API키삭제-----------------");
			loginVO.setCoId(authInfo.getCoId());
			loginVO.setUsrId(authInfo.getUsrId());
			System.out.println(loginVO);
			commonService.deleteApiKey(loginVO);
			System.out.println("--------------API키삭제완료-----------------");

		}
		response.sendRedirect("/login.do");
		session.removeAttribute("authInfo");
		ModelAndView mv = new ModelAndView("/login");
		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList",list);
		return mv;

	}


	@RequestMapping(value = "/sessionChange.do", method = RequestMethod.POST)
	public ModelAndView sessionChange(LoginVO loginVO, HttpSession session,
			HttpServletResponse response) throws Exception {
		JSONObject message = messageService.getMessageObject();

		try {
			AuthVO newAuthVO = loginService.changeAuth(loginVO);
			/*
			if (authVO.getUsrId().equals("")) {
				ModelAndView mv = new ModelAndView("/login");
				mv.addObject("error", "로그인 실패");
				return mv;
			}
			*/
			AuthVO authVO = (AuthVO) session.getAttribute("authInfo");
			if (authVO.getUsrId().equals("")) {
				ModelAndView mv = new ModelAndView("/login");
				List<?> list = ownerService.getOpenList(null);
				mv.addObject("serviceList",list);
				mv.addObject("error", "세션 오류");
				return mv;
			}
			authVO.setSessionCoId(newAuthVO.getCoId());
			authVO.setSessionCoNm(newAuthVO.getCoNm());
			authVO.setWtX(newAuthVO.getWtX());
			authVO.setWtY(newAuthVO.getWtY());
			authVO.setWtNm(newAuthVO.getWtNm());
			authVO.setMapX(newAuthVO.getMapX());
			authVO.setMapY(newAuthVO.getMapY());

			session.setAttribute("authInfo", authVO);

			CommonVO commonVo = new CommonVO();
			List<?> sampleList = commonService.selectCommonList(commonVo);
			//commonService.insertLoginHist(authVO);
			ModelAndView mv = new ModelAndView("/cmmn/loginSuccess");
			mv.addObject("resultList", sampleList);
			mv.addObject("menuList", authVO.getMenuList());

			return mv;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));
			return mv;
		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
			ModelAndView mv = new ModelAndView("/login");
			List<?> list = ownerService.getOpenList(null);
			mv.addObject("serviceList",list);
			mv.addObject("error", message.get("MSG00002"));
			return mv;
		}

	}

	@RequestMapping(value = "/languageChange.do", method = RequestMethod.POST)
	public void languageChange(LoginVO loginVO, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {
		try {

			AuthVO authVO = (AuthVO) session.getAttribute("authInfo");

			if (authVO.getUsrId().equals("")) {
				ModelAndView mv = new ModelAndView("/login");
				List<?> list = ownerService.getOpenList(null);
				mv.addObject("serviceList",list);
				mv.addObject("error", "세션 오류");

			}

			AuthVO newAuthVO = loginService.changeLanguageMenu(loginVO);

			authVO.setChangedCdNa(loginVO.getChangedCdNa());
			authVO.setMenuList(newAuthVO.getMenuList());
			authVO.setFavList(newAuthVO.getFavList());

		} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());

			List<?> list = ownerService.getOpenList(null);

		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());

			List<?> list = ownerService.getOpenList(null);

		}

	}

	/*@RequestMapping(value = "/checkUserCdna.do", method = RequestMethod.POST)
	public void checkUserCdna(String region, HttpServletResponse response) throws Exception {

	       System.out.println("지역 확인: " + region);
	      // ModelAndView mv = new ModelAndView("/login");
	      // mv.addObject("regionData", region);

	       response.setContentType("text/html; charset=UTF-8");
			JSONObject jsonObject = new JSONObject();

			jsonObject.put("region", region);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

	}*/

}
