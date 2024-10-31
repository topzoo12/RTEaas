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
import egovframework.zieumtn.system.vo.UserVO;

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

@Repository("userDAO")
public class UserDAO extends EgovAbstractDAO {

	public List<?> selectUserList(UserVO vo) throws Exception {
		return list("userDAO.selectUserList", vo);
	}


	public int getUserIdCheck(UserVO vo) throws Exception {
		return (int) select("userDAO.getUserIdCheck", vo);
	}

	public int insertUser(UserVO paramVO) {
		int iResult = 0;
		try {
			insert("userDAO.insertUser",paramVO);
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

	public int reqUser(UserVO paramVO) {
		int iResult = 0;
		try {
			insert("userDAO.reqUser",paramVO);
			insert("userDAO.inserAuthgrptUser",paramVO);
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

	public int inserAuthgrptUser(UserVO paramVO) {
		int iResult = 0;
		try {
			insert("userDAO.inserAuthgrptUser",paramVO);
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

	public int updateUser(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.updateUser",paramVO);
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

	public int updateUserStat(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.updateUserStat",paramVO);
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

	public int updateAuthgrpUser(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.updateAuthgrpUser",paramVO);
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

	public int updateUserPwd(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.updateUserPwd",paramVO);
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

	public int resetPwd(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.resetPwd",paramVO);
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

	public int deleteUser(UserVO paramVO) {
		int iResult = 0;
		try {
			delete("userDAO.deleteUser",paramVO);
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

	public int deleteAuthgrpUser(UserVO paramVO) {
		int iResult = 0;
		try {
			delete("userDAO.deleteAuthgrpUser",paramVO);
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

	public int approveUser(UserVO paramVO) {
		int iResult = 0;
		try {
			update("userDAO.approveUser",paramVO);
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

	public List<?> selectAdminList(UserVO vo) {
		return list("userDAO.selectAdminList", vo);
	}

	public int getUserPwdCheck(UserVO paramVO) {
		return (int) select("userDAO.getUserPwdCheck", paramVO);
	}


	public  List<?>  chkResetPwd(UserVO paramVO) {
		return list("userDAO.chkResetPwd", paramVO);
	}


}
