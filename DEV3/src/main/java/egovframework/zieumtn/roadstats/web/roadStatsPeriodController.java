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
package egovframework.zieumtn.roadstats.web;

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
public class roadStatsPeriodController {

	private static final Logger LOGGER = LoggerFactory.getLogger(roadStatsPeriodController.class);

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

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/roadstats/period.do")
	public ModelAndView deviceList(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {


		System.out.println("******************/roadstats/period");

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		CodeVO codeVO1 = new CodeVO();
		codeVO1.setCdgrpId("AA");
		codeVO1.setSessionCoId(authInfo.getSessionCoId());
		codeVO1.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList1 = codeService.selectCommCodeList(codeVO1);

		CodeVO codeVO2 = new CodeVO();
		codeVO2.setCdgrpId("BB");
		codeVO2.setSessionCoId(authInfo.getSessionCoId());
		codeVO2.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList2 = codeService.selectCommCodeList(codeVO2);

		List<FcltsInfoVO> deviceList = (List<FcltsInfoVO>) deviceService.selectDeviceList(searchVO);

		SensorInfoVO ioVO = new SensorInfoVO();
		if(deviceList.size()>0) {
			ioVO.setFcltsUuid(deviceList.get(0).getFcltsUuid());
			ioVO.setSessionCoId(authInfo.getSessionCoId());
			ioVO.setSessionUserId(authInfo.getSessionUserId());

		}

		List<?> ioList = deviceService.selectIoList(ioVO);
		ModelAndView mv = new ModelAndView("/roadstats/period");

		mv.addObject("resultList1", deviceList);
		mv.addObject("resultList2", ioList);
		mv.addObject("selectList1", codeList1);
		mv.addObject("selectList2", codeList2);
		mv.addObject("totCnt1", deviceList.size());
		mv.addObject("totCnt2", ioList.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/roadstats/period")) {
				mv.addObject("fav", "message");
			}
		}

		System.out.println("***************************************************************************");
		System.out.println("***************************************************************************");
		System.out.println("***************************************************************************");

		return mv;

	}


}
