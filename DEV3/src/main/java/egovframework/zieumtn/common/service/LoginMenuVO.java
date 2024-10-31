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
public class LoginMenuVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String mnuId;
	private String rauthYn;
	private String sauthYn;
	private String pauthYn;
	private String rmksCts;
	private String mnuNm;
	private String hrnkmnuId;
	private String mnuLvl;

	private String srnUrl;

	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getMnuId() {
		return mnuId;
	}
	public void setMnuId(String mnuId) {
		this.mnuId = mnuId;
	}
	public String getRauthYn() {
		return rauthYn;
	}
	public void setRauthYn(String rauthYn) {
		this.rauthYn = rauthYn;
	}
	public String getSauthYn() {
		return sauthYn;
	}
	public void setSauthYn(String sauthYn) {
		this.sauthYn = sauthYn;
	}
	public String getPauthYn() {
		return pauthYn;
	}
	public void setPauthYn(String pauthYn) {
		this.pauthYn = pauthYn;
	}
	public String getRmksCts() {
		return rmksCts;
	}
	public void setRmksCts(String rmksCts) {
		this.rmksCts = rmksCts;
	}
	public String getMnuNm() {
		return mnuNm;
	}
	public void setMnuNm(String mnuNm) {
		this.mnuNm = mnuNm;
	}
	public String getMnuLvl() {
		return mnuLvl;
	}
	public void setMnuLvl(String mnuLvl) {
		this.mnuLvl = mnuLvl;
	}
	public String getSrnUrl() {
		return srnUrl;
	}
	public void setSrnUrl(String srnUrl) {
		this.srnUrl = srnUrl;
	}
	public String getHrnkmnuId() {
		return hrnkmnuId;
	}
	public void setHrnkmnuId(String hrnkmnuId) {
		this.hrnkmnuId = hrnkmnuId;
	}


}
