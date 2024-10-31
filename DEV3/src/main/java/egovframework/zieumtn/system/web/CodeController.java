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
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.vo.CodeVO;
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
public class CodeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "commonService")
	private CommonService commonService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name = "messageService")
	private MessageService messageService;


	@RequestMapping(value = "/sys/codeList.do")
	public ModelAndView codeList(@ModelAttribute("codeVO") CodeVO searchVO, ModelMap model, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/sys/codeList");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());


			List<CodeVO> codeList1 = (List<CodeVO>) codeService.selectCodeGroupList(searchVO);

			List<?> coList = commonService.selectCoList();
			mv.addObject("selectListCo", coList);

			mv.addObject("resultList1", codeList1);
			mv.addObject("totCnt1", codeList1.size());
			searchVO.setCdgrpId(codeList1.get(0).getCdgrpId());

			List<?> codeList2 = codeService.selectCodeList(searchVO);

			mv.addObject("resultList2", codeList2);
			mv.addObject("totCnt2", codeList2.size());

			CodeVO selectVO = new CodeVO();
			selectVO.setCdgrpId("GA");
			selectVO.setSessionCoId(authInfo.getSessionCoId());
			selectVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> selectList1 = codeService.selectCommCodeList(selectVO);

			mv.addObject("selectList1", selectList1);

			List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
			for (LoginMenuVO fav : favList) {
				if (fav.getSrnUrl().equals("/sys/codeList")) {
					mv.addObject("fav", "message");
				}
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}

		return mv;
	}

	@RequestMapping(value = "/getCodeGroupList.do", method = RequestMethod.POST)
	public void getCodeGroupList(@ModelAttribute("codeVO") CodeVO searchVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<CodeVO> codeList = (List<CodeVO>) codeService.selectCodeGroupList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", codeList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/getCodeList.do", method = RequestMethod.POST)
	public void getCodeList(@ModelAttribute("codeVO") CodeVO searchVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<CodeVO> codeList = (List<CodeVO>) codeService.selectCodeList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", codeList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/getCommCodeList.do", method = RequestMethod.POST)
	public void getCommCodeList(@ModelAttribute("codeVO") CodeVO searchVO, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<CodeVO> codeList = (List<CodeVO>) codeService.selectCommCodeList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", codeList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/insertCodeGroup.do", method = RequestMethod.POST)
	public void insertCodeGroup(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());
			List<CodeVO> checkList = codeService.checkCodeGroup(paramVO);

			int iResult = 0;

			response.setContentType("text/html; charset=UTF-8");
			JSONObject jsonObject = new JSONObject();

			if (checkList.size() > 0) {
				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				iResult = -1000;
				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00004").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());

			} else {
				iResult = codeService.insertCodeGroup(paramVO);

				if (iResult > 0) {
					//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
					JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

					jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00003").toString()));
					PrintWriter out = response.getWriter();
					out.write(jsonObject.toString());
				} else {
					throw new Exception();
				}
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

	@RequestMapping(value = "/updateCodeGroup.do", method = RequestMethod.POST)
	public void updateCodeGroup(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			int iResult = codeService.updateCodeGroup(paramVO);

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

	@RequestMapping(value = "/deleteCodeGroup.do", method = RequestMethod.POST)
	public void deleteCodeGroup(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = codeService.deleteCodeGroup(paramVO);
			if (iResult > 0) {
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

	@RequestMapping(value = "/insertCode.do", method = RequestMethod.POST)
	public void insertCode(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response, HttpSession session)
			throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			List<CodeVO> checkList = codeService.checkCode(paramVO);

			int iResult = 0;

			if (checkList.size() > 0) {
				iResult = -1000;
			} else {
				iResult = codeService.insertCode(paramVO);
			}

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/updateCode.do", method = RequestMethod.POST)
	public void updateCode(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response, HttpSession session)
			throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			int iResult = codeService.updateCode(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}

	@RequestMapping(value = "/deleteCode.do", method = RequestMethod.POST)
	public void deleteCode(@ModelAttribute("codeVO") CodeVO paramVO, HttpServletResponse response, HttpSession session)
			throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = codeService.deleteCode(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());
		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());
		}
	}
}
