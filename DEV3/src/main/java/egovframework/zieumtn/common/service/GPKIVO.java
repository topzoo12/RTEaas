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
public class GPKIVO extends CommonDefaultVO {

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

	private String challenge;
	private String param01;
	private String param02;
	private String param03;

	private String sessionid;
	private String ssn;
	private String message_type;

	private String sn;
	private String subDN;
	private String signType;


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
	public String getChallenge() {
		return challenge;
	}
	public void setChallenge(String challenge) {
		this.challenge = challenge;
	}
	public String getParam01() {
		return param01;
	}
	public void setParam01(String param01) {
		this.param01 = param01;
	}
	public String getParam02() {
		return param02;
	}
	public void setParam02(String param02) {
		this.param02 = param02;
	}
	public String getParam03() {
		return param03;
	}
	public void setParam03(String param03) {
		this.param03 = param03;
	}
	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getSubDN() {
		return subDN;
	}
	public void setSubDN(String subDN) {
		this.subDN = subDN;
	}
	public String getSignType() {
		return signType;
	}
	public void setSignType(String signType) {
		this.signType = signType;
	}

}
