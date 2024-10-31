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
import java.util.Arrays;
import java.util.List;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2009.03.16 최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by MOPAS All right reserved.
 */
public class AuthVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String coNm;
	private String usrId;
	private String usrNm;
	private String deptNm;
	private String cotelNo;
	private String authgrpId;

	private String wtX;
	private String wtY;
	private String wtNm;
	private String mapX;
	private String mapY;

	private List<?> menuList;
	private List<?> favList;

	private String apiKey;

	private String restApiUrl;
	private String restApiDistance;

	private String cdNa;
	private String changedCdNa;

	private String mapMinSize;
	private String mapMaxSize;

	private String areaCodeLv1;
	private String areaCodeLv2;


	public AuthVO(String coId, String coNm, String usrId, String usrNm, String deptNm, String cotelNo, String authgrpId,
			String wtX, String wtY, String wtNm, String mapX, String mapY, List<?> menuList, List<?> favList,
			String restApiUrl, String restApiDistance, String cdNa, String changedCdNa, String mapMinSize, String mapMaxSize, String areaCodeLv1, String areaCodeLv2) {
		this.coId = coId;
		this.coNm = coNm;
		this.usrId = usrId;
		this.usrNm = usrNm;
		this.deptNm = deptNm;
		this.cotelNo = cotelNo;
		this.authgrpId = authgrpId;
		this.wtX = wtX;
		this.wtY = wtY;
		this.wtNm = wtNm;
		this.mapX = mapX;
		this.mapY = mapY;
		this.menuList = menuList;
		this.favList = favList;
		this.restApiUrl = restApiUrl;
		this.restApiDistance = restApiDistance;
		this.cdNa = cdNa;
		this.changedCdNa = changedCdNa;
		this.mapMinSize = mapMinSize;
		this.mapMaxSize = mapMaxSize;
		this.areaCodeLv1 = areaCodeLv1;
		this.areaCodeLv2 = areaCodeLv2;
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

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
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

	public String getAuthgrpId() {
		return authgrpId;
	}

	public void setAuthgrpId(String authgrpId) {
		this.authgrpId = authgrpId;
	}

	public String getCoNm() {
		return coNm;
	}

	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getCotelNo() {
		return cotelNo;
	}

	public void setCotelNo(String cotelNo) {
		this.cotelNo = cotelNo;
	}

	public List<?> getMenuList() {
		return new ArrayList<>(menuList);
	}

	public void setMenuList(List<?> menuList) {
		this.menuList = new ArrayList<>(menuList);
		// this.menuList = menuList;
	}

	public List<?> getFavList() {
		return new ArrayList<>(favList);
		// return favList;
	}

	public void setFavList(List<?> favList) {
		this.favList = new ArrayList<>(favList);
		// this.favList = favList;
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

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getChangedCdNa() {
		return changedCdNa;
	}

	public void setChangedCdNa(String changedCdNa) {
		this.changedCdNa = changedCdNa;
	}

}
