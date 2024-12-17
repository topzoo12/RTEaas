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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
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

		String path = System.getProperty("user.dir");

		ModelAndView mv = new ModelAndView("/com/FileUpload");

		List<?> list = ownerService.getOpenList(null);
		mv.addObject("serviceList", list);
		mv.addObject("pathtest", path);

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
	public void fileUpload(@RequestParam MultipartFile file, HttpServletResponse response, HttpSession session) throws Exception {


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

/*
	@RequestMapping(value = "/fileDownload.do", method=RequestMethod.POST)
	public void fileDownload(@RequestParam("seqNo") String fileSeqNo, HttpServletResponse response) throws Exception {

		System.out.println("ddddddddddddddddd");
		// 업로드된 파일이 저장된 폴더
	    String uploadFolder = "/mnt/FileUpload";

	    System.out.println("------------------------------file down------------------------------");
	    System.out.println(fileSeqNo);

	    // 다운로드할 파일의 경로
	    Path filePath = Paths.get(uploadFolder, fileSeqNo);
	    Path filePath1 = Paths.get(uploadFolder, "83.pdf");

	    System.out.println("------------------------------file Path------------------------------");
	    System.out.println(filePath);
	    System.out.println(filePath1);

	    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

	    System.out.println(Files.exists(filePath));
	    System.out.println(Files.exists(filePath1));
	    // 파일 존재 여부 확인
	    if (!Files.exists(filePath1)) {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        response.getWriter().write("File not found.");
	        return;
	    }

	    System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");


	    //byte[] fileByte = FileUtils.readFileToByteArray(new File(uploadFolder + filePath1));
	    byte[] fileByte = FileUtils.readFileToByteArray(new File("/mnt/FileUpload/" + "83.pdf"));

	    writeToFile("83.pdf", fileByte);

	    // 파일 다운로드 설정
	    response.setContentType("application/octet-stream");
	    //response.setHeader("Content-Disposition", "attachment; filename=\"" + fileSeqNo + "\"");
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileSeqNo + "\"");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.setContentLength(fileByte.length);
	    response.getOutputStream().write(fileByte);

	    System.out.println("################################################################");
	    response.getOutputStream().close();

	    // 파일 스트림을 통해 다운로드
	    try (InputStream inputStream = Files.newInputStream(filePath1);
    		OutputStream outputStream = response.getOutputStream()) {


	    	byte[] buffer = new byte[8192];
	        int bytesRead;
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outputStream.write(buffer, 0, bytesRead);
	        }
	        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	        outputStream.flush();
	        System.out.println("$$$$$$$12123123123123123123");
	    } catch (IOException e) {
	    	e.printStackTrace(); // 에러 로그 출력
	    	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("Error occurred while downloading the file.");
	    }

	}
*/

/*
public void writeToFile(String filename, byte[] pData)

	{
	    if(pData == null){
	        return;
	    }

	    int lByteArraySize = pData.length;

	    System.out.println(filename);

	    try{

	        File lOutFile = new File("D:/filedown/" + filename);

	        FileOutputStream lFileOutputStream = new FileOutputStream(lOutFile);

	        lFileOutputStream.write(pData);

	        lFileOutputStream.close();

	    }catch(Throwable e){

	        e.printStackTrace(System.out);

	    }

	}
*/


@RequestMapping(value = "/fileDownload.do", method=RequestMethod.POST)
public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		//String filePath = (String)request.getParameter("FILE_PATH");
		//String fileName = (String)request.getParameter("FILE_NAME");
		//System.out.println(filePath);
		//System.out.println(fileName);
		//저장경로, 파일이름

		String fileName = request.getParameter("fileNm");

		String fileExtention = request.getParameter("fileExt");

		//String downFileName = fileName + "." + fileExtention;
		String chkFileName = request.getParameter("seqNo") + "." + fileExtention;
		String downFileName = fileName + "." + fileExtention;

		System.out.println("fileName - " + fileName);
		System.out.println("fileExtention - " + fileExtention);
		System.out.println("downFileName - " + downFileName);

		//File f = new File("/mnt/FileUpload/" + "83.pdf");
		File f = new File("/mnt/FileUpload/" + chkFileName);

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		byte b[] = new byte[4096];
		int read = 0;

		//String fileExtention = "pdf";//fileName.substring(fileName.lastIndexOf(".") + 1);

		if(f.isFile()){
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Accept-Ranges", "bytes");
			//response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("83gfdgf.pdf", "UTF-8") + ";");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(downFileName, "UTF-8") + ";");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setCharacterEncoding("UTF-8");
			switch (fileExtention){
				case "ppt": response.setContentType("application/vnd.ms-powerpoint; charset=utf-8");break;
				case "pptx": response.setContentType("application/vnd.openxmlformats-officedocument.presentationml.presentation; charset=utf-8");break;
				case "xls": response.setContentType("application/vnd.ms-excel; charset=utf-8");break;
				case "xlsx": response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=utf-8");break;
				case "doc": response.setContentType("application/msword; charset=utf-8");break;
				case "docx": response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document; charset=utf-8");break;
				case "pdf": response.setContentType("application/pdf; charset=utf-8");break;
				default :response.setContentType("application/octet-stream; charset=utf-8");break;
			}
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int)f.length());//size setting
			try{
				bis = new BufferedInputStream(new FileInputStream(f));
				bos = new BufferedOutputStream(response.getOutputStream());
				while((read = bis.read(b)) != -1){
					bos.write(b, 0, read);
				}
				bis.close();
				bos.flush();
				bos.close();
			}
			catch(Exception e){
				throw new Exception(" 파일 생성 에러가 발생하였습니다.");
			}
			finally{
				if(bis != null){
					bis.close();
				}
				//f.delete();
			}
		} else {
			throw new Exception("파일이 잘못 되었습니다.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}


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
