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

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.PageService;
import egovframework.zieumtn.system.service.UsageDataService;
import egovframework.zieumtn.system.service.UsageLoginService;
import egovframework.zieumtn.system.service.UsageMenuService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.PageVO;
import egovframework.zieumtn.system.vo.UsageSearchVO;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

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
public class UsageDataController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/** EgovSampleService */
	@Resource(name = "usageDataService")
	private UsageDataService usageDataService;

	@Resource(name = "commonService")
	private CommonService commonService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/usageDataList.do")
	public ModelAndView usageDataList(@ModelAttribute("usageSearchVO") UsageSearchVO searchVO, ModelMap model, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/sys/usageDataList");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());
			searchVO.setCoId(authInfo.getSessionCoId());


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
			mv.addObject("fromDt", y+"-"+mm+"-01");
			mv.addObject("toDt", y+"-"+mm+"-"+dd);
			searchVO.setFromDt(y+"-"+mm+"-01");
			searchVO.setToDt(y+"-"+mm+"-"+dd);

			List<?> coList = commonService.selectCoList();
			mv.addObject("selectListCo", coList);

			List<?> dataList = usageDataService.selectUsageDataList(searchVO);

			mv.addObject("resultList1", dataList);
			mv.addObject("totCnt1", dataList.size());

			List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
			for(LoginMenuVO fav : favList){
				if(fav.getSrnUrl().equals("/sys/usageDataList")) {
					mv.addObject("fav", "message");
				}
			}

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}

		return mv;
	}


	@RequestMapping(value = "/getUsageDataList.do", method=RequestMethod.POST)
	public void getUsageDataList(@ModelAttribute("usageSearchVO") UsageSearchVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> dataList = usageDataService.selectUsageDataList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", dataList);

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
