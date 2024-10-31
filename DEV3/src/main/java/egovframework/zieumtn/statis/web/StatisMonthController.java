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
package egovframework.zieumtn.statis.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.statis.service.StatisMonthService;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisMonthVO;
import egovframework.zieumtn.statis.vo.StatisTimeVO;
import egovframework.zieumtn.status.vo.StatusAirVO;
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

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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
public class StatisMonthController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatisMonthController.class);

	/** EgovSampleService */
	@Resource(name = "statisMonthService")
	private StatisMonthService statisMonthService;

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
	@RequestMapping(value = "/statis/statisMonthList.do")
	public ModelAndView userList(@ModelAttribute("statisMonthVO") StatisMonthVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		CodeVO codeVO = new CodeVO();
		codeVO.setCdgrpId("BA");
		codeVO.setSessionCoId(authInfo.getSessionCoId());
		codeVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> codeList = codeService.selectCommCodeList(codeVO);

		ModelAndView mv = new ModelAndView("/statis/statisMonthList");

		List<String> yearList = new ArrayList<String>();
		LocalDateTime nowDateTime = LocalDateTime.now();

		int yr = nowDateTime.getYear();
		for(Integer i=2022;i<=yr;i++) {
			yearList.add(i.toString());
		}
		mv.addObject("resultList", codeList);
		mv.addObject("year", yearList);
		mv.addObject("totCnt", codeList.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/statis/statisMonthList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getStatisMonthList.do", method=RequestMethod.POST)
	public void getUserList(@ModelAttribute("statisMonthVO") StatisMonthVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<?> statisList = statisMonthService.selectStatisMonthList(searchVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", statisList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@GetMapping(value = "/excelStatisMonthList.do")
	public void excelStatisMonthList(@ModelAttribute("statisMonthVO") StatisMonthVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());

			List<StatisMonthVO> statisList = (List<StatisMonthVO>) statisMonthService.selectStatisMonthList(searchVO);


			if(statisList != null && statisList.size() > 0) {
				final String fileName = "downloadExcel.xlsx";

				/* 엑셀 그리기 */
				final String[] colNames = {
					 "구분"
					, "1월"
					, "2월"
					, "3월"
					, "4월"
					, "5월"
					, "6월"
					, "7월"
					, "8월"
					, "9월"
					, "10월"
					, "11월"
					, "12월"
				};

				// 헤더 사이즈
				final int[] colWidths = {
					5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000
				};

				XSSFWorkbook workbook = new XSSFWorkbook();
				XSSFSheet sheet = null;
				XSSFCell cell = null;
				XSSFRow row = null;

				//Font
				Font fontHeader = workbook.createFont();
				fontHeader.setFontName("맑은 고딕");	//글씨체
				fontHeader.setFontHeight((short)(9 * 20));	//사이즈
				fontHeader.setBoldweight(Font.BOLDWEIGHT_BOLD);	//볼드(굵게)
				Font font9 = workbook.createFont();
				font9.setFontName("맑은 고딕");	//글씨체
				font9.setFontHeight((short)(9 * 20));	//사이즈
				// 엑셀 헤더 셋팅
				CellStyle headerStyle = workbook.createCellStyle();
				headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
				headerStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
				headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
				headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
				headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				headerStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
				headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
				headerStyle.setFont(fontHeader);
				// 엑셀 바디 셋팅
				CellStyle bodyStyle = workbook.createCellStyle();
				bodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
				bodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
				bodyStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
				bodyStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				bodyStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
				bodyStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				bodyStyle.setFont(font9);
				// 엑셀 왼쪽 설정
				CellStyle leftStyle = workbook.createCellStyle();
				leftStyle.setAlignment(CellStyle.ALIGN_LEFT);
				leftStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
				leftStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
				leftStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				leftStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
				leftStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				leftStyle.setFont(font9);

				//rows
				int rowCnt = 0;
				int cellCnt = 0;
				int listCount = statisList.size();

				// 엑셀 시트명 설정
				sheet = workbook.createSheet("월별통계");
				row = sheet.createRow(rowCnt++);
				//헤더 정보 구성
				for (int i = 0; i < colNames.length; i++) {
					cell = row.createCell(i);
					cell.setCellStyle(headerStyle);
					cell.setCellValue(colNames[i]);
					sheet.setColumnWidth(i, colWidths[i]);	//column width 지정
				}
				//데이터 부분 생성
				for(StatisMonthVO vo : statisList) {
					cellCnt = 0;
					row = sheet.createRow(rowCnt++);

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceIo());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue1());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue2());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue3());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue4());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue5());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue6());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue7());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue8());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue9());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue10());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue11());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue12());
				}
				response.setContentType("application/vnd.ms-excel");
				// 엑셀 파일명 설정
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
				try {
					workbook.write(response.getOutputStream());
				} catch(IOException e) {
					System.err.println("에러 발생::"+e.toString());
				} catch(Exception e) {
					System.err.println("에러 발생::"+e.toString());
				}
			}

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		} catch(IOException e) {
			System.err.println("IO 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
}
