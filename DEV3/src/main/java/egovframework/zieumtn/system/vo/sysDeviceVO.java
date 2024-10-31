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

import java.util.ArrayList;
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
public class sysDeviceVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String coNm;
	private String deviceId;
	private String deviceNm;
	private String deviceDiv;
	private String fwInfo;
	private String deviceSpec;
	private String deviceRmks;
	private String useYn;
	private String regpsnId;
	private String regDtm;
	private String updId;
	private String updDtm;
	private String confirmYn;
	private String userId;
	private String macAddr;


	public String getMacAddr() {
		return macAddr;
	}
	public void setMacAddr(String macAddr) {
		this.macAddr = macAddr;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
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
	public String getDeviceDiv() {
		return deviceDiv;
	}
	public void setDeviceDiv(String deviceDiv) {
		this.deviceDiv = deviceDiv;
	}
	public String getFwInfo() {
		return fwInfo;
	}
	public void setFwInfo(String fwInfo) {
		this.fwInfo = fwInfo;
	}
	public String getDeviceSpec() {
		return deviceSpec;
	}
	public void setDeviceSpec(String deviceSpec) {
		this.deviceSpec = deviceSpec;
	}
	public String getDeviceRmks() {
		return deviceRmks;
	}
	public void setDeviceRmks(String deviceRmks) {
		this.deviceRmks = deviceRmks;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRegpsnId() {
		return regpsnId;
	}
	public void setRegpsnId(String regpsnId) {
		this.regpsnId = regpsnId;
	}
	public String getRegDtm() {
		return regDtm;
	}
	public void setRegDtm(String regDtm) {
		this.regDtm = regDtm;
	}
	public String getUpdId() {
		return updId;
	}
	public void setUpdId(String updId) {
		this.updId = updId;
	}
	public String getUpdDtm() {
		return updDtm;
	}
	public void setUpdDtm(String updDtm) {
		this.updDtm = updDtm;
	}

}
