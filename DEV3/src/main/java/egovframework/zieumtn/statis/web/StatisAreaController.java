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
import java.util.List;
import java.util.Random;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.statis.service.StatisAreaService;
import egovframework.zieumtn.statis.service.StatisDayService;
import egovframework.zieumtn.statis.service.StatisPeriodService;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisAreaVO;
import egovframework.zieumtn.statis.vo.StatisDayVO;
import egovframework.zieumtn.statis.vo.StatisMonthVO;
import egovframework.zieumtn.statis.vo.StatisPeriodVO;
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
import org.springframework.web.bind.annotation.RequestParam;
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
public class StatisAreaController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatisAreaController.class);

	/** EgovSampleService */
	@Resource(name = "statisAreaService")
	private StatisAreaService statisAreaService;

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
	@RequestMapping(value = "/statis/statisAreaList.do")
	public ModelAndView statisAreaList(@ModelAttribute("statisAreaVO") StatisAreaVO searchVO, ModelMap model, HttpSession session) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());

		CodeVO codeVO = new CodeVO();
		codeVO.setCdgrpId("AA");
		codeVO.setSessionCoId(authInfo.getSessionCoId());
		codeVO.setSessionUserId(authInfo.getSessionUserId());

		List<?> codeList = codeService.selectCommCodeList(codeVO);

		ModelAndView mv = new ModelAndView("/statis/statisAreaList");

		mv.addObject("areaList",codeList);

		CodeVO codeVO2 = new CodeVO();
		codeVO2.setCdgrpId("BA");
		codeVO2.setSessionCoId(authInfo.getSessionCoId());
		codeVO2.setSessionUserId(authInfo.getSessionUserId());
		List<?> codeList2 = codeService.selectCommCodeList(codeVO2);
		mv.addObject("ioList", codeList2);

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

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/statis/statisAreaList")) {
				mv.addObject("fav", "message");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/getStatisAreaList.do", method=RequestMethod.POST)
	public void getStatisAreaList(@RequestParam(required = false, value = "areaData[]") List<String> areaData, @ModelAttribute("statisAreaVO") StatisAreaVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());
			//LOGGER.info(areaData.toString());
			searchVO.setAreaDiv(areaData);
			//LOGGER.info(searchVO.toString());
			List<?> statisList = statisAreaService.selectStatisAreaList(searchVO);
			//LOGGER.info(statisList.toString());

			response.setContentType("text/html; charset=UTF-8");
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", statisList);

			LOGGER.info("jsonObject.toString()====="+jsonObject.toString());

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			e.printStackTrace();
			System.err.println("에러 발생::"+e.toString());
		}
	}
	@GetMapping(value = "/excelStatisAreaList.do")
	public void excelStatisAreaList(@RequestParam(required = false, value = "areaData[]") List<String> areaData, @ModelAttribute("statisAreaVO") StatisAreaVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			searchVO.setSessionCoId(authInfo.getSessionCoId());
			searchVO.setSessionUserId(authInfo.getSessionUserId());
			searchVO.setAreaDiv(areaData);
			List<StatisAreaVO> statisList = (List<StatisAreaVO>) statisAreaService.selectStatisAreaList(searchVO);

			if(statisList != null && statisList.size() > 0) {
				final String fileName = "downloadExcel.xlsx";

				/* 엑셀 그리기 */
				final String[] colNames = {
					 "측정일"
					, "측정소명"
					, "산소"
					, "일산화탄소"
					, "이산화질소"
					, "오존"
					, "미세먼지"
					, "초미세먼지"
					, "탄화수소"
					, "교통량"
					, "이산화탄소"
					, "가연성가스"
					, "온도"
					, "습도"
					, "대기압"
					, "암모니아"
					, "에탄올"
					, "프로판"
					, "벤젠"
					, "부탄"
					, "수소"
					, "진동"
					, "포름알데히드"
				};

				// 헤더 사이즈
				final int[] colWidths = {
					5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000
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
				sheet = workbook.createSheet("관측지별통계");
				row = sheet.createRow(rowCnt++);
				//헤더 정보 구성
				for (int i = 0; i < colNames.length; i++) {
					cell = row.createCell(i);
					cell.setCellStyle(headerStyle);
					cell.setCellValue(colNames[i]);
					sheet.setColumnWidth(i, colWidths[i]);	//column width 지정
				}
				//데이터 부분 생성
				for(StatisAreaVO vo : statisList) {
					cellCnt = 0;
					row = sheet.createRow(rowCnt++);

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getGetDt());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceNm());

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

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue13());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue14());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue15());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue16());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue17());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue18());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue19());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue20());

					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(vo.getDeviceValue21());
				}
				response.setContentType("application/vnd.ms-excel");
				// 엑셀 파일명 설정
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
				try {
					workbook.write(response.getOutputStream());
				} catch(IOException e) {
					System.err.println("IO 에러 발생::"+e.toString());
				} catch(Exception e) {
					System.err.println("에러 발생::"+e.toString());
				}
			}

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}catch(IOException e) {
			System.err.println("IO 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
}
