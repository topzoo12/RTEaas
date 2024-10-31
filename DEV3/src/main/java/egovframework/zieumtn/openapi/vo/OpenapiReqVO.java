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
public class OpenapiReqVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String reqNo;
	private String coId;
	private String coNm;
	private String reqCoNm;
	private String reqNm;
	private String emailAddr;

	private String useSite;
	private String openKey;
	private String openkey;
	private String openKeyDt;
	private String reqDtm;

	private String fromDt;
	private String toDt;
	private String openKeyYn;

	public String getReqNo() {
		return reqNo;
	}
	public void setReqNo(String reqNo) {
		this.reqNo = reqNo;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
	public String getReqCoNm() {
		return reqCoNm;
	}
	public void setReqCoNm(String reqCoNm) {
		this.reqCoNm = reqCoNm;
	}
	public String getReqNm() {
		return reqNm;
	}
	public void setReqNm(String reqNm) {
		this.reqNm = reqNm;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getUseSite() {
		return useSite;
	}
	public void setUseSite(String useSite) {
		this.useSite = useSite;
	}
	public String getOpenKey() {
		return openKey;
	}
	public void setOpenKey(String openKey) {
		this.openKey = openKey;
	}
	public String getOpenKeyDt() {
		return openKeyDt;
	}
	public void setOpenKeyDt(String openKeyDt) {
		this.openKeyDt = openKeyDt;
	}
	public String getReqDtm() {
		return reqDtm;
	}
	public void setReqDtm(String reqDtm) {
		this.reqDtm = reqDtm;
	}
	public String getFromDt() {
		return fromDt;
	}
	public void setFromDt(String fromDt) {
		this.fromDt = fromDt;
	}
	public String getToDt() {
		return toDt;
	}
	public void setToDt(String toDt) {
		this.toDt = toDt;
	}
	public String getOpenKeyYn() {
		return openKeyYn;
	}
	public void setOpenKeyYn(String openKeyYn) {
		this.openKeyYn = openKeyYn;
	}
	public String getOpenkey() {
		return openkey;
	}
	public void setOpenkey(String openkey) {
		this.openkey = openkey;
	}
}
