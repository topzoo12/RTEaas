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
package egovframework.zieumtn.device.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.zieumtn.device.dao.AdtDeviceDAO;
import egovframework.zieumtn.device.dao.DeviceDAO;
import egovframework.zieumtn.device.service.DeviceService;
import egovframework.zieumtn.device.vo.FcltsInfoVO;
import egovframework.zieumtn.device.vo.SensorInfoVO;
import egovframework.zieumtn.statis.dao.StatisTimeDAO;
import egovframework.zieumtn.statis.service.StatisTimeService;
import egovframework.zieumtn.statis.vo.StatisTimeVO;

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

@Service("deviceService")
public class DeviceServiceImpl extends EgovAbstractServiceImpl implements DeviceService {

	private static final Logger LOGGER = LoggerFactory.getLogger(DeviceServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "deviceDAO")
	private DeviceDAO deviceDAO;
	//@Resource(name = "adtdeviceDAO")
	//private AdtDeviceDAO adtdeviceDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	@Override
	public List<?> selectDeviceList(FcltsInfoVO vo) throws Exception {
		List<?> rs = deviceDAO.selectDeviceList(vo);
		return rs;
	}

	@Override
	public List<?> selectDeviceCodeList(FcltsInfoVO vo) throws Exception {
		List<?> rs = deviceDAO.selectDeviceCodeList(vo);
		return rs;
	}

	@Override
	public int insertDevice(FcltsInfoVO paramVO) throws Exception {
		int rs = deviceDAO.insertDevice(paramVO);
		return rs;
	}

	@Override
	public int updateDevice(FcltsInfoVO paramVO) throws Exception {
		int rs = deviceDAO.updateDevice(paramVO);
		return rs;
	}

	@Override
	public int deleteDevice(FcltsInfoVO paramVO) throws Exception {
		int rs = deviceDAO.deleteDevice(paramVO);
		return rs;
	}

	@Override
	public List<?> selectIoList(SensorInfoVO searchVO) throws Exception {
		List<?> rs = deviceDAO.selectIoList(searchVO);
		return rs;
	}

	@Override
	public int insertIo(SensorInfoVO paramVO) throws Exception {
		int rs = deviceDAO.insertIo(paramVO);
		return rs;
	}

	@Override
	public int updateIo(SensorInfoVO paramVO) throws Exception {
		int rs = deviceDAO.updateIo(paramVO);
		return rs;
	}

	@Override
	public int deleteIo(SensorInfoVO paramVO) throws Exception {
		int rs = deviceDAO.deleteIo(paramVO);
		return rs;
	}

	@Override
	public int insertIoCode(FcltsInfoVO paramVO) throws Exception {
		int rs = deviceDAO.insertIoCode(paramVO);
		return rs;

	}

	@Override
	public int deleteIoCode(FcltsInfoVO paramVO) throws Exception {
		int rs = deviceDAO.deleteIoCode(paramVO);
		return rs;
	}

	@Override
	public List<?> checkDevice(FcltsInfoVO paramVO) throws Exception {
		List<?> rs = deviceDAO.checkDevice(paramVO);
		return rs;
	}

/*
	@Override
	public int insertAdtDevice(FcltsInfoVO paramVO) throws Exception {
		int rs = adtdeviceDAO.insertDevice(paramVO);
		return rs;
	}

	@Override
	public int updateAdtDevice(FcltsInfoVO paramVO) throws Exception {
		int rs = adtdeviceDAO.updateDevice(paramVO);
		return rs;
	}
	*/



}
