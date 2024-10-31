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

import java.util.ArrayList;
import java.util.HashMap;

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
public class MainDataVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String deviceId;
	private String deviceNm;
	private String getDtm;
	private String deviceValue;
	private String rank;

	private String ioId;
	private String ioNm;

	private HashMap<String,Object> detailList;

	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getDeviceNm() {
		return deviceNm;
	}
	public void setDeviceNm(String deviceNm) {
		this.deviceNm = deviceNm;
	}
	public String getGetDtm() {
		return getDtm;
	}
	public void setGetDtm(String getDtm) {
		this.getDtm = getDtm;
	}
	public String getDeviceValue() {
		return deviceValue;
	}
	public void setDeviceValue(String deviceValue) {
		this.deviceValue = deviceValue;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getIoId() {
		return ioId;
	}
	public void setIoId(String ioId) {
		this.ioId = ioId;
	}
	public String getIoNm() {
		return ioNm;
	}
	public void setIoNm(String ioNm) {
		this.ioNm = ioNm;
	}
	public HashMap<String,Object> getDetailList() {
		return new HashMap<String,Object>(detailList);
		//return detailList;
	}
	public void setDetailList(HashMap<String,Object> detailList) {
		this.detailList = new HashMap<String,Object>(detailList);
		//this.detailList = detailList;
	}

}
