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
public class LoginVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String coNm;
	private String usrId;
	private String usrNm;
	private String usrPw;
	private String deptNm;
	private String cotelNo;
	private String authgrpId;
	private String wtX;
	private String wtY;
	private String wtNm;
	private String mapX;
	private String mapY;

	private String restApiUrl;
	private String restApiDistance;


	private String statConfirm;
	private String adminYn;
	private String useDt;
	private String endDt;

	private String cdNa;
	private String changedCdNa;
	private String sessionCdNa;

	private String mapMinSize;
	private String mapMaxSize;

	private String areaCodeLv1;
	private String areaCodeLv2;
	private String useYn;



	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getAreaCodeLv1() {
		return areaCodeLv1;
	}
	public void setAreaCodeLv1(String areaCodeLv1) {
		this.areaCodeLv1 = areaCodeLv1;
	}
	public String getAreaCodeLv2() {
		return areaCodeLv2;
	}
	public void setAreaCodeLv2(String areaCodeLv2) {
		this.areaCodeLv2 = areaCodeLv2;
	}
	public String getMapMinSize() {
		return mapMinSize;
	}
	public void setMapMinSize(String mapMinSize) {
		this.mapMinSize = mapMinSize;
	}
	public String getMapMaxSize() {
		return mapMaxSize;
	}
	public void setMapMaxSize(String mapMaxSize) {
		this.mapMaxSize = mapMaxSize;
	}
	public String getCdNa() {
		return cdNa;
	}
	public void setCdNa(String cdNa) {
		this.cdNa = cdNa;
	}

	public String getRestApiDistance() {
		return restApiDistance;
	}
	public void setRestApiDistance(String restApiDistance) {
		this.restApiDistance = restApiDistance;
	}

	public String getRestApiUrl() {
		return restApiUrl;
	}
	public void setRestApiUrl(String restApiUrl) {
		this.restApiUrl = restApiUrl;
	}

	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getAuthgrpId() {
		return authgrpId;
	}
	public void setAuthgrpId(String authgrpId) {
		this.authgrpId = authgrpId;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getUsrPw() {
		return usrPw;
	}
	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
	public String getCotelNo() {
		return cotelNo;
	}
	public void setCotelNo(String cotelNo) {
		this.cotelNo = cotelNo;
	}
	public String getWtX() {
		return wtX;
	}
	public void setWtX(String wtX) {
		this.wtX = wtX;
	}
	public String getWtY() {
		return wtY;
	}
	public void setWtY(String wtY) {
		this.wtY = wtY;
	}
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	public String getWtNm() {
		return wtNm;
	}
	public void setWtNm(String wtNm) {
		this.wtNm = wtNm;
	}


	public String getStatConfirm() {
		return statConfirm;
	}
	public void setStatConfirm(String statConfirm) {
		this.statConfirm = statConfirm;
	}

	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}

	public String getUseDt() {
		return useDt;
	}
	public void setUseDt(String useDt) {
		this.useDt = useDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getChangedCdNa() {
		return changedCdNa;
	}
	public void setChangedCdNa(String changedCdNa) {
		this.changedCdNa = changedCdNa;
	}
	public String getSessionCdNa() {
		return sessionCdNa;
	}
	public void setSessionCdNa(String sessionCdNa) {
		this.sessionCdNa = sessionCdNa;
	}

}
