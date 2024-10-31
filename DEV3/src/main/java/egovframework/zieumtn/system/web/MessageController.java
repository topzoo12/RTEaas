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
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MessageVO;
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
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2009.03.16 최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MessageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "codeService")
	private CodeService codeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 글 목록을 조회한다. (pageing)
	 *
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/messageList.do")
	public ModelAndView messageList(@ModelAttribute("messageVO") MessageVO searchVO, ModelMap model,
			HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> messageList = messageService.selectMessageList(searchVO);

		ModelAndView mv = new ModelAndView("/sys/messageList");

		mv.addObject("resultList", messageList);
		mv.addObject("totCnt", messageList.size());

		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("MD");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());

		List<?> selectList1 = codeService.selectCommCodeList(select1VO);

		System.out.println("************************************************************************************");
		System.out.println(selectList1);

		mv.addObject("selectList1", selectList1);
/*
		CodeVO select2VO = new CodeVO();
		select2VO.setCdgrpId("GA");
		select2VO.setSessionCoId(authInfo.getSessionCoId());
		select2VO.setSessionUserId(authInfo.getSessionUserId());*/

		// List<?> selectList2 = codeService.selectCommCodeList(select2VO);

		// mv.addObject("selectList2", selectList2);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for (LoginMenuVO fav : favList) {
			if (fav.getSrnUrl().equals("/sys/messageList")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/getMessageList.do", method = RequestMethod.POST)
	public void getMessageList(@ModelAttribute("messageVO") MessageVO searchVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> messageList = messageService.selectMessageList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", messageList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/insertMessage.do", method = RequestMethod.POST)
	public void insertMessage(@ModelAttribute("messageVO") MessageVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = messageService.insertMessage(paramVO);

			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			if (iResult > 0) {
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

			JSONObject jsonObject = new JSONObject();

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}

	@RequestMapping(value = "/updateMessage.do", method = RequestMethod.POST)
	public void updateMessage(@ModelAttribute("messageVO") MessageVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = messageService.updateMessage(paramVO);

			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			if (iResult > 0) {
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

/*	@RequestMapping(value = "/deleteMessage.do", method = RequestMethod.POST)
	public void deleteMessage(@ModelAttribute("messageVO") MessageVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		//JSONObject message = messageService.getMessageObject();

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = messageService.deleteMessage(paramVO);

			JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			if (iResult > 0) {
				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00010").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			paramVO.setSessionCoId(authInfo.getSessionCoId());
			JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			paramVO.setSessionCoId(authInfo.getSessionCoId());
			JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}*/
}
