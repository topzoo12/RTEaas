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
import egovframework.zieumtn.system.dao.ServiceDAO;
import egovframework.zieumtn.system.service.ServiceService;
import egovframework.zieumtn.system.vo.PageVO;
import egovframework.zieumtn.system.vo.ServiceVO;

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

@Service("serviceService")
public class ServiceServiceImpl extends EgovAbstractServiceImpl implements ServiceService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ServiceServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "serviceDAO")
	private ServiceDAO serviceDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	@Override
	public List<?> selectServiceList(ServiceVO vo) throws Exception {
		List<?> rs = serviceDAO.selectServiceList(vo);
		return rs;
	}

	@Override
	public List<?> selectDistrictList(ServiceVO vo) throws Exception {
		List<?> rs = serviceDAO.selectDistrictList(vo);
		return rs;
	}

	@Override
	public List<?> selectStationList(ServiceVO vo) throws Exception {
		List<?> rs = serviceDAO.selectStationList(vo);
		return rs;
	}

	@Override
	public ServiceVO selectServiceManagerMail(ServiceVO  vo) throws Exception {
		ServiceVO rs = serviceDAO.selectServiceManagerMail(vo);
		return rs;
	}

	@Override
	public Object insertService(ServiceVO paramVO) throws Exception {
		Object rs = serviceDAO.insertService(paramVO);
		return rs;
	}

	@Override
	public Object reqService(ServiceVO paramVO) throws Exception {
		Object rs = serviceDAO.reqService(paramVO);
		return rs;
	}

	@Override
	public int confirmService(ServiceVO paramVO) throws Exception {
		int rs = serviceDAO.confirmService(paramVO);
		return rs;
	}
	@Override
	public int updateService(ServiceVO paramVO) throws Exception {
		int rs = serviceDAO.updateService(paramVO);
		return rs;
	}

	@Override
	public int deleteService(ServiceVO paramVO) throws Exception {
		int rs = serviceDAO.deleteService(paramVO);
		return rs;
	}

}
