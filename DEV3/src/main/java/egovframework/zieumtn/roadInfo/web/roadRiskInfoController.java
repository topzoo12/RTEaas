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
package egovframework.zieumtn.roadInfo.web;

import java.io.PrintWriter;
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
import egovframework.zieumtn.device.vo.SensorInfoVO;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisTimeVO;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.AuthgrpVO;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MenuVO;
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
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 0000.00.00           최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class roadRiskInfoController {

	private static final Logger LOGGER = LoggerFactory.getLogger(roadRiskInfoController.class);

	/** EgovSampleService */
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

	@Resource(name = "sysDeviceService")
	private SysDeviceService sysDeviceService;



	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/roadinfo/roadRiskInfo.do")
	public ModelAndView deviceList(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		// 디바이스 리스트
		sysDeviceVO deviceVO = new sysDeviceVO();
		deviceVO.setCoId(authInfo.getCoId());
		List<?> deviceList = sysDeviceService.selectDeviceList(deviceVO);

		LOGGER.info("접속정보" + authInfo.getCoId());

		// 심각도 정보
		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("LV");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());
		List<?> levelList = codeService.selectCommCodeList(select1VO);


		session.setAttribute("deviceList", deviceList);
		session.setAttribute("authInfo", authInfo);
		session.setAttribute("levelList", levelList);
		session.setAttribute("cdNa", authInfo.getCdNa());


		ModelAndView mv = new ModelAndView("/roadinfo/roadRiskInfo");

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/roadinfo/roadRiskInfo")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;

	}

//	@RequestMapping(value = "/roadinfo/structureInfo.do")
//	public ModelAndView structureinfo(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {
//
//		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
//
//		searchVO.setSessionCoId(authInfo.getSessionCoId());
//		searchVO.setSessionUserId(authInfo.getSessionUserId());
//
//		// 디바이스 리스트
//		sysDeviceVO deviceVO = new sysDeviceVO();
//		deviceVO.setCoId(authInfo.getCoId());
//		List<?> deviceList = sysDeviceService.selectDeviceList(deviceVO);
//
//		LOGGER.info("접속정보" + authInfo.getCoId());
//
//		// 심각도 정보
//		CodeVO select1VO = new CodeVO();
//		select1VO.setCdgrpId("LV");
//		select1VO.setSessionCoId(authInfo.getSessionCoId());
//		select1VO.setSessionUserId(authInfo.getSessionUserId());
//		List<?> levelList = codeService.selectCommCodeList(select1VO);
//
//
//		session.setAttribute("deviceList", deviceList);
//		session.setAttribute("authInfo", authInfo);
//		session.setAttribute("levelList", levelList);
//		session.setAttribute("cdNa", authInfo.getCdNa());
//
//
//		ModelAndView mv = new ModelAndView("/roadinfo/roadStructureInfo");
//
//		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
//		for(LoginMenuVO fav : favList){
//			if(fav.getSrnUrl().equals("/roadinfo/roadRiskInfo")) {
//				mv.addObject("fav", "message");
//			}
//		}
//		System.out.println("--------------------------");
//
//		System.out.println(favList);
//		System.out.println("111111111111111111111111111");
//		return mv;
//
//	}

	@RequestMapping(value = "/roadinfo/roadDetetionInfo.do")
	public ModelAndView roadDetetionInfo(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		// 디바이스 리스트
		sysDeviceVO deviceVO = new sysDeviceVO();
		deviceVO.setCoId(authInfo.getCoId());
		List<?> deviceList = sysDeviceService.selectDeviceList(deviceVO);

		LOGGER.info("접속정보" + authInfo.getCoId());

		// 심각도 정보
		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("LV");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());
		List<?> levelList = codeService.selectCommCodeList(select1VO);


		session.setAttribute("deviceList", deviceList);
		session.setAttribute("authInfo", authInfo);
		session.setAttribute("levelList", levelList);
		session.setAttribute("cdNa", authInfo.getCdNa());


		ModelAndView mv = new ModelAndView("/roadinfo/roadDetetionInfo");

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/roadinfo/roadDetetionInfo")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;

	}

	@RequestMapping(value = "/roadinfo/roadObstacleList.do")
	public ModelAndView roadObstacleList(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		// 디바이스 리스트
		sysDeviceVO deviceVO = new sysDeviceVO();
		deviceVO.setCoId(authInfo.getCoId());
		List<?> deviceList = sysDeviceService.selectDeviceList(deviceVO);

		LOGGER.info("접속정보" + authInfo.getCoId());

		session.setAttribute("deviceList", deviceList);
		session.setAttribute("authInfo", authInfo);
		session.setAttribute("cdNa", authInfo.getCdNa());


		ModelAndView mv = new ModelAndView("/roadinfo/roadObstacleList");

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/roadinfo/roadObstacleList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;

	}


}
