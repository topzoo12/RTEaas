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
package egovframework.zieumtn.system.web;

import java.io.PrintWriter;
import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.AuthgrpMenuService;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MenuService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.OwnerService;
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.vo.sysDeviceVO;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2023.09.19 최초생성
 *
 * @author hyoseon
 * @since 2023.09.19
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class SysDeviceController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "sysDeviceService")
	private SysDeviceService sysDeviceService;

	@Resource(name = "codeService")
	private CodeService codeService;
	@Resource(name = "menuService")
	private MenuService menuService;
	@Resource(name = "authgrpService")
	private AuthgrpService authgrpService;
	@Resource(name = "authgrpMenuService")
	private AuthgrpMenuService authgrpMenuService;
	@Resource(name = "emailService")
	private EmailService emailService;

	@Resource(name = "ownerService")
	private OwnerService ownerService;


	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "messageService")
	private MessageService messageService;


	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/sys/deviceList.do")
	public ModelAndView deviceList(@ModelAttribute("serviceVO") sysDeviceVO searchVO, ModelMap model,
			HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> deviceList = sysDeviceService.selectDeviceList(searchVO);


		ModelAndView mv = new ModelAndView("/sys/deviceList");

		mv.addObject("resultList", deviceList);
		mv.addObject("totCnt", deviceList.size());

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList", list);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for (LoginMenuVO fav : favList) {
			if (fav.getSrnUrl().equals("/sys/deviceList")) {
				mv.addObject("fav", "message");
			}
		}

		System.out.println(mv);

		return mv;
	}

	@RequestMapping(value = "/getSysDeviceList.do", method = RequestMethod.POST)
	public void getSysDeviceList(@ModelAttribute("serviceVO") sysDeviceVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setCoId(authInfo.getSessionCoId());
			List<?> deviceList = sysDeviceService.selectDeviceList(searchVO);

			System.out.println(searchVO);
			System.out.println("-----------------------------------------------");

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", deviceList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/insertSysDevice.do", method = RequestMethod.POST)
	public void insertSysDevice(@ModelAttribute("serviceVO") sysDeviceVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			System.out.println(paramVO);
			int iResult = sysDeviceService.insertSysDevice(paramVO);

			if (iResult > 0) {
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00003").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}


	@RequestMapping(value = "/updateSysDevice.do", method = RequestMethod.POST)
	public void updateSysDevice(@ModelAttribute("serviceVO") sysDeviceVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			System.out.println(paramVO);
			int iResult = sysDeviceService.updateSysDevice(paramVO);

			System.out.println("디바이스 auth "+ authInfo);


			if (iResult > 0) {
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00006").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}

	//신규 등록시 mac 주소 unique 확인
	@RequestMapping(value = "/getMacAddrList.do", method = RequestMethod.POST)
	public void getMacAddrList(@ModelAttribute("serviceVO") sysDeviceVO searchVO, HttpServletResponse response) throws Exception {
		try {

			List<?> macAddrList = sysDeviceService.selectMacAddrList(searchVO);

			System.out.println("맥주소 체크 컨트롤러" + searchVO);
			System.out.println("-----------------------------------------------");

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", macAddrList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

/* 삭제 기능 제거
	 @RequestMapping(value = "/deleteSysDevice.do", method = RequestMethod.POST)
	public void deleteSysDevice(@ModelAttribute("serviceVO") sysDeviceVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			System.out.println(paramVO);
			int rst = sysDeviceService.deleteSysDevice(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();

			System.out.println("RST >>>>>>>>>>>>" + rst);
			if(rst == -1) {
				// 에러메세지 전송
				jsonObject.put("result", commonService.getMsg("MSG00004"));
			} else if (rst == 1) {
				// 등록메세지 전송
				jsonObject.put("result", commonService.getMsg("MSG00006"));
			} else {
				// 알수없는 에러 전송
				jsonObject.put("result", commonService.getMsg("MSG00005"));
			}

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}
*/

}
