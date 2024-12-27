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
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.AuthgrpMenuService;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MenuService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.OwnerService;
import egovframework.zieumtn.system.service.ServiceService;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.ServiceVO;
import egovframework.zieumtn.system.vo.UserVO;
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
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class ServiceController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "serviceService")
	private ServiceService serviceService;


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
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "ownerService")
	private OwnerService ownerService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	@Resource(name = "messageService")
	private MessageService messageService;


	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/serviceList.do")
	public ModelAndView serviceList(@ModelAttribute("serviceVO") ServiceVO searchVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> serviceList = serviceService.selectServiceList(searchVO);

		CodeVO codeVO = new CodeVO();

		codeVO.setSessionCoId(authInfo.getSessionCoId());
		codeVO.setCdgrpId("NA");
		List<?> naList = codeService.selectCommCodeList(codeVO);

		ModelAndView mv = new ModelAndView("/sys/serviceList");
		mv.addObject("resultList", serviceList);
		mv.addObject("totCnt", serviceList.size());
		mv.addObject("naList", naList);

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList",list);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/sys/serviceList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getServiceList.do", method=RequestMethod.POST)
	public void getServiceList(@ModelAttribute("serviceVO") ServiceVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> serviceList = serviceService.selectServiceList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", serviceList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getDistrictList.do", method=RequestMethod.POST)
	public void getDistrictList(@ModelAttribute("serviceVO") ServiceVO searchVO, HttpServletResponse response) throws Exception {
		try {
			List<?> list = serviceService.selectDistrictList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", list);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getStationList.do", method=RequestMethod.POST)
	public void getStationList(@ModelAttribute("serviceVO") ServiceVO searchVO, HttpServletResponse response) throws Exception {
		try {
			List<?> list = serviceService.selectStationList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", list);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/insertService.do", method=RequestMethod.POST)
	public void insertService(@ModelAttribute("serviceVO") ServiceVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			UserVO userVO = new UserVO();
			userVO.setSessionCoId(paramVO.getCoId());
			userVO.setCoId(paramVO.getCoId());
			userVO.setSessionUserId(paramVO.getSessionUserId());
			userVO.setUsrId(paramVO.getEmailAddr());
			userVO.setAuthgrpId(paramVO.getCoId() + "SAG201604000001"); // 시스템 관리자 그룹
			userVO.setUsrNm(paramVO.getRdrtrNm());
			userVO.setSectNo("zieum0514!");	// 초기 비밀번호
			userVO.setUseYn("1");
			userVO.setAdminYn("1");
			userVO.setStatConfirm("1");

			int grpIdResult = serviceService.checkDuplicateGrpId(paramVO);
			int userIdResult = userService.getUserIdCheck(userVO);

			// 서비스 그룹 아이디 & 관리자 이메일 중복 안된 경우
			 if (grpIdResult == 0 &&  userIdResult == 0) {
				String insertCoId = (String) serviceService.insertService(paramVO);
				//int iResult = serviceService.insertService(paramVO);

				//paramVO.setCoId(insertCoId);
				paramVO.setCoId(paramVO.getCoId());
				codeService.copyCode(paramVO);
				authgrpService.copyAuthgrp(paramVO);
				menuService.copyMenu(paramVO);
				authgrpMenuService.copyAuthgrpMenu(paramVO);

				int iResult = userService.insertUser(userVO);

				if(iResult > 0 ) {
					//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
					JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

					response.setContentType("text/html; charset=UTF-8");
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00003").toString()));
					PrintWriter out = response.getWriter();
					out.write(jsonObject.toString());
				}else {
					throw new Exception();
				}

			} else if (grpIdResult > 0) { //서비스 그룹 아이디 중복

				response.setContentType("text/html; charset=UTF-8");
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00015").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());

			} else if (userIdResult > 0) { //관리자 이메일 중복

				response.setContentType("text/html; charset=UTF-8");
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00016").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());

			}

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());


		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());

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
/*
	@RequestMapping(value = "/reqService.do", method=RequestMethod.POST)
	public void reqService(@ModelAttribute("serviceVO") ServiceVO paramVO, HttpServletResponse response) throws Exception {
		try {
			//paramVO.setReqServiceList(serviceData);
			String insertCoId = (String) serviceService.reqService(paramVO);
			//paramVO.setCoId(insertCoId);

			UserVO userVO = new UserVO();
			userVO.setUsrId("icdp@dobong.go.kr");
			List<UserVO> adminList = (List<UserVO>) userService.selectAdminList(userVO);
			String mailMessage =
					"<strong style=\"display: block;color: #0475f4;\">계정신청 정보를</strong>알려 드립니다.</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "신규 서비스 신청입니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">신청대상</span> "+paramVO.getReqServiceList()+"</p>";

			for(UserVO admin : adminList){
				EmailVO emailVO = new EmailVO();
				emailVO.setReceiveMail(admin.getUsrId());
				emailVO.setSenderMail("");
				emailVO.setSubject("[ICDP]신규 서비스신청");

				emailVO.setMessage(mailMessage);
				emailService.sendMail(emailVO);
			}

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", insertCoId);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
*/
/*	@RequestMapping(value = "/confirmService.do", method=RequestMethod.POST)
	public void confirmService(@ModelAttribute("serviceVO") ServiceVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			serviceService.confirmService(paramVO);
			//int iResult = serviceService.insertService(paramVO);

			codeService.copyCode(paramVO);
			authgrpService.copyAuthgrp(paramVO);
			menuService.copyMenu(paramVO);
			authgrpMenuService.confirmcopyAuthgrpMenu(paramVO);

			String[] arrService = paramVO.getReqServiceList().split(",");
			for (int i=0;i<arrService.length;i++) {
				AuthgrpMenuVO authgrpMenuVO = new AuthgrpMenuVO();
				authgrpMenuVO.setSessionCoId(authInfo.getSessionCoId());
				authgrpMenuVO.setSessionUserId(authInfo.getSessionUserId());
				authgrpMenuVO.setCoId(paramVO.getCoId());
				authgrpMenuVO.setMnuId(paramVO.getCoId()+arrService[i].substring(5));
				authgrpMenuVO.setRauthYn("1");
				authgrpMenuService.updateAuthgrpMenu(authgrpMenuVO);
			}

			UserVO userVO = new UserVO();
			userVO.setSessionCoId(paramVO.getCoId());
			userVO.setSessionUserId(paramVO.getSessionUserId());
			userVO.setUsrId(paramVO.getEmailAddr());
			userVO.setUsrNm(paramVO.getRdrtrNm());
			userVO.setSectNo(paramVO.getEmailAddr());
			userVO.setUseYn("1");
			userVO.setAdminYn("1");
			userVO.setStatConfirm("1");
			userService.insertUser(userVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", 1);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}*/
	@RequestMapping(value = "/updateService.do", method=RequestMethod.POST)
	public void updateService(@ModelAttribute("serviceVO") ServiceVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = serviceService.updateService(paramVO);

			if(iResult > 0 ) {
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


		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());


		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());

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

	@RequestMapping(value = "/deleteService.do", method=RequestMethod.POST)
	public void deleteService(@ModelAttribute("serviceVO") ServiceVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = serviceService.deleteService(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}


}

