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
import java.time.LocalDateTime;
import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.openapi.service.OpenapiReqService;
import egovframework.zieumtn.openapi.vo.OpenapiReqVO;
import egovframework.zieumtn.system.vo.UserVO;
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
public class OpenapiReqController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);


	@Resource(name = "openapiReqService")
	private OpenapiReqService openapiReqService;

	@Resource(name = "emailService")
	private EmailService emailService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/openapi/openapiReqList.do")
	public ModelAndView openapiReqList(@ModelAttribute("openapiReqVO") OpenapiReqVO searchVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		ModelAndView mv = new ModelAndView("/openapi/openapiReqList");

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

		List<?> list = openapiReqService.selectOpenapiReqList(searchVO);

		mv.addObject("resultList", list);
		mv.addObject("totCnt", list.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/openapi/openapiReqList")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/getOpenapiReqList.do", method=RequestMethod.POST)
	public void getOpenapiReqList(@ModelAttribute("openapiReqVO") OpenapiReqVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> list = openapiReqService.selectOpenapiReqList(searchVO);

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

	@RequestMapping(value = "/reqOpenapi.do", method=RequestMethod.POST)
	public void reqOpenapi(@ModelAttribute("openapiReqVO") OpenapiReqVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			int iResult = openapiReqService.reqOpenapi(paramVO);

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

	@RequestMapping(value = "/sendMailOpenapi.do", method=RequestMethod.POST)
	public void sendMailOpenapi(@ModelAttribute("openapiReqVO") OpenapiReqVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {



			String mailMessage =
					"<strong style=\"display: block;color: #0475f4;\">발급된 인증키 정보를</strong>알려 드립니다.</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "아래의 인증키가 발급 되었습니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">인증키</span> "+paramVO.getOpenKey()+"</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					+ "신청하신 데이터가 RESTful API 형태로 GET/POST 방식을 지원하여 제공됩니다.</p>"
					+ "<p style=\"margin: 40px 0 0;	text-align: center;	font-size: 18px; color: #0475f4;	font-weight: 600; border-top: 2px solid #000; border-bottom: 1px solid #e7e7e7; padding: 20px 0;font-family: inherit; vertical-align: baseline;box-sizing: border-box;\">"
					+ "<span style=\"color: #000;display: inline-block;margin: 0 20px 0 0;padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">Request Format</span> http://210.96.110.65:8090/openapiData.do?openkey={openkey}</p>"
					+ "<p style=\"margin: 30px 0 0;	font-size: 14px; color: #666666;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
					;

			EmailVO emailVO = new EmailVO();
			emailVO.setReceiveMail(paramVO.getEmailAddr());
			emailVO.setSenderMail("icdp@nflux.co.kr");
			emailVO.setSubject("[ICDP]인증키");

			emailVO.setMessage(mailMessage);
			emailService.sendMail(emailVO);

			response.setContentType("text/html; charset=UTF-8");
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", 0);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/approveOpenapi.do", method=RequestMethod.POST)
	public void approveOpenapi(@ModelAttribute("openapiReqVO") OpenapiReqVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());

			OpenapiReqVO keyCheckVO = new OpenapiReqVO();
			String key = randomWord();
			keyCheckVO.setOpenKey(key);
			List<?> list = openapiReqService.checkOpenapiKey(keyCheckVO);
			//int r = list.size();
			while (list.size() > 0) {
				key = randomWord();
				keyCheckVO.setOpenKey(key);
				list = openapiReqService.checkOpenapiKey(keyCheckVO);
			}
			paramVO.setOpenKey(key);

			int iResult = openapiReqService.approveOpenapi(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);
			jsonObject.put("openKey", key);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
	static String randomWord(){
		java.util.Random rng = new java.util.Random();
		//double r = rng.nextInt(10);

		int length = (int)(rng.nextInt(10))+20;

        StringBuffer newWord = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int mixed = (int)(rng.nextInt(3));
            switch(mixed) {
                case 0:
                    String lowerRandom ="";
                    char lowerCh = (char)((int)(rng.nextInt(25)) + 97);
                    lowerRandom += lowerCh;
                    newWord.append(lowerRandom);
                    break;
                case 1:
                	String upperRandom ="";
                    char upperCh = (char)((int)(rng.nextInt(25)) + 65);
                    upperRandom += upperCh;
                    newWord.append(upperRandom);
                    break;
                case 2:
                	String numRandom ="";
                    char ch = (char)((int)(rng.nextInt(10)) + 48);
                    numRandom += ch;
                    newWord.append(numRandom);
                    break;
                default:
                    break;
            }
        }

        return newWord.toString();
    }
}
