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
package egovframework.zieumtn.common.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.system.vo.MenuVO;

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
public interface CommonService {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertSample(CommonVO vo) throws Exception;

	List<?> selectCommonList(CommonVO commonVo) throws Exception;

	List<?> selectBestDataMaster(MainDataVO vo) throws Exception;
	List<?> selectWorstDataMaster(MainDataVO vo) throws Exception;
	List<?> selectMainDataDetail(MainDataVO vo) throws Exception;

	int insertFav(MenuVO paramVO) throws Exception;

	int deleteFav(MenuVO paramVO) throws Exception;

	int insertMenuConHist(MenuVO paramVO) throws Exception;

	int insertLoginHist(AuthVO paramVO) throws Exception;

	int insertDeviceData(List<DeviceDataVO> dataVO) throws Exception;

	List<?> getMenuByUrl(MenuVO logVO) throws Exception;

	List<?> selectCoList() throws Exception;

	List<?> getMsg(String msgId) throws Exception;

	int insertApikey(AuthVO authVO);

	int deleteApiKey(LoginVO loginVO);

}
