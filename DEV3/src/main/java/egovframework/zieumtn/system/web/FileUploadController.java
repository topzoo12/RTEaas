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

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;


import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.ReturnDTO;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.service.FileUploadService;
import egovframework.zieumtn.system.service.MenuService;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.service.OwnerService;
import egovframework.zieumtn.system.service.SysDeviceService;
import egovframework.zieumtn.system.vo.FileVO;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.PageVO;
import egovframework.zieumtn.system.vo.UserVO;
import egovframework.zieumtn.system.vo.sysDeviceVO;
import net.sf.json.JSONObject;

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
public class FileUploadController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "fileUploadService")
	private FileUploadService fileUploadService;

	@Resource(name = "menuService")
	private MenuService menuService;

	@Resource(name = "commonService")
	private CommonService commonService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;


	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "ownerService")
	private OwnerService ownerService;

	@RequestMapping(value = "/com/FileUpload.do")
	public ModelAndView fileUpload(@ModelAttribute("UserVO") UserVO paramVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		paramVO.setSessionCoId(authInfo.getSessionCoId());
		paramVO.setCoId(authInfo.getSessionCoId());
		paramVO.setSessionUserId(authInfo.getSessionUserId());


		ModelAndView mv = new ModelAndView("/com/FileUpload");

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList", list);

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for (LoginMenuVO fav : favList) {
			if (fav.getSrnUrl().equals("/com/FileUpload")) {
				mv.addObject("fav", "message");
			}
		}

		FileVO fileVO = new FileVO();
		fileVO.setCoId(authInfo.getCoId());
		fileVO.setSessionCoId(authInfo.getSessionCoId());

		List<?> fileList = fileUploadService.selectFileList(fileVO);

		System.out.println("--------------------------");
		System.out.println(fileList);

		mv.addObject("resultList", fileList);
		mv.addObject("totCnt", fileList.size());

		return mv;
	}


	@RequestMapping(value = "/getFileList.do", method=RequestMethod.POST)
	public void getPageList(@ModelAttribute("FileVO") FileVO fileVO, HttpServletResponse response) throws Exception {
		//ModelAndView mv = new ModelAndView("/getData");
		try {

			List<?> fileList = fileUploadService.selectFileList(fileVO);

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", fileList);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	@RequestMapping(value = "/api/files")
	public ModelAndView menuList(@ModelAttribute("menuVO") MenuVO searchVO, ModelMap model, HttpSession session) throws Exception {
		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		searchVO.setSessionCoId(authInfo.getSessionCoId());
		searchVO.setSessionUserId(authInfo.getSessionUserId());
		searchVO.setCoId(authInfo.getSessionCoId());

		List<?> menuList = menuService.selectMenuList(searchVO);

		ModelAndView mv = new ModelAndView("/com/menuList");

		List<?> coList = commonService.selectCoList();
		mv.addObject("selectListCo", coList);

		mv.addObject("resultList", menuList);
		mv.addObject("totCnt", menuList.size());

		List<LoginMenuVO> favList = (List<LoginMenuVO>) authInfo.getFavList();
		for(LoginMenuVO fav : favList){
			if(fav.getSrnUrl().equals("/com/menuList")) {
				mv.addObject("fav", "message");
			}
		}
		return mv;
	}
/*

	@PostMapping("/upload.do")
	public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
		System.out.println("--------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------");
		System.out.println("--------------------------------------------------------------------------------------");
		return ResponseEntity.ok("File uploaded successfully!");
	}
*/

	@RequestMapping(value = "/upload.do")
	public void uploadTest(@RequestParam MultipartFile file, HttpServletResponse response, HttpSession session) throws Exception {


		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

		String uploadFolder = "/mnt/FileUpload";

		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));

		//File saveFile = new File(uploadFolder, MultipartFile.getOriginalFilename());
		//File saveFile = new File(uploadFolder, file.getOriginalFilename());

		FileVO fileParam = new FileVO();
		fileParam.setCoId(authInfo.getSessionCoId());
		fileParam.setUserId(authInfo.getSessionUserId());
		fileParam.setFileNm(file.getOriginalFilename());
		fileParam.setFilePath(uploadFolder);
		fileParam.setFileType(file.getContentType());
		fileParam.setInsertDate(todayfm);
		//fileParam.setFileSize((long) file.getSize());
		//fileParam.setFileSize(file.getSize()); String.valueOf((long) Math.floor(insertId))
		fileParam.setFileSize((int) file.getSize());



		Path path = Paths.get(uploadFolder + "/" + file.getOriginalFilename()).toAbsolutePath();

		File destinationFile = new File("/path/to/destination");

		String filePath = uploadFolder + "/" + file.getOriginalFilename();

		//file.transferTo(path.toFile());


		try {
			Double insertId = fileUploadService.insertFileUpload(fileParam);

			//int iResult = sysDeviceService.insertSysDevice(paramVO);
/*
			if (iResult > 0) {
				System.out.println("success");
			}
*/
			String fileEx = file.getOriginalFilename();
			fileEx.lastIndexOf(".");
			fileEx.substring(fileEx.lastIndexOf("."));
			/*System.out.println("******************************************************************************************************************");
			System.out.println(fileEx.substring(fileEx.lastIndexOf(".")));
			System.out.println(Double.toString((long) Math.floor(insertId)));
			System.out.println(String.valueOf((long) Math.floor(insertId)));
			System.out.println("******************************************************************************************************************");*/


			try (InputStream inputStream = file.getInputStream()) {
			    // 대상 파일로 복사
				Files.copy(inputStream, Paths.get(uploadFolder + "/" + String.valueOf((long) Math.floor(insertId)) + fileEx.substring(fileEx.lastIndexOf("."))), StandardCopyOption.REPLACE_EXISTING);
				//Files.copy(inputStream, Paths.get(uploadFolder + "/" + insertId), StandardCopyOption.REPLACE_EXISTING);
				//Files.copy(inputStream, Paths.get(uploadFolder + "/" + Double.toString(Math.floor(insertId)) + "", StandardCopyOption.REPLACE_EXISTING);
				//Files.move(file.getResource().getFile().toPath(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

				//if(iResult > 0 ) {
					//JSONObject message = messageService.getMessageObject(authInfo.getSessionCoId());
					JSONObject message = (authInfo.getChangedCdNa() == null || authInfo.getChangedCdNa().isEmpty())? messageService.getMessageObjectByUserRegion(authInfo.getCdNa()): messageService.getMessageObjectByUserRegion(authInfo.getChangedCdNa());

					response.setContentType("text/html; charset=UTF-8");

					JSONObject jsonObject = new JSONObject();

					jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00003").toString()));
					PrintWriter out = response.getWriter();
					out.write(jsonObject.toString());


				/*} else {
					throw new Exception();
				}*/
			}


		}catch(Exception e) {
			//log.error(e.getMessage());

		}


		/*paramVO.setSessionCoId(authInfo.getSessionCoId());
		paramVO.setCoId(authInfo.getSessionCoId());
		paramVO.setSessionUserId(authInfo.getSessionUserId());*/

	}




	/*@RequestMapping(value = "/deleteMenu.do", method=RequestMethod.POST)
	public void deletePage(@ModelAttribute("menuVO") MenuVO paramVO, HttpServletResponse response, HttpSession session) throws Exception {
		JSONObject message = messageService.getMessageObject();

		try {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

			paramVO.setSessionCoId(authInfo.getSessionCoId());
			paramVO.setSessionUserId(authInfo.getSessionUserId());
			paramVO.setCoId(authInfo.getSessionCoId());

			int iResult = menuService.deleteMenu(paramVO);


			if(iResult >0){
				response.setContentType("text/html; charset=UTF-8");
				JSONObject jsonObject = new JSONObject();

				jsonObject.put("result", new ReturnDTO(0000, message.get("MSG00010").toString()));
				PrintWriter out = response.getWriter();
				out.write(jsonObject.toString());
			} else {
				throw new Exception();
			}

		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00008").toString()));
			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());


		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());

			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("result", new ReturnDTO(9001, message.get("MSG00005").toString()));
			PrintWriter out = response.getWriter();

			out.write(jsonObject.toString());

		}
	}*/
}
