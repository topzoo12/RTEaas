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
package egovframework.zieumtn.common.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.DeviceDataVO;
import egovframework.zieumtn.common.service.InterfaceDeviceDataVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.MainDataVO;
import egovframework.zieumtn.common.service.WeatherItemVO;
import egovframework.zieumtn.common.service.WeatherVO;
import egovframework.zieumtn.device.service.DeviceService;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.openapi.service.OpenapiReqService;
import egovframework.zieumtn.openapi.vo.OpenapiReqVO;
import egovframework.zieumtn.system.service.CodeService;
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.service.UsageDataService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.ServiceVO;
import egovframework.zieumtn.system.vo.UserVO;
import egovframework.zieumtn.system.vo.sysDeviceVO;
import egovframework.zieumtn.system.web.AuthgrpController;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

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
public class CommonController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);

	/** EgovSampleService */
	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "openapiReqService")
	private OpenapiReqService openapiReqService;

	@Resource(name = "sysDeviceService")
	private SysDeviceService sysDeviceService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	/** EgovSampleService */
	@Resource(name = "codeService")
	private CodeService codeService;


	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/main.do")
	public ModelAndView loginView(@ModelAttribute("searchVO") CommonDefaultVO searchVO, ModelMap model, HttpSession session,HttpServletRequest req) throws Exception {

		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
		LOGGER.info(authInfo.getSessionCoId());

		ModelAndView mv = new ModelAndView("/cmmn/main");
		sysDeviceVO deviceVO = new sysDeviceVO();
		deviceVO.setCoId(authInfo.getCoId());
		deviceVO.setSessionCoId(authInfo.getSessionCoId());
		List<?> deviceList = sysDeviceService.selectDeviceList(deviceVO);

		System.out.println("--------------------------");

		System.out.println(deviceList);


		// 심각도 정보
		CodeVO select1VO = new CodeVO();
		select1VO.setCdgrpId("LV");
		select1VO.setSessionCoId(authInfo.getSessionCoId());
		select1VO.setSessionUserId(authInfo.getSessionUserId());
		List<?> levelList = codeService.selectCommCodeList(select1VO);
		session.setAttribute("levelList", levelList);

/*
		mv.addObject("y", 127.047072);
		mv.addObject("x", 37.6686932);*/
		mv.addObject("deviceList", deviceList);
		mv.addObject("wtNm", authInfo.getWtNm());


		RestTemplate restTemplate = new RestTemplate();
        //String apiUrl = "http://datahub-dev.zieumtn.com/gis/administrative/boundary";
        //String apiUrl = "http://datahub-dev.zieumtn.com/gis/pothole/latest";
		//hardcording 부분 고치기
		String apiUrl = "http://192.168.10.223:5071/gis/pothole/latest";
        //http://3.39.212.67/gis/administrative/boundary"
        //http://datahub-dev.zieumtn.com/gis

        Map<String, Object> params = new HashMap<>();
        //params.put("administrative_id", "2505207");
        //params.put("region", "KR");
        params.put("co_id", "A0001");

        //String urlWithParams = apiUrl + "?administrative_id={administrative_id}&region={region}";
        String urlWithParams = apiUrl + "?co_id={co_id}";

        ResponseEntity<String> result = restTemplate.getForEntity(urlWithParams, String.class, params);

        // JSON 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(result.getBody());

        // 필요한 데이터 추출
        String date = rootNode.path("data").path("date").asText();
        int count = rootNode.path("data").path("count").asInt();

//        System.out.println("Date: " + date);
//        System.out.println("Count: " + count);
//
//        System.out.println("Response: " + result.getBody());
//
//		System.out.println("◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇");

		mv.addObject("lastUpdateDate", date);
		mv.addObject("lastUpdateCount", count);
/*
 *
		//String naverhtml = cwGetWeather(weatherVO);

		if(naverhtml.indexOf("<strong class=\"title\">일출</strong>")>=0) {
			mv.addObject("weather_html", naverhtml.substring(naverhtml.indexOf("<div class=\"status_wrap\">"), naverhtml.indexOf("<strong class=\"title\">일출</strong>")+150));
		} else {
			mv.addObject("weather_html", naverhtml.substring(naverhtml.indexOf("<div class=\"status_wrap\">"), naverhtml.indexOf("<strong class=\"title\">일몰</strong>")+150));
		}

 *//*

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

		int hh = nowDateTime.getHour();
		int mi = nowDateTime.getMinute();
		int ss = nowDateTime.getSecond();

		mv.addObject("yy", y);
		mv.addObject("mm", mm);
		mv.addObject("dd", dd);

		mv.addObject("hh", hh);
		mv.addObject("mi", mi);
		mv.addObject("ss", ss);

		JSONObject jsonObject = new JSONObject();

		WeatherVO weatherVO = new WeatherVO();
		weatherVO.setX(authInfo.getWtX());
		weatherVO.setY(authInfo.getWtY());
		weatherVO.setWtNm(authInfo.getWtNm());

		HashMap<String, Object> resultMap = restApiGetWeather(weatherVO,req);
		LOGGER.info(resultMap.toString());

		if(resultMap != null) {
			HashMap<String, Object> responseMap = (HashMap<String, Object>) resultMap.get("response");
			if(responseMap != null) {
				HashMap<String, Object> headerMap = (HashMap<String, Object>) responseMap.get("header");
				HashMap<String, Object> bodyMap = (HashMap<String, Object>) responseMap.get("body");
				if(bodyMap != null) {
					HashMap<String, Object> itemsMap = (HashMap<String, Object>) bodyMap.get("items");

					if(itemsMap != null) {
						List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) itemsMap.get("item");


						for(int i=0;i<list.size();i++) {
							if(list.get(i).get("category").equals("VEC")) {
								Integer vecval = (int) Math.floor((Integer.parseInt((String) list.get(i).get("obsrValue")) + (22.5 * 0.5)) / 22.5);
								String vec = "";
								switch(vecval) {
									case 0:  vec = "북";//vec = "N"
									    break;
									case 1:  vec = "북북동";//vec = "NNE"
									    break;
									case 2:  vec = "북동";//vec = "NE"
									    break;
									case 3:  vec = "동북동";//vec = "ENE"
									    break;
									case 4:  vec = "동";//vec = "E"
									    break;
									case 5:  vec = "동남동";//vec = "ESE"
									    break;
									case 6:  vec = "남동";//vec = "SE"
									    break;
									case 7:  vec = "남남동";//vec = "SSE"
									    break;
									case 8:  vec = "남";//vec = "S"
									    break;
									case 9:  vec = "남남서";//vec = "SSW"
									    break;
									case 10:  vec = "남서";//vec = "SW"
									    break;
									case 11:  vec = "서남서";//vec = "WSW"
									    break;
									case 12:  vec = "서";//vec = "W"
									    break;
									case 13:  vec = "서북서";//vec = "WNW"
									    break;
									case 14:  vec = "북서";//vec = "NW"
									    break;
									case 15:  vec = "북북서";//vec = "NNW"
									    break;
									case 16:  vec = "북";//vec = "N"
									    break;

								}
								jsonObject.put(list.get(i).get("category"), vec);
							} else if(list.get(i).get("category").equals("PTY")) {
								String pty = "";
								String ptyval = (String) list.get(i).get("obsrValue");

								switch(ptyval) {
									case "0":
										pty = "맑음";
										jsonObject.put("ptyicon", "icon1");
									    break;
									case "1":
										pty = "비";
										jsonObject.put("ptyicon", "icon4");
									    break;
									case "2":
										pty = "비/눈";
										jsonObject.put("ptyicon", "icon5");
									    break;
									case "3":
										pty = "눈";
										jsonObject.put("ptyicon", "icon6");
									    break;
									case "5":
										pty = "비";
										jsonObject.put("ptyicon", "icon4");
									    break;
									case "6":
										pty = "비/눈";
										jsonObject.put("ptyicon", "icon5");
									    break;
									case "7":
										pty = "눈";
										jsonObject.put("ptyicon", "icon6");
								    	break;

								}
								jsonObject.put(list.get(i).get("category"), pty);
							} else {

								jsonObject.put(list.get(i).get("category"), list.get(i).get("obsrValue"));

							}

						}
					}

				}

			}
		}

		HashMap<String, Object> resultAirMap = restApiGetAir(weatherVO.getWtNm(),req);
		LOGGER.info(resultAirMap.toString());
		if(resultAirMap != null) {
			HashMap<String, Object> responseMap = (HashMap<String, Object>) resultAirMap.get("response");
			if(responseMap != null) {
				HashMap<String, Object> bodyMap = (HashMap<String, Object>) responseMap.get("body");
				if(bodyMap != null) {
					List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) bodyMap.get("items");
					jsonObject.put("khaiValue",list.get(0).get("khaiValue"));
					jsonObject.put("so2Value",list.get(0).get("so2Value"));
					jsonObject.put("coValue",list.get(0).get("coValue"));
					jsonObject.put("pm10Value",list.get(0).get("pm10Value"));
					jsonObject.put("pm25Value",list.get(0).get("pm25Value"));
					jsonObject.put("no2Value",list.get(0).get("no2Value"));
					jsonObject.put("o3Value",list.get(0).get("o3Value"));

				}

			}
		}


		mv.addObject("wt", jsonObject);
*/
		return mv;
	}
	/*
	@RequestMapping(value = "/api/getWeather.do", method=RequestMethod.POST)
	public void getWeather(@ModelAttribute("weatherVO") WeatherVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {

		JSONObject jsonObject = new JSONObject();
		HashMap<String, Object> resultMap = restApiGetWeather(searchVO);
		//HashMap<String, Object> resultMap = new HashMap<>();


		//Object responseObj = responseMap.get("response");

		if(resultMap != null) {
			HashMap<String, Object> responseMap = (HashMap<String, Object>) resultMap.get("response");
			if(responseMap != null) {
				HashMap<String, Object> headerMap = (HashMap<String, Object>) responseMap.get("header");
				HashMap<String, Object> bodyMap = (HashMap<String, Object>) responseMap.get("body");
				if(bodyMap != null) {
					HashMap<String, Object> itemsMap = (HashMap<String, Object>) bodyMap.get("items");

					if(itemsMap != null) {
						List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) itemsMap.get("item");


						for(int i=0;i<list.size();i++) {
							jsonObject.put(list.get(i).get("category"), list.get(i).get("obsrValue"));
						}
					}

				}

			}
		}

		HashMap<String, Object> resultAirMap = restApiGetAir(searchVO.getWtNm());
		LOGGER.info(resultAirMap.toString());
		if(resultAirMap != null) {
			HashMap<String, Object> responseMap = (HashMap<String, Object>) resultAirMap.get("response");
			if(responseMap != null) {
				HashMap<String, Object> bodyMap = (HashMap<String, Object>) responseMap.get("body");
				if(bodyMap != null) {
					List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) bodyMap.get("items");
					jsonObject.put("khaiValue",list.get(0).get("khaiValue"));
					jsonObject.put("so2Value",list.get(0).get("so2Value"));
					jsonObject.put("coValue",list.get(0).get("coValue"));
					jsonObject.put("pm10Value",list.get(0).get("pm10Value"));
					jsonObject.put("pm25Value",list.get(0).get("pm25Value"));
					jsonObject.put("no2Value",list.get(0).get("no2Value"));
					jsonObject.put("o3Value",list.get(0).get("o3Value"));

				}

			}
		}


		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.write(jsonObject.toString());
	}
	*/
	public HashMap<String, Object> restApiGetWeather(WeatherVO searchVO, HttpServletRequest req) throws Exception {

		LocalDateTime now = LocalDateTime.now();
		String ymd = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String hh = now.format(DateTimeFormatter.ofPattern("HH"));
		String mm = now.format(DateTimeFormatter.ofPattern("mm"));
		String hm = now.format(DateTimeFormatter.ofPattern("mm"));

		if(Integer.parseInt(mm)<=30) {
			Integer ih =Integer.parseInt(hh)-1 ;
			if(ih<10) {
				hm = "0"+ih.toString()+mm;
			} else {
				hm = ih.toString()+mm;
			}
		} else {
			hm = hh+mm;
		}
		String url = (req.isSecure()?"http":"http")+"://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
				+"?serviceKey=P1Rd7LgeExqItnBzydZ9DEa8r1z08ugu%2BZoEJNudoh0AAlfjuOFBXeAMP0iPSCtsjaHbOr94Tap%2B36gDb7Yvhw%3D%3D"
				+"&pageNo=1"
				+"&numOfRows=1000"
				+"&dataType=JSON"
				+"&base_date="+ymd
				+"&base_time="+hm
				+"&nx="+searchVO.getX()
				+"&ny="+searchVO.getY();

		LOGGER.info(url);

		URL apiURL = new URL(url);

		HttpURLConnection conn = null;
		BufferedReader br = null;
		BufferedWriter bw = null;

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			conn = (HttpURLConnection) apiURL.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setDoOutput(true);

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

			String line = null;

			StringBuffer result = new StringBuffer();
/*
			while ((line=br.readLine()) != null) {
				result.append(line);
			}
*/
			line = br.readLine();
			result.append(line);
			while (line != null) {
				line = br.readLine();
				result.append(line);
			}

			ObjectMapper mapper = new ObjectMapper();

			resultMap = mapper.readValue(result.toString(), HashMap.class);

		} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		} finally {
			if (conn != null) conn.disconnect();
			if (br != null) br.close();
			if (bw != null) bw.close();
		}

		return resultMap;
	}
	public HashMap<String, Object> restApiGetAir(String stationNm, HttpServletRequest req) throws Exception {
		if(stationNm == null) {
			stationNm = "";
		}
		String url = (req.isSecure()?"http":"http")+"://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty"
				+ "?stationName="+URLEncoder.encode(stationNm, StandardCharsets.UTF_8.toString())
				+"&dataTerm=DAILY"
				+"&pageNo=1"
				+"&numOfRows=100"
				+"&returnType=json"
				+"&serviceKey=P1Rd7LgeExqItnBzydZ9DEa8r1z08ugu%2BZoEJNudoh0AAlfjuOFBXeAMP0iPSCtsjaHbOr94Tap%2B36gDb7Yvhw%3D%3D"
				+"&ver=1.0";

/*
		String url = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty"
				+"?serviceKey=k60l1%2FPSzjLxaAZsoAaRxVJlfXNCZY%2F6va5VxVxJLkvlOaK%2FV0nHgDC7U0%2BvE0IK%2B67mVyYdeqO3RUVMuFq7Lg%3D%3D"
				//+"?serviceKey=k60l1/PSzjLxaAZsoAaRxVJlfXNCZY/6va5VxVxJLkvlOaK/V0nHgDC7U0+vE0IK+67mVyYdeqO3RUVMuFq7Lg=="
				+"&returnType=json"
				+"&stationName="+stationNm
				+"&dataTerm=DAILY"
				+"&ver=1.0";
				*/
		LOGGER.info(url);

		URL apiURL = new URL(url);

		HttpURLConnection conn = null;
		BufferedReader br = null;
		BufferedWriter bw = null;

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			conn = (HttpURLConnection) apiURL.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setDoOutput(true);

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

			String line = null;

			StringBuffer result = new StringBuffer();
/*
			while ((line=br.readLine()) != null) {
				result.append(line);
			}
*/
			line = br.readLine();
			result.append(line);
			while (line != null) {
				line = br.readLine();
				result.append(line);
			}

			ObjectMapper mapper = new ObjectMapper();

			resultMap = mapper.readValue(result.toString(), HashMap.class);

		} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		} finally {
			if (conn != null) conn.disconnect();
			if (br != null) br.close();
			if (bw != null) bw.close();
		}

		return resultMap;
	}
	public String cwGetWeather(WeatherVO searchVO) throws Exception {

		LocalDateTime now = LocalDateTime.now();
		String ymd = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String hh = now.format(DateTimeFormatter.ofPattern("HH"));
		String mm = now.format(DateTimeFormatter.ofPattern("mm"));
		String hm = now.format(DateTimeFormatter.ofPattern("mm"));

		if(Integer.parseInt(mm)<=30) {
			Integer ih =Integer.parseInt(hh)-1 ;
			hm = ih.toString()+mm;
		} else {
			hm = hh+mm;
		}

		String url = "http://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EB%8F%84%EB%B4%89%EA%B5%AC%EB%82%A0%EC%94%A8";

		Document doc = Jsoup.connect(url).get();

		return doc.html();
	}

	@RequestMapping(value = "/interfaceDeviceData.do", method=RequestMethod.POST)
	public void interfaceDeviceData(@RequestBody HashMap<String, Object> paramVO , HttpServletResponse response) throws Exception {
		/*
		try {
			LOGGER.info("interfaceDeviceData.do==>");
			LOGGER.info(paramVO.toString());
			List<?> list = new ArrayList<>();
			list = (List<?>) paramVO.get("sensorIoValue");

			List<DeviceDataVO> dataVO = new ArrayList<>();


			for(int i=0;i<list.size();i++) {
				DeviceDataVO vo = new DeviceDataVO();
				HashMap<String,Object> d =(HashMap<String, Object>) list.get(i);

				String ioId = d.get("ioId").toString();

				if(ioId.length()>2) {
					if(ioId.substring(ioId.length()-2,ioId.length()).equals("_S")) {
						vo.setCoId("-");
						vo.setSensorId(ioId.substring(0,ioId.length()-2));
						vo.setReadValue(d.get("readValue").toString());

						vo.setReadDtm(d.get("readDtm").toString());
						vo.setFcltsId(d.get("fcltsId").toString());
						dataVO.add(vo);

					}
				}

			}
			int iResult = 0;
			if(dataVO.size()>0) {

				iResult = commonService.insertDeviceData(dataVO);
			}


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
		*/
	}

	@RequestMapping(value = "/openapiData.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public void getUserList(@ModelAttribute("openapiReqVO") OpenapiReqVO searchVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			//AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			//searchVO.setSessionCoId(authInfo.getSessionCoId());
			//searchVO.setSessionUserId(authInfo.getSessionUserId());
			searchVO.setOpenKey(searchVO.getOpenkey());
			LOGGER.info(searchVO.toString());
			List<?> check = openapiReqService.checkOpenapiKey(searchVO);
			if(check.size()==0) {

				response.setContentType("text/html; charset=UTF-8");

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", "인증키가 잘못되었습니다.");

				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				List<?> list = openapiReqService.selectOpenapiDataList(searchVO);

				response.setContentType("text/html; charset=UTF-8");

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", list);

				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			}


		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}
	@RequestMapping(value = "/insertFav.do", method=RequestMethod.POST)
	public void insertFav(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			int iResult = commonService.insertFav(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

			List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
			LoginMenuVO fav = new LoginMenuVO();
			fav.setSrnUrl(paramVO.getSrnUrl());
			fav.setMnuNm(paramVO.getMnuNm());
			favList.add(fav);

			authInfo.setFavList(favList);
			session.setAttribute("authInfo", authInfo);

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/deleteFav.do", method=RequestMethod.POST)
	public void deleteFav(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			int iResult = commonService.deleteFav(paramVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", iResult);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

			List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();

			int favcnt = 0;
			int targetcnt = -1;
			for(LoginMenuVO fav : favList) {
				if(fav.getSrnUrl().equals(paramVO.getSrnUrl())) {
					targetcnt = favcnt;
				}
				favcnt ++;
			}
			if(targetcnt>=0) {
				favList.remove(targetcnt);
			}

			authInfo.setFavList(favList);
			session.setAttribute("authInfo", authInfo);

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	public void insertMenuConHist(MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		try {
			int iResult = commonService.insertMenuConHist(paramVO);

		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/excel/download.do", method=RequestMethod.POST)
	public void excelDownload(@RequestBody Map<String, Object> data, HttpServletResponse response) throws IOException {

	    List<Map<String, String>> tableData = (List<Map<String, String>>) data.get("tableData");
	    List<String> headers = (List<String>) data.get("headers");

	    Workbook wb = new XSSFWorkbook();
	    Sheet sheet = wb.createSheet("Road Statistics");

	    sheet.setDefaultColumnWidth(12); // 기본 col width

	    // Header
	    Row headerRow = sheet.createRow(0);
	    for (int i = 0; i < headers.size(); i++) {
	    	 Cell cell = headerRow.createCell(i);
		     cell.setCellValue(headers.get(i));
		     cell.setCellStyle(CellStyleSetting(wb, "headers"));
	        System.out.println("헤더데이터 확인: " + headers.get(i));
	    }

	    // Body
	    int rowNum = 1;
	    for (Map<String, String> rowData : tableData) {
	        Row row = sheet.createRow(rowNum++);
	        for (int i = 0; i < headers.size(); i++) {
	        	Cell rowCell = row.createCell(i);
	        	rowCell.setCellValue(rowData.getOrDefault("col" + i, ""));
	        	rowCell.setCellStyle(CellStyleSetting(wb, "rowCell"));
	            System.out.println("로우데이터 확인: " + rowData.get("col1"));
	        }
	    }

	    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	    response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	    // Excel File Output
	    wb.write(response.getOutputStream());

	}

	 @RequestMapping(value = "/excel/yearly/download.do", method = RequestMethod.POST)
     public void yearlyExcelDownload(@RequestBody Map<String, Object> data, HttpServletResponse response) throws IOException {

        XSSFWorkbook wb = new XSSFWorkbook();
        // 양식 파일의 첫 번째 시트를 선택
        Sheet sheet = wb.createSheet("Road Yearly Statistics");

        sheet.setDefaultColumnWidth(12); // 기본 col width

        // 클라이언트에서 전송된 JSON 데이터에서 테이블 데이터와 헤더를 추출
        List<Map<String, String>> tableData = (List<Map<String, String>>) data.get("tableData");
        List<String> headers = (List<String>) data.get("headers");

        // Header
  	    Row headerRow = sheet.createRow(0);
  	    for (int i = 0; i < headers.size(); i++) {
  	    	 Cell cell = headerRow.createCell(i);
  		     cell.setCellValue(headers.get(i));
  		     cell.setCellStyle(CellStyleSetting(wb, "headers"));
  	        System.out.println("헤더데이터 확인: " + headers.get(i));
  	    }

  	    // Body
  	    int rowNum = 1;
  	    for (Map<String, String> rowData : tableData) {
  	        Row row = sheet.createRow(rowNum++);
  	        for (int i = 0; i < headers.size(); i++) {
  	        	Cell rowCell = row.createCell(i);
  	        	rowCell.setCellValue(rowData.getOrDefault("col" + i, ""));
  	        	rowCell.setCellStyle(CellStyleSetting(wb, "rowCell"));
  	            System.out.println("로우데이터 확인: " + rowData.get("col1"));
  	        }
  	    }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel 파일 출력
        wb.write(response.getOutputStream());

    }

    public CellStyle CellStyleSetting(Workbook workbook, String cellType) {

    	XSSFCellStyle cellStyle = (XSSFCellStyle) workbook.createCellStyle();

    	// 폰트 설정
        XSSFFont fontOfGothic = (XSSFFont) workbook.createFont();
        fontOfGothic.setFontName("맑은 고딕");
        fontOfGothic.setBold(false);
        cellStyle.setFont(fontOfGothic);

        // 가는 경계선 설정
        cellStyle.setBorderTop(BorderStyle.THIN);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);

        if (cellType.equals("headers")) {
            // 배경색 회색
            cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            fontOfGothic.setBold(true);
        }

        // 데이터는 가운데 정렬
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); // 중앙 정렬

        return cellStyle;
    }

    /*@RequestMapping(value = "/excel/yearly/download.do", method=RequestMethod.POST)
   	public void yearlyExcelDownload(@RequestBody Map<String, Object> data, HttpServletRequest request, HttpServletResponse response) throws IOException {
       	String formPath = request.getServletContext().getRealPath("excel/example.xlsx");

   	    // 양식 파일(sample.xlsx)을 입력 스트림으로 열기
   	    InputStream fis = new FileInputStream(formPath);
   	    XSSFWorkbook wb = new XSSFWorkbook(fis);

   	    // 양식 파일의 첫 번째 시트를 선택
   	    Sheet sheet = wb.getSheet("Sheet1");

   	    // 클라이언트에서 전송된 JSON 데이터에서 테이블 데이터와 헤더를 추출
   	    List<Map<String, String>> tableData = (List<Map<String, String>>) data.get("tableData");
   	    List<String> headers = (List<String>) data.get("headers");

   	    // Header
   	    Row headerRow = sheet.getRow(2);
   	    for (int i = 0; i < headers.size(); i++) {
   	        headerRow.createCell(i+1).setCellValue(headers.get(i));

   	        System.out.println("로우데이터 확인: " + headers.get(i));
   	    }

   	    // Body
   	    int rowNum = 3;
   	    for (Map<String, String> rowData : tableData) {
   	        Row row = sheet.getRow(rowNum++);
   	        for (int i = 0; i < headers.size(); i++) {
   	            row.createCell(i).setCellValue(rowData.getOrDefault("col" + i, ""));
   	            System.out.println("로우데이터 확인: " + rowData.get("col"+i));
   	        }
   	    }

   	    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
   	    response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

   	    // Excel File Output
   	    wb.write(response.getOutputStream());

   	    // 자원 해제
   	    fis.close();

       }*/

 // 엑셀 템플릿 양식 사용하는경우
 /*   @RequestMapping(value = "/excel/yearly/download.do", method = RequestMethod.POST)
    public void yearlyExcelDownload(@RequestBody Map<String, Object> data, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String formPath = request.getServletContext().getRealPath("excel/example.xlsx");

        // 양식 파일(example.xlsx)을 입력 스트림으로 열기
        InputStream fis = new FileInputStream(formPath);
        XSSFWorkbook wb = new XSSFWorkbook(fis);

        // 양식 파일의 첫 번째 시트를 선택
        Sheet sheet = wb.getSheet("Sheet1");

        // 클라이언트에서 전송된 JSON 데이터에서 테이블 데이터와 헤더를 추출
        List<Map<String, String>> tableData = (List<Map<String, String>>) data.get("tableData");
        List<String> headers = (List<String>) data.get("headers");

        // Header
        Row headerRow = sheet.getRow(2);

        // 기존 스타일을 가져올 셀 (예: 헤더 행의 첫 번째 셀에서 스타일을 가져옴)
        CellStyle headerCellStyle = headerRow.getCell(1).getCellStyle();

        for (int i = 0; i < headers.size(); i++) {
            Cell cell = headerRow.createCell(i + 1); // 기존 스타일을 유지하며 새로운 셀 생성
            cell.setCellValue(headers.get(i));
            cell.setCellStyle(headerCellStyle); // 스타일 적용

            System.out.println("헤더 데이터 확인: " + headers.get(i));
        }

        // Body
        int rowNum = 3;
        for (Map<String, String> rowData : tableData) {
            Row row = sheet.getRow(rowNum++);
            if (row == null) {
                row = sheet.createRow(rowNum - 1);
            }

            // 기존 스타일을 가져올 셀 (예: 데이터 행의 첫 번째 셀에서 스타일을 가져옴)
            CellStyle bodyCellStyle = row.getCell(1) != null ? row.getCell(1).getCellStyle() : wb.createCellStyle();

            for (int i = 0; i < headers.size(); i++) {
                Cell cell = row.createCell(i+1);
                cell.setCellValue(rowData.getOrDefault("col" + i, ""));
                cell.setCellStyle(bodyCellStyle); // 스타일 적용

                System.out.println("행 데이터 확인: " + rowData.get("col" + i));
            }
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel 파일 출력
        wb.write(response.getOutputStream());

        // 자원 해제
        fis.close();

    }*/


}
