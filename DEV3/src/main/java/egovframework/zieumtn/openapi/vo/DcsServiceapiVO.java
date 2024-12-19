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
public class DcsServiceapiVO {

	private static final long serialVersionUID = 1L;

	private String path;
	private String fname;
	private String imgNames;
	private String url;
	private String deviceId;
	private Integer frmCnt;
	private Integer imgCnt;

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public Integer getFrmCnt() {
		return frmCnt;
	}
	public void setFrmCnt(Integer frmCnt) {
		this.frmCnt = frmCnt;
	}
	public Integer getImgCnt() {
		return imgCnt;
	}
	public void setImgCnt(Integer imgCnt) {
		this.imgCnt = imgCnt;
	}
	public String getImgNames() {
		return imgNames;
	}
	public void setImgNames(String imgNames) {
		this.imgNames = imgNames;
	}

}
