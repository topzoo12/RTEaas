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

import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.AuthgrpMenuService;
import egovframework.zieumtn.system.service.AuthgrpService;
import egovframework.zieumtn.system.service.AuthgrpUserService;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.PageService;
import egovframework.zieumtn.system.vo.AuthgrpMenuVO;
import egovframework.zieumtn.system.vo.AuthgrpUserVO;
import egovframework.zieumtn.system.vo.AuthgrpVO;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.PageVO;

import javax.annotation.Resource;

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
public class AuthgrpUserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AuthgrpUserController.class);

	/** EgovSampleService */
	@Resource(name = "authgrpUserService")
	private AuthgrpUserService authgrpUserService;

	/** EgovSampleService */
	@Resource(name = "authgrpService")
	private AuthgrpService authgrpService;

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
	@RequestMapping(value = "/sys/authgrpUserList.do")
	public ModelAndView authgrpList(@ModelAttribute("authgrpVO") AuthgrpVO searchVO1,@ModelAttribute("authgrpUserVO") AuthgrpUserVO searchVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/sys/authgrpUserList");
		try {
			List<AuthgrpVO> authList = (List<AuthgrpVO>) authgrpService.selectAuthgrpList(searchVO1);

			searchVO.setAuthgrpId(authList.get(0).getAuthgrpId());

			List<?> userList = authgrpUserService.selectAuthgrpUserList(searchVO);

			mv.addObject("resultList1", authList);
			mv.addObject("totCnt1", authList.size());

			mv.addObject("resultList2", userList);
			mv.addObject("totCnt2", userList.size());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch (Exception e) {
			// TODO: handle exception
			System.err.println("에러 발생::"+e.toString());
		}

		return mv;
	}
}
