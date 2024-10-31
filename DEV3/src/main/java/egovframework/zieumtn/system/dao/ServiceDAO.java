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
package egovframework.zieumtn.system.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.zieumtn.system.vo.ServiceVO;

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

@Repository("serviceDAO")
public class ServiceDAO extends EgovAbstractDAO {

	public List<?> selectServiceList(ServiceVO vo) throws Exception {
		return list("serviceDAO.selectServiceList", vo);
	}

	public List<?> selectDistrictList(ServiceVO vo) {
		return list("serviceDAO.selectDistrictList", vo);
	}

	public List<?> selectStationList(ServiceVO vo) {
		return list("serviceDAO.selectStationList", vo);
	}

	public ServiceVO  selectServiceManagerMail(ServiceVO vo) {
        return (ServiceVO) select("serviceDAO.selectServiceManagerMail", vo);
    }

	public Object insertService(ServiceVO paramVO) throws Exception {
		int iResult = 0;
		Object result = new Object();

		try {
			result = insert("serviceDAO.insertService",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return result;
	}

	public Object reqService(ServiceVO paramVO) throws Exception {
		int iResult = 0;
		Object result = new Object();

		try {
			result = insert("serviceDAO.reqService",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return result;
	}

	public int confirmService(ServiceVO paramVO) {
		int iResult = 0;
		try {
			insert("serviceDAO.confirmService",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}
	public int updateService(ServiceVO paramVO) throws Exception {
		int iResult = 0;
		try {
			insert("serviceDAO.updateService",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
			iResult = -1;
		}
		catch(Exception e) {
			System.err.println("에러 발생::"+e.toString());
			iResult = -1;
		}
		return iResult;
	}

	public int deleteService(ServiceVO paramVO) throws Exception {
		int iResult = 0;
		try {
			insert("serviceDAO.deleteService",paramVO);
			iResult = 1;
		}catch(NullPointerException e) {
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
