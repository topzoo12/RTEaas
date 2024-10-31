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
package egovframework.zieumtn.status.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.zieumtn.statis.vo.StatisDayVO;
import egovframework.zieumtn.statis.vo.StatisPeriodVO;
import egovframework.zieumtn.statis.vo.StatisTimeVO;
import egovframework.zieumtn.status.vo.StatusCarVO;
import egovframework.zieumtn.status.vo.StatusRealTimeVO;
import egovframework.zieumtn.status.vo.StatusRunningVO;

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

@Repository("statusCarDAO")
public class StatusCarDAO extends EgovAbstractDAO {

	public List<?> selectStatusCarList(StatusCarVO vo) throws Exception {
		return list("carDAO.selectStatusCarList", vo);
	}

	public List<?> selectStatusCarDetailList(StatusCarVO vo) throws Exception {
		return list("carDAO.selectStatusCarDetailList", vo);
	}

	public int insertCar(StatusCarVO paramVO) throws Exception {
		int iResult = 0;
		try {
			insert("carDAO.insertCar",paramVO);
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

	public int updateCar(StatusCarVO paramVO) throws Exception {
		int iResult = 0;
		try {
			update("carDAO.updateCar",paramVO);
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

	public int deleteCar(StatusCarVO paramVO) throws Exception {
		int iResult = 0;
		try {
			delete("carDAO.deleteCar",paramVO);
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
