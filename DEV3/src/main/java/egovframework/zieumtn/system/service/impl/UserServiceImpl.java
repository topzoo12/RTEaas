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

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.system.dao.UserDAO;
import egovframework.zieumtn.system.service.UserService;
import egovframework.zieumtn.system.vo.UserVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "userDAO")
	private UserDAO userDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	@Override
	public List<?> selectUserList(UserVO vo) throws Exception {
		List<?> rs = userDAO.selectUserList(vo);
		return rs;
	}


	@Override
	public int getUserIdCheck(UserVO vo) throws Exception {
		int rs = userDAO.getUserIdCheck(vo);
		return rs;
	}

	@Override
	public int insertUser(UserVO paramVO) throws Exception {
		int rs = userDAO.insertUser(paramVO);
		System.out.println("-------------------------------");
		System.out.println(paramVO);
		System.out.println("-------------------------------");
		System.out.println("-------------------------------");
		System.out.println(rs);
		if (rs > 0) {
			userDAO.inserAuthgrptUser(paramVO);
			rs = 1;
		} else {

			rs = 0;
		}
		return rs;
	}

	@Override
	public int reqUser(UserVO paramVO) throws Exception {
		int rs = userDAO.reqUser(paramVO);
		return rs;
	}

	@Override
	public int updateUser(UserVO paramVO) throws Exception {
		int rs = userDAO.updateUser(paramVO);
		userDAO.updateAuthgrpUser(paramVO);
		return rs;
	}
	@Override
	public int updateUserStat(UserVO paramVO) throws Exception {
		int rs = userDAO.updateUserStat(paramVO);
		return rs;
	}

	@Override
	public int updateUserPwd(UserVO paramVO) throws Exception {
		int rs = 0;
		int cnt = 1;
		if(paramVO.getSectNoOrg()!=null) {
			cnt = userDAO.getUserPwdCheck(paramVO);
		}

		if(cnt>0) {
			userDAO.updateUserPwd(paramVO);
			rs = 1;
		}
		return rs;
	}

	@Override
	public int resetPwd(UserVO paramVO) throws Exception {
		int rs = 0;
		int cnt = 1;

		if(cnt>0) {
			userDAO.resetPwd(paramVO);
			rs = 1;
		}
		return rs;
	}

	@Override
	public int chkResetPwd(UserVO paramVO) throws Exception {
		int rs = 0;
		int cnt = 1;

		List<?> list = userDAO.chkResetPwd(paramVO);
		if(list.size() > 0 ) {
			rs = 1;
		}

		return rs;
	}


	@Override
	public int deleteUser(UserVO paramVO) throws Exception {
		int rs = userDAO.deleteUser(paramVO);
		userDAO.deleteAuthgrpUser(paramVO);
		return rs;
	}

	@Override
	public int approveUser(UserVO paramVO) throws Exception {
		int rs = userDAO.approveUser(paramVO);
		return rs;
	}

	@Override
	public List<?> selectAdminList(UserVO vo) throws Exception {
		List<?> rs = userDAO.selectAdminList(vo);
		return rs;
	}


}
