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
import egovframework.zieumtn.system.vo.AuthgrpMenuVO;
import egovframework.zieumtn.system.vo.AuthgrpUserVO;
import egovframework.zieumtn.system.vo.AuthgrpVO;
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

@Repository("authgrpUserDAO")
public class AuthgrpUserDAO extends EgovAbstractDAO {

	public List<?> selectAuthgrpUserList(AuthgrpUserVO vo) throws Exception {
		return list("authgrpUserDAO.selectAuthgrpUserList", vo);
	}

}
