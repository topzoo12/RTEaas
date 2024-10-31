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
import java.time.LocalDate;
import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
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
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.ServiceVO;
import egovframework.zieumtn.system.vo.UserVO;
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
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2024.09.19 최초생성
 *
 * @author pjj
 * @since 2024.09.19
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class UserFaqController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "emailService")
	private EmailService emailService;

	@Resource(name = "ownerService")
	private OwnerService ownerService;

	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "serviceService")
	private ServiceService serviceService;


	@RequestMapping(value = "/com/userFaq.do")
	public ModelAndView userFaqList(@ModelAttribute("UserVO") UserVO paramVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		paramVO.setSessionCoId(authInfo.getSessionCoId());
		paramVO.setCoId(authInfo.getSessionCoId());
		paramVO.setSessionUserId(authInfo.getSessionUserId());

		ModelAndView mv = new ModelAndView("/com/userFaq");

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList", list);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for (LoginMenuVO fav : favList) {
			if (fav.getSrnUrl().equals("/com/userFaq")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/sendFaq.do", method=RequestMethod.POST)
	public void sendFaq(@ModelAttribute("emailVO") EmailVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			EmailVO emailVO = new EmailVO();
			ServiceVO serviceVO = new ServiceVO();

			serviceVO.setCoId(authInfo.getCoId());
			ServiceVO managerInfo = serviceService.selectServiceManagerMail(serviceVO);

			String ReceiveMail = managerInfo.getEmailAddr();

			emailVO.setReceiveMail(ReceiveMail);
			emailVO.setSenderName(authInfo.getUsrNm());
			emailVO.setSenderMail(authInfo.getSessionUserId());

			String nowYear = String.valueOf(LocalDate.now().getYear());
			String nowMonth= String.valueOf(LocalDate.now().getMonthValue());
			String nowDay= String.valueOf(LocalDate.now().getDayOfMonth());

			emailVO.setSubject("[RTEaaS] " + nowYear + "년 " + nowMonth +"월 " + nowDay +"일 문의사항");

			String mailMessage =
					 "<p><strong style=\"color: #0475f4; display: inline;\">작성자 | </strong>"
					+ "<span style=\"display: inline;\">" + emailVO.getSenderName() + "</span></p>"
					+"<p><strong style=\"color: #0475f4; display: inline;\">등록자 ID | </strong>"
					+ "<span style=\"display: inline;\">" + emailVO.getSenderMail() + "</span></p>"
					+"<p><strong style=\"color: #666666; display: inline;\">제목 | </strong>"
					+ "<span style=\"display: inline;\">" + paramVO.getSubject() + "</span></p>"
					+"<p><strong style=\"color: #666666; display: inline;\">문의 내용 | </strong>"
				    + "<p style=\"margin: 30px 0 0; font-size: 14px; color: #666666;\">"
				    + paramVO.getMessage().replace("\n", "<br>") + "</p>"
				    + "</p>";

				 /*   + "<p style=\"margin: 40px 0 0; text-align: center; font-size: 18px; color: #0475f4; font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;\">"
				    + "<span style=\"color: #000;\">회신 email</span> " + paramVO.getSenderMail() + "</p>";*/

			emailVO.setMessage(mailMessage);

			emailService.sendFaqMail(emailVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00013").toString()));

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());
		}
	}

}
