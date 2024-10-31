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
package egovframework.zieumtn.openapi.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
public class OpenapiVO {

	private static final long serialVersionUID = 1L;

	private String rowno;
	private String coNm;
	private String deviceId;
	private String deviceIo;
	private String deviceValue;
	private String getDtm;
	public String getRowno() {
		return rowno;
	}
	public void setRowno(String rowno) {
		this.rowno = rowno;
	}
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getDeviceIo() {
		return deviceIo;
	}
	public void setDeviceIo(String deviceIo) {
		this.deviceIo = deviceIo;
	}
	public String getDeviceValue() {
		return deviceValue;
	}
	public void setDeviceValue(String deviceValue) {
		this.deviceValue = deviceValue;
	}
	public String getGetDtm() {
		return getDtm;
	}
	public void setGetDtm(String getDtm) {
		this.getDtm = getDtm;
	}

}
