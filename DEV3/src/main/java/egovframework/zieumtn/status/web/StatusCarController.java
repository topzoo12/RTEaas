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
import egovframework.zieumtn.status.service.StatusCarService;
import egovframework.zieumtn.status.service.StatusRealTimeService;
import egovframework.zieumtn.status.service.StatusRunningService;
import egovframework.zieumtn.status.vo.StatusCarVO;
import egovframework.zieumtn.status.vo.StatusRealTimeVO;
import egovframework.zieumtn.status.vo.StatusRunningVO;
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
public class StatusCarController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatusCarController.class);

	/** EgovSampleService */
	@Resource(name = "statusCarService")
	private StatusCarService statusCarService;

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
	@RequestMapping(value = "/status/statusCarList.do")
	public ModelAndView statusCarList(@ModelAttribute("statusCarVO") StatusCarVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		ModelAndView mv = new ModelAndView("/status/statusCarList");

		List<StatusCarVO> carList = (List<StatusCarVO>) statusCarService.selectStatusCarList(searchVO);

		mv.addObject("resultList1", carList);
		StatusCarVO vo = new StatusCarVO();
		if(carList.size()>0) {
			vo.setSessionCoId(authInfo.getSessionCoId());
			vo.setSessionUserId(authInfo.getSessionUserId());
			vo.setCarNo(carList.get(0).getCarNo());

			List<?> detailList = statusCarService.selectStatusCarDetailList(vo);
			mv.addObject("resultList2", detailList);
		}

		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("CA");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());

		List<?> selectList1 = codeService.selectCommCodeList(select1VO);
		mv.addObject("selectList1", selectList1);

		CodeVO select2VO = new CodeVO();
		select2VO.setCdgrpId("CB");
		select2VO.setSessionCoId(authInfo.getSessionCoId());
		select2VO.setSessionUserId(authInfo.getSessionUserId());

		List<?> selectList2 = codeService.selectCommCodeList(select2VO);
		mv.addObject("selectList2", selectList2);

		LocalDateTime nowDateTime = LocalDateTime.now();

		int yy = nowDateTime.getYear();
		int mm = nowDateTime.getMonthValue();
		int dd = nowDateTime.getDayOfMonth();
		int hh = nowDateTime.getHour();
		int mi = nowDateTime.getMinute();


		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/status/statusCarList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getStatusCarList.do", method=RequestMethod.POST)
	public void getStatusCarList(@ModelAttribute("statusCarVO") StatusCarVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> carList = statusCarService.selectStatusCarList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", carList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getStatusCarDetailList.do", method=RequestMethod.POST)
	public void getStatusCarDetailList(@ModelAttribute("statusCarVO") StatusCarVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> carList = statusCarService.selectStatusCarDetailList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", carList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/insertCar.do", method=RequestMethod.POST)
	public void insertCar(@ModelAttribute("statusCarVO") StatusCarVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = statusCarService.insertCar(paramVO);

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

	@RequestMapping(value = "/updateCar.do", method=RequestMethod.POST)
	public void updateCar(@ModelAttribute("statusCarVO") StatusCarVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = statusCarService.updateCar(paramVO);

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

	@RequestMapping(value = "/deleteCar.do", method=RequestMethod.POST)
	public void deleteCar(@ModelAttribute("statusCarVO") StatusCarVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = statusCarService.deleteCar(paramVO);

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
