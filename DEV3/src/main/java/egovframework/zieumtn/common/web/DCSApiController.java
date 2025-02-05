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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.annotation.processing.FilerException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONException;

import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.zieumtn.common.service.impl.ApiVO;
import egovframework.zieumtn.openapi.service.DcsService;
import egovframework.zieumtn.openapi.vo.DcsServiceapiVO;
import egovframework.zieumtn.system.vo.UserVO;
import egovframework.zieumtn.system.vo.sysDeviceVO;

@Controller
public class DCSApiController {

	@Resource(name = "dcsService")
	private DcsService dcsService;


	@RequestMapping(value = "/uploadDetectedData.do", method = RequestMethod.POST, consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
	//public void jsonFileDown(@RequestPart HashMap<String,Object> param, @RequestPart(value = "image",required=false) MultipartFile image) throws Exception {
	public void jsonFileDown(HttpServletRequest req, HttpServletResponse response, @RequestParam String meta_json, //@RequestPart HashMap<String,Object> meta_json,
							@RequestPart(value = "uploadfile",required=false) List<MultipartFile> images) throws Exception {

		//System.out.println(req.getRequestURI());
		//System.out.println(req.getRequestURL());
		response.setContentType("text/html; charset=UTF-8");

		//System.out.println(images.isEmpty());

		JSONObject jsonObject = new JSONObject();
		JSONObject jObject = new JSONObject(meta_json);
		PrintWriter out = response.getWriter();


    	if ( jObject == null || jObject.isEmpty() ) {
    		//jsonObject.put("success", true);

    		jsonObject.put("message", "json data 가 없거나 비어있습니다.");
    		out.write(jsonObject.toString());

    		return;
    	}

    	try {

			if ( jObject.getJSONObject("frame_header") == null || jObject.getJSONObject("frame_header").isEmpty() ) {

				jsonObject.put("message", "frame_header가 없거나 비어있습니다.");
				out.write(jsonObject.toString());
	    		return;

			} else if ( jObject.getJSONObject("frame_header").getJSONObject("image_info_hdr") == null
						|| jObject.getJSONObject("frame_header").getJSONObject("image_info_hdr").isEmpty() ) {

				jsonObject.put("message", "frame_header.image_info_hdr 가 없거나 비어있음");
				out.write(jsonObject.toString());
	    		return;
			} else if ( jObject.getJSONObject("frame_header").getJSONObject("image_info_hdr").getJSONObject("upload") == null
					|| jObject.getJSONObject("frame_header").getJSONObject("image_info_hdr").getJSONObject("upload").isEmpty() ) {

				jsonObject.put("message", "frame_header.image_info_hdr.upload 가 없거나 비어있음");
				out.write(jsonObject.toString());
	    		return;
			}

    	} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			jsonObject.put("message", "Null 에러 발생::"+e.toString());
			out.write(jsonObject.toString());
    		return;

		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
			jsonObject.put("message", "Null 에러 발생::"+e.toString());
			out.write(jsonObject.toString());
    		return;

		}

    	JSONObject jObjectUpload = jObject.getJSONObject("frame_header").getJSONObject("image_info_hdr").getJSONObject("upload");

    	// JSON 문자열로 변환

    	//System.out.println("count가 있는지 체크 --  " + jObjectUpload.has("count")); // has 로 존재유무 구별 가능

    	//if ( !jObjectUpload.has("count") || jObjectUpload.getInt("count") < 1 ) {
    	if ( !jObjectUpload.has("count") ) {
    		// upload 에 포함된 내용 체크
    		jsonObject.put("message", "count 가 없거나 비어있음");
			out.write(jsonObject.toString());
    		return;

    	} else if ( jObjectUpload.getInt("count") > 0 ) {

    		if (!jObjectUpload.has("sequence")) {
    			jsonObject.put("message", "sequence 가 없음");
    			out.write(jsonObject.toString());
        		return;
    		}

    		if ( jObjectUpload.getJSONArray("sequence").isEmpty() || jObjectUpload.getJSONArray("sequence") == null ) {
        		jsonObject.put("message", "sequence 가  비어있음");
    			out.write(jsonObject.toString());
        		return;
        	}

    		if (images == null || images.isEmpty()) {

        		jsonObject.put("message", "첨부된 파일이 없습니다.");
    			out.write(jsonObject.toString());
        		return;
        	}

    	}



    	// ------------------------------------------------------------------------------------------------------------------------
		Date today = new Date(System.currentTimeMillis());

		//dateStr, year, month, day, hours, minutes, seconds, milliseconds;
		String dateStr = new SimpleDateFormat("yyyy/MM/dd").format(today);

		String year = new SimpleDateFormat("yyyy").format(today);
		String month = new SimpleDateFormat("MM").format(today);
		String day = new SimpleDateFormat("dd").format(today);

		String hours = new SimpleDateFormat("HH").format(today);
		String minutes = new SimpleDateFormat("mm").format(today);
		String seconds = new SimpleDateFormat("ss").format(today);
		String milliseconds = new SimpleDateFormat("SSS").format(today);

		String fname = year + month + day + "_" + hours + minutes + seconds + "_" + milliseconds + "_";
		String jsonIdx = String.format("%3s", 0).replace(" ", "0");
		String devieceName = jObject.getJSONObject("common").getJSONObject("system_info").getString("device_id");

		Integer frameCount = 0;
		Integer imageCount = 0;


		String jsonFileName = fname + jsonIdx + "_" + devieceName +  "_e.json";

		JSONArray frameInfoArray = jObject.getJSONArray("frame_info");

    	String uploadFolder = "/usr/local/datahub/uploaded/" + dateStr;

    	File dir = new File(uploadFolder);

		if(dir.exists() == false) {
            dir.mkdirs();
        }

		ArrayList<String> imageFileNames = new ArrayList<>();


    	if (jObjectUpload.has("sequence")) {

    		Integer uploadCount = jObjectUpload.getInt("count");
        	JSONArray checklist = jObjectUpload.getJSONArray("sequence");

        	if (jObjectUpload.getInt("count") > 0 || images.size() > 0 ) {

        		if (jObjectUpload.getInt("count") != images.size()) {
        			//System.out.println("json데이터의 정보와 파일의 숫자가 맞지 않음");
        			jsonObject.put("message", "json데이터의 정보와 파일의 숫자가 맞지 않습니다");
        			out.write(jsonObject.toString());
            		return;
        		}
        	}

        	for (int i = 0; i < images.size(); i++) {
        		for (int a = 0; a < checklist.length(); a++) {

            		if (images.get(i).getOriginalFilename().equals(checklist.get(a))) {

        				String imageFileName = fname + String.format("%3s", a).replace(" ", "0") + "_" + devieceName + "_e.jpg";

        				imageFileNames.add('"'+imageFileName+'"');

        				try {
        	    			InputStream inputStream = images.get(i).getInputStream();
        	    			// 대상 파일로 복사
        	    			Files.copy(inputStream, Paths.get(uploadFolder + "/" + imageFileName), StandardCopyOption.REPLACE_EXISTING);
        	    		} catch(NullPointerException e) {
        	    			System.err.println("Null 에러 발생::"+e.toString());
        	    			jsonObject.put("message", "Null 에러 발생::"+e.toString());
        	    			out.write(jsonObject.toString());
        	        		return;

        	    		} catch (Exception e) {
        	    			System.err.println("에러 발생::"+e.toString());
        	    			jsonObject.put("message", "Null 에러 발생::"+e.toString());
        	    			out.write(jsonObject.toString());
        	        		return;

        	    		}
        			}
            	}
        	}

        	if (frameInfoArray.length() > 0) {
    			frameCount = frameInfoArray.length();
    		}

    		if (images.size() > 0) {
    			imageCount = images.size();
    		}

    	}

    	// ------------------------------------------------------------------------------------------------------------------------

    	/*if (imageFileNames.size() < 1) {
    		imageFileNames.add('"'+imageFileName+'"');
    	}*/

		DcsServiceapiVO DcsVO = new DcsServiceapiVO();
		DcsVO.setPath(dateStr.replace("-", "/"));
		DcsVO.setFname(jsonFileName);
		DcsVO.setImgNames(imageFileNames.toString());
		DcsVO.setUrl(req.getRequestURI());
		DcsVO.setDeviceId(jObject.getJSONObject("common").getJSONObject("system_info").getString("device_id"));
		DcsVO.setFrmCnt(frameCount);
		DcsVO.setImgCnt(imageCount);




		//PrintWriter jsonFileOut = new PrintWriter(new FileWriter(uploadFolder + "/" + jsonFileName));
		BufferedWriter jsonFileOut = new BufferedWriter(new FileWriter(uploadFolder + "/" + jsonFileName));
		try {

			JSONObject TojsonObject = new JSONObject(meta_json);  // HashMap -> JSONObject 변환
            jsonFileOut.write(TojsonObject.toString(4));

			//jsonFileOut.write(meta_json.toString());
			//jsonFileOut.write(meta_json);
			//jsonFileOut.close();

			//Integer DcsInsert = dcsService.insertDcsData(DcsVO);

			if ( dcsService.insertDcsData(DcsVO) == 1 ) {
				jsonObject.put("success", true);

	    		jsonObject.put("message", "ok");
	    		out.write(jsonObject.toString());
			}


		} catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			jsonObject.put("message", "Null 에러 발생::"+e.toString());
			out.write(jsonObject.toString());
    		return;

		} catch (Exception e) {
			System.err.println("에러 발생::"+e.toString());
			jsonObject.put("message", "Null 에러 발생::"+e.toString());
			out.write(jsonObject.toString());
    		return;

		}



	}




}
