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
import egovframework.zieumtn.status.service.StatusAirService;
import egovframework.zieumtn.status.service.StatusRealTimeService;
import egovframework.zieumtn.status.service.StatusSynthService;
import egovframework.zieumtn.status.vo.StatusAirVO;
import egovframework.zieumtn.status.vo.StatusCarVO;
import egovframework.zieumtn.status.vo.StatusRealTimeVO;
import egovframework.zieumtn.status.vo.StatusSynthVO;
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
public class StatusSynthController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatusSynthController.class);

	/** EgovSampleService */
	@Resource(name = "statusSynthService")
	private StatusSynthService statusSynthService;

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
	@RequestMapping(value = "/status/statusSynthList.do")
	public ModelAndView statusSynthList(@ModelAttribute("statusSynthVO") StatusSynthVO searchVO, ModelMap model, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/status/statusSynthList");

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		List<StatusSynthVO> synthList = (List<StatusSynthVO>) statusSynthService.selectStatusSynthList(searchVO);

		mv.addObject("resultList", synthList);

		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("AA");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());

		List<CodeVO> selectList1 = (List<CodeVO>) codeService.selectCommCodeList(select1VO);
		mv.addObject("selectList1", selectList1);
		if(synthList.size()>0) {
			mv.addObject("x", synthList.get(0).getX());
			mv.addObject("y", synthList.get(0).getY());

		} else {
			mv.addObject("x", authInfo.getMapX());
			mv.addObject("y", authInfo.getMapY());
			//mv.addObject("x", 37.6686932);
			//mv.addObject("y", 127.047072);

		}

		if(searchVO.getAreaDiv() !=null) {
			for(int i = 0; i < selectList1.size();i++) {
				if(selectList1.get(i).getComCd().equals(searchVO.getAreaDiv())){
					mv.addObject("areaDivNm", selectList1.get(i).getCdNm());
				}
			}
		} else {
			mv.addObject("areaDivNm", "");
		}


		CodeVO codeVO2 = new CodeVO();
		codeVO2.setCdgrpId("BA");
		codeVO2.setSessionCoId(authInfo.getSessionCoId());
		codeVO2.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList2 = codeService.selectCommCodeList(codeVO2);
		mv.addObject("ioList", codeList2);


		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/status/statusSynthList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}
}
