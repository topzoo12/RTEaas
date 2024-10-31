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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.MenuService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.PageService;
import egovframework.zieumtn.system.service.ServiceService;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.PageVO;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
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
public class MenuController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "menuService")
	private MenuService menuService;

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

	@RequestMapping(value = "/com/menuList.do")
	public ModelAndView menuList(@ModelAttribute("menuVO") MenuVO searchVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());
		searchVO.setCoId(authInfo.getSessionCoId());

		List<?> menuList = menuService.selectMenuList(searchVO);

		ModelAndView mv = new ModelAndView("/com/menuList");

		List<?> coList = commonService.selectCoList();
		mv.addObject("selectListCo", coList);

		mv.addObject("resultList", menuList);
		mv.addObject("totCnt", menuList.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/com/menuList")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/getMenuList.do", method=RequestMethod.POST)
	public void getMenuList(@ModelAttribute("menuVO") MenuVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());
			searchVO.setCoId(authInfo.getSessionCoId());

			List<?> menuList = menuService.selectMenuList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", menuList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/insertMenu.do", method=RequestMethod.POST)
	public void insertMenu(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = menuService.insertMenu(paramVO);

			if(iResult > 0 ) {
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

	@RequestMapping(value = "/updateMenu.do", method=RequestMethod.POST)
	public void updatePage(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			System.out.println("업데이트 메뉴 param: " +paramVO);

			int iResult = menuService.updateMenu(paramVO);

			if(iResult >0){
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

	/*@RequestMapping(value = "/deleteMenu.do", method=RequestMethod.POST)
	public void deletePage(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		JSONObject message = messageService.getMessageObject();

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			int iResult = menuService.deleteMenu(paramVO);


			if(iResult >0){
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

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());


		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}*/
}
