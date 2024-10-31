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
package egovframework.zieumtn.statis.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.zieumtn.statis.dao.StatisMonthDAO;
import egovframework.zieumtn.statis.service.StatisMonthService;
import egovframework.zieumtn.statis.vo.StatisMonthVO;

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

@Service("statisMonthService")
public class StatisMonthServiceImpl extends EgovAbstractServiceImpl implements StatisMonthService {

	private static final Logger LOGGER = LoggerFactory.getLogger(StatisMonthServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "statisMonthDAO")
	private StatisMonthDAO statisMonthDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	@Override
	public List<?> selectStatisMonthList(StatisMonthVO vo) throws Exception {
		List<?> rs = statisMonthDAO.selectStatisMonthList(vo);
		return rs;
	}


}
