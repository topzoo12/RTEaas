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
package egovframework.zieumtn.common.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonDefaultVO;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.common.service.DeviceDataVO;
import egovframework.zieumtn.common.service.LoginVO;
import egovframework.zieumtn.common.service.MainDataVO;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.MessageVO;

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

@Repository("commonDAO")
public class CommonDAO extends EgovAbstractDAO {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSample(CommonVO vo) throws Exception {
		return (String) insert("commonDAO.insertSample", vo);
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateSample(CommonVO vo) throws Exception {
		update("commonDAO.updateSample", vo);
	}

	public List<?> selectCommonList(CommonVO vo) throws Exception {
		return list("commonDAO.selectCommonList",vo);
	}

	public List<?> selectBestDataMaster(MainDataVO vo) throws Exception {
		return list("commonDAO.selectBestDataMaster",vo);
	}

	public List<?> selectWorstDataMaster(MainDataVO vo) throws Exception {
		return list("commonDAO.selectWorstDataMaster",vo);
	}

	public List<?> selectMainDataDetail(MainDataVO vo) throws Exception {
		return list("commonDAO.selectMainDataDetail",vo);
	}

	public int insertFav(MenuVO paramVO) {
		int iResult = 0;
		try {
			insert("commonDAO.insertFav",paramVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteFav(MenuVO paramVO) {
		int iResult = 0;
		try {
			insert("commonDAO.deleteFav",paramVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int insertMenuConHist(MenuVO paramVO) {
		int iResult = 0;
		try {
			update("commonDAO.insertMenuConHist",paramVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int insertLoginHist(AuthVO paramVO) {
		int iResult = 0;
		try {
			update("commonDAO.insertLoginHist",paramVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int insertDeviceData(List<DeviceDataVO> dataVO) {
		int iResult = 0;
		try {
			insert("commonDAO.insertDeviceData",dataVO);
			iResult = dataVO.size();;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public List<?> getMenuByUrl(MenuVO logVO) {
		return list("commonDAO.getMenuByUrl",logVO);
	}

	public List<?> selectCoList() {
		return list("commonDAO.selectCoList");
	}

	public List<?> selectCdNa(String coId) {
		return list("commonDAO.selectCdna",coId);
//		List<?> result = list("commonDAO.selectCdna",coId);
//		return result.toString();
	}

	public void updateLastData(DeviceDataVO deviceDataVO) {
		try {
			insert("commonDAO.updateLastData",deviceDataVO);
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
		}
	}

	public List<?> getMsg(String msgId) {
		return  list("commonDAO.getMsg", msgId);
	}

	public int insertApikey(AuthVO authVO) {
		int iResult = 0;
		try {
			update("commonDAO.insertApikey",authVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteApiKey(LoginVO loginVO) {
		int iResult = 0;
		try {
			update("commonDAO.deleteApiKey",loginVO);
			iResult = 1;
		}
		catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

}
