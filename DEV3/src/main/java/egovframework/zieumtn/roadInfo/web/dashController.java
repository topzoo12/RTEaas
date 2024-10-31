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

import java.util.List;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.device.service.DeviceService;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.device.vo.SensorInfoVO;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.vo.CodeVO;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class dashController {

	private static final Logger LOGGER = LoggerFactory.getLogger(riskController.class);

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
	@RequestMapping(value = "/roadinfo/dashBoard.do")
	public ModelAndView deviceList(@ModelAttribute("fcltsInfoVO") FcltsInfoVO searchVO, ModelMap model, HttpSession session) throws Exception {


		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		ModelAndView mv = new ModelAndView("/roadinfo/dashBoard");


		session.setAttribute("cdNa", authInfo.getCdNa());


		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/roadinfo/dashBoard")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;

	}


}
