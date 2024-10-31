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
package egovframework.zieumtn.system.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.system.vo.PageVO;
import egovframework.zieumtn.system.vo.ServiceVO;
import egovframework.zieumtn.system.vo.UserVO;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface UserService {

	List<?> selectUserList(UserVO vo) throws Exception;


	int getUserIdCheck(UserVO vo) throws Exception;

	int insertUser(UserVO paramVO) throws Exception;

	int reqUser(UserVO paramVO) throws Exception;

	int updateUser(UserVO paramVO) throws Exception;

	int updateUserPwd(UserVO paramVO) throws Exception;

	int deleteUser(UserVO paramVO) throws Exception;

	int approveUser(UserVO paramVO) throws Exception;

	List<?> selectAdminList(UserVO vo) throws Exception;

	int updateUserStat(UserVO paramVO) throws Exception;

	int resetPwd(UserVO paramVO) throws Exception;


	int chkResetPwd(UserVO paramVO) throws Exception;	// 비밀번호 체크 전 일치하는 값이 있는지 확인



}
