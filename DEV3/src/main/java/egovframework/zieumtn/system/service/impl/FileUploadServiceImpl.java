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
package egovframework.zieumtn.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.zieumtn.system.dao.FileUploadDAO;
import egovframework.zieumtn.system.service.FileUploadService;
import egovframework.zieumtn.system.vo.FileVO;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("fileUploadService")
public class FileUploadServiceImpl extends EgovAbstractServiceImpl implements FileUploadService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileUploadServiceImpl.class);

	@Resource(name = "FileUploadDAO")
	private FileUploadDAO FileUploadDAO;

	/** SampleDAO */
	// TODO ibatis 사용
	//@Resource(name = "sysDeviceDAO")
	//private sysDeviceDAO sysDeviceDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

/*	@Override
	public List<?> selectDeviceList(sysDeviceVO vo) throws Exception {
		List<?> rs = sysDeviceDAO.selectDeviceList(vo);
		return rs;
	}
*/


/*	@Override
	public int insertFileUpload() {

		int rs =  FileUploadDAO.insertFile();
		return rs;
	}*/
	@Override
	public List<?> selectFileList(FileVO FileVO) throws Exception {
		List<?> rs = FileUploadDAO.selectFileList(FileVO);
		return rs;
	}

	@Override
	public Double insertFileUpload(FileVO FileVO) {

		System.out.println("333333333333333333333333333333");
		Double rs =  (Double) FileUploadDAO.insertFile(FileVO);
		return rs;
	}



/*
	@Override
	public int insertSysDevice(sysDeviceVO paramVO) {

		int rs =  sysDeviceDAO.insertSysDevice(paramVO);
		return rs;
	}


	@Override
	public int updateSysDevice(sysDeviceVO paramVO) {
		int rs =  sysDeviceDAO.updateSysDevice(paramVO);
		return rs;
	}


	@Override
	public int deleteSysDevice(sysDeviceVO paramVO) {
		int rs =  sysDeviceDAO.deleteSysDevice(paramVO);
		return rs;
	}

*/


}
