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
package egovframework.zieumtn.common.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.common.service.DeviceDataVO;
import egovframework.zieumtn.common.service.LoginVO;
import egovframework.zieumtn.common.service.MainDataVO;
import egovframework.zieumtn.system.vo.MenuVO;

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

@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonServiceImpl.class);

	// TODO ibatis 사용
	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertSample(CommonVO vo) throws Exception {

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);

		commonDAO.insertSample(vo);
		return id;
	}

	public List<?> selectCommonList(CommonVO vo) throws Exception {
		List<?> rs = commonDAO.selectCommonList(vo);
		return rs;

	}

	@Override
	public int insertFav(MenuVO paramVO) throws Exception {
		int rs = commonDAO.insertFav(paramVO);
		return rs;
	}

	@Override
	public int deleteFav(MenuVO paramVO) throws Exception {
		int rs = commonDAO.deleteFav(paramVO);
		return rs;
	}

	@Override
	public int insertMenuConHist(MenuVO paramVO) throws Exception {
		int rs = commonDAO.insertMenuConHist(paramVO);
		return rs;
	}

	@Override
	public int insertLoginHist(AuthVO paramVO) throws Exception {
		int rs = commonDAO.insertLoginHist(paramVO);
		return rs;
	}

	@Override
	public int insertDeviceData(List<DeviceDataVO> dataVO) throws Exception {
		commonDAO.updateLastData(dataVO.get(0));
		int rs = commonDAO.insertDeviceData(dataVO);
		return rs;
	}

	@Override
	public List<?> selectBestDataMaster(MainDataVO vo) throws Exception {
		List<?> rs = commonDAO.selectBestDataMaster(vo);
		return rs;
	}

	@Override
	public List<?> selectWorstDataMaster(MainDataVO vo) throws Exception {
		List<?> rs = commonDAO.selectWorstDataMaster(vo);
		return rs;
	}

	@Override
	public List<?> selectMainDataDetail(MainDataVO vo) throws Exception {
		List<?> rs = commonDAO.selectMainDataDetail(vo);
		return rs;
	}

	@Override
	public List<?> getMenuByUrl(MenuVO logVO) throws Exception {
		List<?> rs = commonDAO.getMenuByUrl(logVO);
		return rs;
	}

	@Override
	public List<?> selectCoList() throws Exception {
		List<?> rs = commonDAO.selectCoList();
		return rs;
	}

	@Override
	public List<?> getMsg(String msgId) throws Exception {
		List<?> rs = commonDAO.getMsg(msgId);
		return rs;
	}

	@Override
	public int insertApikey(AuthVO authVO) {
		int rs = commonDAO.insertApikey(authVO);
		return rs;
	}

	@Override
	public int deleteApiKey(LoginVO loginVO) {
		int rs = commonDAO.deleteApiKey(loginVO);
		return rs;
	}
}
