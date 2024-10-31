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
package egovframework.zieumtn.system.vo;

import egovframework.zieumtn.common.service.CommonDefaultVO;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class DistrictVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String districtId;
	private String districtNm1;
	private String districtNm2;
	private String districtNm3;
	private String districtX;
	private String districtY;

	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public String getDistrictNm1() {
		return districtNm1;
	}
	public void setDistrictNm1(String districtNm1) {
		this.districtNm1 = districtNm1;
	}
	public String getDistrictNm2() {
		return districtNm2;
	}
	public void setDistrictNm2(String districtNm2) {
		this.districtNm2 = districtNm2;
	}
	public String getDistrictNm3() {
		return districtNm3;
	}
	public void setDistrictNm3(String districtNm3) {
		this.districtNm3 = districtNm3;
	}
	public String getDistrictX() {
		return districtX;
	}
	public void setDistrictX(String districtX) {
		this.districtX = districtX;
	}
	public String getDistrictY() {
		return districtY;
	}
	public void setDistrictY(String districtY) {
		this.districtY = districtY;
	}

}
