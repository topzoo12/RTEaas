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
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.AuthgrpVO;
import egovframework.zieumtn.system.vo.MenuVO;
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
public class UserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "emailService")
	private EmailService emailService;

	/** EgovSampleService */
	@Resource(name = "authgrpService")
	private AuthgrpService authgrpService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name = "messageService")
	private MessageService messageService;


	@RequestMapping(value = "/com/userList.do")
	public ModelAndView userList(@ModelAttribute("userVO") UserVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> userList = userService.selectUserList(searchVO);

		ModelAndView mv = new ModelAndView("/com/userList");

		mv.addObject("resultList", userList);
		mv.addObject("totCnt", userList.size());

		AuthgrpVO select1VO = new AuthgrpVO();
		select1VO.setSessionCoId(authInfo.getSessionCoId());

		List<?> selectList1 = authgrpService.selectAuthgrpCodeList(select1VO);

		mv.addObject("selectList1", selectList1);

		LocalDateTime nowDateTime = LocalDateTime.now();

		int y = nowDateTime.getYear();
		int m = nowDateTime.getMonthValue();
		int d = nowDateTime.getDayOfMonth();

		String mm = "00";
		String dd = "00";

		if(m<10) {
			mm = "0"+m;
		} else {
			mm = ""+m;
		}

		if(d<10) {
			dd = "0"+d;
		} else {
			dd = ""+d;
		}

		mv.addObject("todayDt", y+"-"+mm+"-"+dd);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/com/userList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getUserList.do", method=RequestMethod.POST)
	public void getUserList(@ModelAttribute("userVO") UserVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> userList = userService.selectUserList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", userList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getUserIdCheck.do", method=RequestMethod.POST)
	public void getUserIdCheck(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response) throws Exception {
		try {
			int iResult = userService.getUserIdCheck(paramVO);
			//List<UserVO> admin = (List<UserVO>) userService.selectAdminList(paramVO);
			int rs = 0;

			if(iResult > 0) {
				rs = 1;
			//} else if(admin.size() <= 0){
				//rs = -1;
			} else {
				rs = 0;
			}

			response.setContentType("text/html; charset=UTF-8");
			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", rs);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/insertUser.do", method=RequestMethod.POST)
	public void insertUser(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = userService.insertUser(paramVO);

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

	@RequestMapping(value = "/reqUser.do", method=RequestMethod.POST)
	public void reqUser(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response) throws Exception {
		try {
			int iResult = userService.reqUser(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

			List<UserVO> adminList = (List<UserVO>) userService.selectAdminList(paramVO);
/*			String mailMessage =
					"<strong style=\"display: block;color: #0475f4;\">계정신청 정보를</strong>알려 드립니다.</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "아래의 사용자가 계정신청 되었습니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">사용자 ID</span> "+paramVO.getUsrId()+"</p>";

			for(UserVO admin : adminList){
				EmailVO emailVO = new EmailVO();
				emailVO.setReceiveMail(admin.getUsrId());
				emailVO.setSenderMail(paramVO.getUsrId());
				emailVO.setSubject("[ICDP]계정신청");

				emailVO.setMessage(mailMessage);
				emailService.sendMail(emailVO);
			}*/



		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/updateUser.do", method=RequestMethod.POST)
	public void updateUser(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = userService.updateUser(paramVO);

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

	@RequestMapping(value = "/updateUserStat.do", method=RequestMethod.POST)
	public void updateUserStat(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = userService.updateUserStat(paramVO);

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

	@RequestMapping(value = "/approveUser.do", method=RequestMethod.POST)
	public void approveUser(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			EmailVO emailVO = new EmailVO();
			emailVO.setReceiveMail(paramVO.getUsrId());
			emailVO.setSenderMail(authInfo.getSessionUserId());
			emailVO.setSubject("[IRSM]계정승인");
			String mailMessage =
					"<strong style=\"display: block;color: #0475f4;\">계정승인 정보를</strong>알려 드립니다.</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "아래의 사용자가 계정승인 되었습니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">사용자 ID</span> "+paramVO.getUsrId()+"</p>";


			emailVO.setMessage(mailMessage);
			emailService.sendMail(emailVO);

			int iResult = userService.approveUser(paramVO);

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

	@RequestMapping(value = "/updateUserPwd.do", method=RequestMethod.POST)
	public void updateUserPwd(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			int iResult = userService.updateUserPwd(paramVO);

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
	@RequestMapping(value = "/updateUserPwdReset.do", method=RequestMethod.POST)
	public void updateUserPwdReset(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			String password = "abc1234!";
			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			//paramVO.setSectNo(randomWord());
			paramVO.setSectNo(password);
			int iResult = userService.updateUserPwd(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

			EmailVO emailVO = new EmailVO();
			emailVO.setReceiveMail(paramVO.getUsrId());
			emailVO.setSenderMail(authInfo.getSessionUserId());

			emailVO.setSubject("[ICDP]비밀번호초기화");
			String mailMessage =
					"<strong style=\"display: block;color: #0475f4;\">비밀번호초기화 정보를</strong>알려 드립니다.</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "비밀번호가 초기화 되었습니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">비밀번호</span> "+paramVO.getSectNo()+"</p>";

			emailVO.setMessage(mailMessage);

			//emailVO.setMessage(paramVO.getSectNo());
			emailService.sendMail(emailVO);
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}


	// 비밀번호 초기화 후 이메일 전송
	@RequestMapping(value = "/resetPwd.do", method=RequestMethod.POST)
	public void resetPwd(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {


			int chkResult =  userService.chkResetPwd(paramVO);


			if(chkResult == 0 ) {

				AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
				paramVO.setSessionCoId(authInfo.getSessionCoId());
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				response.setContentType("text/html; charset=UTF-8");

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00007").toString()));

				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());

			} else {
				paramVO.setSectNo(randomWord());
				int iResult = userService.resetPwd(paramVO);
				// 비밀번호가 바뀌지 않도록 주석처리
				//int iResult = 1;
				if (iResult > 0 ) {

				EmailVO emailVO = new EmailVO();
				emailVO.setReceiveMail(paramVO.getUsrId());
				emailVO.setSenderMail("icdp@nflux.co.kr");

				emailVO.setSubject("[ICDP]비밀번호초기화");
				/*String mailMessage =
						"<strong style=\"display: block;color: #0475f4;\">비밀번호초기화 정보를</strong>알려 드립니다.</p>"
						+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
						+ "비밀번호가 초기화 되었습니다.</p>"
						+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
						+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">비밀번호</span> "+paramVO.getSectNo()+"</p>";
				*/

				String mailMessage =
						"<table style=\"Margin:0;background:#f0f1f3;border-collapse:collapse;border-spacing:0;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;height:100%;line-height:1.5;margin:0;padding:0;text-align:left;vertical-align:top;width:100%\"><tbody>\r\n"
						+ "    <tr style=\"padding:0;text-align:left;vertical-align:top\"><td align=\"center\" valign=\"top\" style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;margin:0;mso-line-height-rule:exactly;padding:0;\">\r\n"
						+ "    <center style=\"width:100%\">\r\n"
						+ "        <!-- 여백 -->\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"24\">&nbsp;</td></tr></tbody></table> \r\n"
						+ "        <!-- 로고 -->\r\n"
						+ "        <table align=\"center\" style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;margin:0;mso-line-height-rule:exactly;padding:0;\"><table align=\"center\" style=\"Margin:0 auto;background:0 0;border-collapse:collapse;border-spacing:0;margin:0 auto;padding:0;text-align:inherit;vertical-align:top;width:580px\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td><h1 style=\"Margin:0;color:1A1A22;font-family:'Pretendard Variable','Noto Sans KR','Helvetica Neue',Helvetica,'Cera Round Pro','Proxima Nova Soft','Proxima Nova',Arial,sans-serif;font-size:36px;font-weight:900;line-height:2.5;margin:0;margin-bottom:0;padding:0;text-align:center;word-wrap:normal\">RTEaaS</h1></td></tr></tbody></table></td></tr></tbody></table>\r\n"
						+ "        <!-- 본문 -->\r\n"
						+ "        <table align=\"center\" style=\"Margin:0 auto;border-collapse:collapse;border-spacing:0;float:none;margin:0 auto;padding:0;text-align:center;vertical-align:top;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;hyphens:auto;line-height:1.5;margin:0;padding:0;text-align:left;vertical-align:top;word-wrap:break-word\">\r\n"
						+ "        <table align=\"center\" style=\"Margin:0 auto;background:#fff;border-collapse:collapse;border-radius:16px;border-spacing:0;margin:0 auto;padding:0;text-align:inherit;vertical-align:top;width:580px\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;hyphens:auto;line-height:1.5;margin:0;padding:0;text-align:left;vertical-align:top;word-wrap:break-word\">\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;display:table;padding:0;position:relative;text-align:left;vertical-align:top;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><th colspan=\"1\" rowspan=\"1\" style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0 auto;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;hyphens:auto;line-height:1.5;margin:0 auto;padding:0;padding-bottom:32px;padding-left:42px;padding-right:42px;text-align:left;vertical-align:top;width:538px;word-wrap:break-word\"><table style=\"border-collapse:collapse;border-spacing:0;padding:0;text-align:left;vertical-align:top;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><th colspan=\"1\" rowspan=\"1\" style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;hyphens:auto;line-height:1.5;margin:0;padding:0;text-align:left;vertical-align:top;word-wrap:break-word\">\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"56\">&nbsp;</td></tr></tbody></table> \r\n"
						+ "        <!-- CONTENT START -->\r\n"
						+ "        <h3 style=\"Margin:0;color:inherit;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:28px;font-weight:700;line-height:1.5;margin:0;margin-bottom:32px;padding:0;text-align:center;word-wrap:normal\"><strong style=\"color: #0475f4\">비밀번호 초기화 정보</strong>를<br>알려 드립니다.</h3>\r\n"
						+ "        <p style=\"Margin:0;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;line-height:1.5;margin:0;margin-bottom:10px;padding:0;text-align:center\">비밀번호가 초기화 되었습니다.</p>   						\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"16\">&nbsp;</td></tr></tbody></table> 						\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;text-align:left;vertical-align:top;width:100%;background:#f0f1f3;border-collapse:collapse;border-radius:10px\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:20px;font-weight:600;hyphens:auto;line-height:16px;margin:0;mso-line-height-rule:exactly;padding:0;text-align:center;vertical-align:top;word-wrap:break-word;\">\r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"24\">&nbsp;</td></tr></tbody></table> \r\n"
						+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%;\"><tbody><tr><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:20px;font-weight:600;hyphens:auto;line-height:16px;margin:0;mso-line-height-rule:exactly;padding:0;text-align:center;vertical-align:top;word-wrap:break-word;\">비밀번호 <strong style=\"color: #0475f4;margin-left: 16px\">"
						+ paramVO.getSectNo()
						+ "</strong></td></tr></tbody></table>";









				emailVO.setMessage(mailMessage);

				emailService.sendMail(emailVO);

				response.setContentType("text/html; charset=UTF-8");

				AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00009").toString()));

				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());


				} else {
					throw new Exception();
				}
			}



			//return new ReturnVO(0000, null);
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9002, message.get("MSG00008").toString()));

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
			jsonObject.put("result", new ReturnDTO(9002, message.get("MSG00005").toString()));

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}


	}
	static String randomWord(){
		java.util.Random rng = new java.util.Random();
		//double r = rng.nextInt(10);

		int length = (int)(rng.nextInt(10))+10;

        StringBuffer newWord = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int mixed = (int)(rng.nextInt(3));
            switch(mixed) {
                case 0:
                    String lowerRandom ="";
                    char lowerCh = (char)((int)(rng.nextInt(25)) + 97);
                    lowerRandom += lowerCh;
                    newWord.append(lowerRandom);
                    break;
                case 1:
                	String upperRandom ="";
                    char upperCh = (char)((int)(rng.nextInt(25)) + 65);
                    upperRandom += upperCh;
                    newWord.append(upperRandom);
                    break;
                case 2:
                	String numRandom ="";
                    char ch = (char)((int)(rng.nextInt(10)) + 48);
                    numRandom += ch;
                    newWord.append(numRandom);
                    break;
                default:
                    break;
            }
        }

        return newWord.toString();
    }
	@RequestMapping(value = "/deleteUser.do", method=RequestMethod.POST)
	public void deleteUser(@ModelAttribute("userVO") UserVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = userService.deleteUser(paramVO);

			if(iResult >0){
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00010").toString()));
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
}
