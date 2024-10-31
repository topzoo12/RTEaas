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
package egovframework.zieumtn.device.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.zieumtn.common.service.impl.AdtAbstractDAO;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.device.vo.SensorInfoVO;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
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

@Repository("deviceDAO")
public class DeviceDAO extends EgovAbstractDAO {

	public List<?> selectDeviceCodeList(FcltsInfoVO vo) throws Exception {
		return list("deviceDAO.selectDeviceCodeList", vo);
	}

	public List<?> selectDeviceList(FcltsInfoVO vo) {
		return list("deviceDAO.selectDeviceList", vo);
	}

	public int insertDevice(FcltsInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.insertDevice",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int updateDevice(FcltsInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.updateDevice",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteDevice(FcltsInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.deleteDevice",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public List<?> selectIoList(SensorInfoVO searchVO) {
		return list("deviceDAO.selectIoList", searchVO);
	}

	public int insertIo(SensorInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.insertIo",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int updateIo(SensorInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.updateIo",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteIo(SensorInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.deleteIo",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int insertIoCode(FcltsInfoVO paramVO) {
		int iResult = 0;
		try {
			update("deviceDAO.insertIoCode",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteIoCode(FcltsInfoVO paramVO) {
		int iResult = 0;
		try {
			insert("deviceDAO.deleteIoCode",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public List<?> checkDevice(FcltsInfoVO paramVO) {
		return list("deviceDAO.checkDevice", paramVO);
	}

}
