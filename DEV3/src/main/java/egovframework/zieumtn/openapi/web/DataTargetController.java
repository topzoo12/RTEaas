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
package egovframework.zieumtn.openapi.web;

import java.io.PrintWriter;
import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.openapi.service.DataTargetService;
import egovframework.zieumtn.openapi.vo.DataTargetVO;
import egovframework.zieumtn.statis.vo.StatisAreaVO;
import egovframework.zieumtn.statis.vo.StatisDayVO;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MenuService;
import egovframework.zieumtn.system.service.PageService;
import egovframework.zieumtn.system.vo.CodeVO;
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
public class DataTargetController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "dataTargetService")
	private DataTargetService dataTargetService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/openapi/dataTargetList.do")
	public ModelAndView dataTargetList(@ModelAttribute("dataTargetVO") DataTargetVO searchVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> list = dataTargetService.selectDataTargetList(searchVO);

		ModelAndView mv = new ModelAndView("/openapi/dataTargetList");

		CodeVO selectVO = new CodeVO();
		selectVO.setCdgrpId("AA");
		selectVO.setSessionCoId(authInfo.getSessionCoId());
		selectVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> selectList1 = codeService.selectCommCodeList(selectVO);

		mv.addObject("resultList", list);
		mv.addObject("totCnt", list.size());

		mv.addObject("selectList1", selectList1);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/openapi/dataTargetList")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/getDataTargetList.do", method=RequestMethod.POST)
	public void getStatisDayList(@ModelAttribute("dataTargetVO") DataTargetVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> list = dataTargetService.selectDataTargetList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", list);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		} catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}


	@RequestMapping(value = "/updateDataTarget.do", method=RequestMethod.POST)
	public void updateDataTargetList(@ModelAttribute("dataTargetVO") DataTargetVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = dataTargetService.updateDataTarget(paramVO);

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
