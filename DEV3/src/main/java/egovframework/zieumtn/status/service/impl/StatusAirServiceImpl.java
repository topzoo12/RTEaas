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
package egovframework.zieumtn.status.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.zieumtn.statis.dao.StatisDayDAO;
import egovframework.zieumtn.statis.dao.StatisPeriodDAO;
import egovframework.zieumtn.statis.dao.StatisTimeDAO;
import egovframework.zieumtn.statis.service.StatisDayService;
import egovframework.zieumtn.statis.service.StatisPeriodService;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisDayVO;
import egovframework.zieumtn.statis.vo.StatisPeriodVO;
import egovframework.zieumtn.statis.vo.StatisTimeVO;
import egovframework.zieumtn.status.dao.StatusAirDAO;
import egovframework.zieumtn.status.dao.StatusRealTimeDAO;
import egovframework.zieumtn.status.service.StatusAirService;
import egovframework.zieumtn.status.service.StatusRealTimeService;
import egovframework.zieumtn.status.vo.StatusAirVO;
import egovframework.zieumtn.status.vo.StatusRealTimeVO;

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

@Service("statusAirService")
public class StatusAirServiceImpl extends EgovAbstractServiceImpl implements StatusAirService {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatusAirServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "statusAirDAO")
	private StatusAirDAO statusAirDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;


	@Override
	public List<?> selectStatusAirList(StatusAirVO vo) throws Exception {
		List<?> rs = statusAirDAO.selectStatusAirList(vo);
		return rs;
	}


}
