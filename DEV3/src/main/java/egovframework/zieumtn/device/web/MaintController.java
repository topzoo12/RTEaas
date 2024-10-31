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
package egovframework.zieumtn.device.web;

import java.io.PrintWriter;
import java.util.List;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.device.service.DeviceService;
import egovframework.zieumtn.device.service.MaintService;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.device.vo.FcltsMngVO;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.vo.CodeVO;
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
public class MaintController {

	private static final Logger LOGGER = LoggerFactory.getLogger(MaintController.class);

	/** EgovSampleService */
	@Resource(name = "deviceService")
	private DeviceService deviceService;

	/** EgovSampleService */
	@Resource(name = "maintService")
	private MaintService maintService;

	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name = "messageService")
	private MessageService messageService;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/device/maintList.do")
	public ModelAndView maintList(@ModelAttribute("fcltsMngVO") FcltsMngVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		CodeVO codeVO1 = new CodeVO();
		codeVO1.setCdgrpId("AA");
		codeVO1.setSessionCoId(authInfo.getSessionCoId());
		codeVO1.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList1 = codeService.selectCommCodeList(codeVO1);

		CodeVO codeVO2 = new CodeVO();
		codeVO2.setCdgrpId("BD");
		codeVO2.setSessionCoId(authInfo.getSessionCoId());
		codeVO2.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList2 = codeService.selectCommCodeList(codeVO2);

		List<?> deviceList = maintService.selectMaintList(searchVO);

		FcltsMngVO mngVO = new FcltsMngVO();
		if(deviceList.size()>0) {
			FcltsInfoVO fcl = (FcltsInfoVO) deviceList.get(0);
			mngVO.setFcltsUuid(fcl.getFcltsUuid());

		}

		List<?> mngList = maintService.selectDeviceMngList(mngVO);

		ModelAndView mv = new ModelAndView("/device/maintList");

		mv.addObject("resultList1", deviceList);
		mv.addObject("resultList2", mngList);
		mv.addObject("selectList1", codeList1);
		mv.addObject("selectList2", codeList2);
		mv.addObject("totCnt1", deviceList.size());
		mv.addObject("totCnt2", mngList.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/device/maintList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}
	@RequestMapping(value = "/getMaintList.do", method=RequestMethod.POST)
	public void getMaintList(@ModelAttribute("fcltsMngVO") FcltsMngVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> deviceList = maintService.selectMaintList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", deviceList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/getDeviceMngList.do", method=RequestMethod.POST)
	public void getDeviceMngList(@ModelAttribute("fcltsMngVO") FcltsMngVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> deviceList = maintService.selectDeviceMngList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", deviceList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
	@RequestMapping(value = "/insertDeviceMng.do", method=RequestMethod.POST)
	public void insertDeviceMng(@ModelAttribute("fcltsMngVO") FcltsMngVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = maintService.insertDeviceMng(paramVO);

			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			if (iResult > 0) {
				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00003").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());

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

	@RequestMapping(value = "/updateDeviceMng.do", method=RequestMethod.POST)
	public void updateDeviceMng(@ModelAttribute("fcltsMngVO") FcltsMngVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = maintService.updateDeviceMng(paramVO);

			if (iResult > 0) {
				response.setContentType("text/html; charset=UTF-8");

				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00006").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		} catch (NullPointerException e) {
			System.err.println("Null 에러 발생::" + e.toString());

			response.setContentType("text/html; charset=UTF-8");

			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
			JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		} catch (Exception e) {
			System.err.println("에러 발생::" + e.toString());

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
	@RequestMapping(value = "/deleteDeviceMng.do", method=RequestMethod.POST)
	public void deleteDeviceMng(@ModelAttribute("fcltsMngVO") FcltsMngVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			int iResult = maintService.deleteDeviceMng(paramVO);

			if(iResult >0){
				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
				JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00010").toString()));
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
}
