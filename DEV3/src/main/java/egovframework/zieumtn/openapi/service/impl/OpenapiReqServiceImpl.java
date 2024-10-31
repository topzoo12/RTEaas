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
package egovframework.zieumtn.openapi.service.impl;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.zieumtn.openapi.dao.DataTargetDAO;
import egovframework.zieumtn.openapi.dao.OpenapiReqDAO;
import egovframework.zieumtn.openapi.service.DataTargetService;
import egovframework.zieumtn.openapi.service.OpenapiReqService;
import egovframework.zieumtn.openapi.vo.DataTargetVO;
import egovframework.zieumtn.openapi.vo.OpenapiReqVO;

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

@Service("openapiReqService")
public class OpenapiReqServiceImpl extends EgovAbstractServiceImpl implements OpenapiReqService {

	private static final Logger LOGGER = LoggerFactory.getLogger(OpenapiReqServiceImpl.class);

	// TODO ibatis 사용
	@Resource(name = "openapiReqDAO")
	private OpenapiReqDAO openapiReqDAO;

	@Override
	public List<?> selectOpenapiReqList(OpenapiReqVO vo) throws Exception {
		List<?> rs = openapiReqDAO.selectOpenapiReqList(vo);
		return rs;
	}
	@Override
	public List<?> checkOpenapiKey(OpenapiReqVO vo) throws Exception {
		List<?> rs = openapiReqDAO.checkOpenapiKey(vo);
		return rs;
	}

	@Override
	public int reqOpenapi(OpenapiReqVO vo) throws Exception {
		int rs = openapiReqDAO.reqOpenapi(vo);
		return rs;
	}

	@Override
	public int approveOpenapi(OpenapiReqVO vo) throws Exception {
		int rs = openapiReqDAO.approveOpenapi(vo);
		return rs;
	}
	@Override
	public List<?> selectOpenapiDataList(OpenapiReqVO searchVO) throws Exception {
		List<?> rs = openapiReqDAO.selectOpenapiDataList(searchVO);
		return rs;
	}

}
