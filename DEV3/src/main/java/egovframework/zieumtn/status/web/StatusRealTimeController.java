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
package egovframework.zieumtn.status.web;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.device.service.DeviceService;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.statis.service.StatisDayService;
import egovframework.zieumtn.statis.service.StatisPeriodService;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisDayVO;
import egovframework.zieumtn.statis.vo.StatisPeriodVO;
import egovframework.zieumtn.statis.vo.StatisTimeVO;
import egovframework.zieumtn.status.service.StatusRealTimeService;
import egovframework.zieumtn.status.vo.StatusRealTimeChartVO;
import egovframework.zieumtn.status.vo.StatusRealTimeVO;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.AuthgrpVO;
import egovframework.zieumtn.system.vo.CodeVO;
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
public class StatusRealTimeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatusRealTimeController.class);

	/** EgovSampleService */
	@Resource(name = "statusRealTimeService")
	private StatusRealTimeService statusRealTimeService;

	@Resource(name = "deviceService")
	private DeviceService deviceService;

	/** EgovSampleService */
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
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/status/statusRealTimeList.do")
	public ModelAndView statusRealTimeList(@ModelAttribute("statusRealTimeVO") StatusRealTimeVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		CodeVO codeVO = new CodeVO();
		codeVO.setCdgrpId("BA");
		codeVO.setSessionCoId(authInfo.getSessionCoId());
		codeVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> codeList = codeService.selectCommCodeList(codeVO);

		List<?> statusList = statusRealTimeService.selectStatusRealTimeList(searchVO);
		FcltsInfoVO fcltsVO = new FcltsInfoVO();
		fcltsVO.setSessionCoId(authInfo.getSessionCoId());

		List<?> deviceList = deviceService.selectDeviceCodeList(fcltsVO);

		ModelAndView mv = new ModelAndView("/status/statusRealTimeList");

		LocalDateTime nowDateTime = LocalDateTime.now();

		int yy = nowDateTime.getYear();
		int mm = nowDateTime.getMonthValue();
		int dd = nowDateTime.getDayOfMonth();
		int hh = nowDateTime.getHour();
		int mi = nowDateTime.getMinute();

		String mmm = "00";
		String ddd = "00";

		String hhh = "00";
		String mii = "00";

		if(mm<10) {
			mmm = "0"+mm;
		} else {
			mmm = ""+mm;
		}

		if(dd<10) {
			ddd = "0"+dd;
		} else {
			ddd = ""+dd;
		}

		if(hh<10) {
			hhh = "0"+hh;
		} else {
			hhh = ""+hh;
		}

		if(mi<10) {
			mii = "0"+mi;
		} else {
			mii = ""+mi;
		}
		mv.addObject("resultList", statusList);
		mv.addObject("selectList1", deviceList);
		mv.addObject("selectList2", codeList);
		mv.addObject("year", yy);
		mv.addObject("month", mmm);
		mv.addObject("day", ddd);
		mv.addObject("hour", hhh);
		mv.addObject("minute", mii);

		CodeVO codeVO2 = new CodeVO();
		codeVO2.setCdgrpId("BA");
		codeVO2.setSessionCoId(authInfo.getSessionCoId());
		codeVO2.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList2 = codeService.selectCommCodeList(codeVO2);
		mv.addObject("ioList", codeList2);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/status/statusRealTimeList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getStatusRealTimeList.do", method=RequestMethod.POST)
	public void getStatusRealTimeList(@ModelAttribute("statusRealTimeVO") StatusRealTimeVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> statusList = statusRealTimeService.selectStatusRealTimeList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", statusList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getStatusRealTimeChartList.do", method=RequestMethod.POST)
	public void getStatusRealTimeChartList(@ModelAttribute("statusRealTimeChartVO") StatusRealTimeChartVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> statusList = statusRealTimeService.selectStatusRealTimeChartList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", statusList);

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
