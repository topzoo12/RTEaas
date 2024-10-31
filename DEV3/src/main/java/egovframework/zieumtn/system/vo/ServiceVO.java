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
public class ServiceVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String coNm;
	private String corpNo;
	private String estbDt;
	private String hpgAddr;
	private String roadzpNo;
	private String roadnmAddr;
	private String roadnmdtlAddr;
	private String emailAddr;
	private String rdrtrNm;
	private String bztpNm;
	private String bzcatNm;
	private String aprvYn;
	private String telNo;
	private String useYn;
	private String coDiv;
	private String rmksCts;

	private String wtX;
	private String wtY;
	private String mapX;
	private String mapY;
	private String wtNm;
	private String confirmYn;

	private String reqServiceList;

	private String hpNo;
	private String cdNa;
	private String nmNa;

	private String mapMinSize;
	private String mapMaxSize;

	private String areaCodeLv1;
	private String areaCodeLv2;



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
	public String getNmNa() {
		return nmNa;
	}
	public void setNmNa(String nmNa) {
		this.nmNa = nmNa;
	}
	public String getCdNa() {
		return cdNa;
	}
	public void setCdNa(String cdNa) {
		this.cdNa = cdNa;
	}

	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
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
	public String getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(String corpNo) {
		this.corpNo = corpNo;
	}
	public String getEstbDt() {
		return estbDt;
	}
	public void setEstbDt(String estbDt) {
		this.estbDt = estbDt;
	}
	public String getHpgAddr() {
		return hpgAddr;
	}
	public void setHpgAddr(String hpgAddr) {
		this.hpgAddr = hpgAddr;
	}
	public String getRoadzpNo() {
		return roadzpNo;
	}
	public void setRoadzpNo(String roadzpNo) {
		this.roadzpNo = roadzpNo;
	}
	public String getRoadnmAddr() {
		return roadnmAddr;
	}
	public void setRoadnmAddr(String roadnmAddr) {
		this.roadnmAddr = roadnmAddr;
	}
	public String getRoadnmdtlAddr() {
		return roadnmdtlAddr;
	}
	public void setRoadnmdtlAddr(String roadnmdtlAddr) {
		this.roadnmdtlAddr = roadnmdtlAddr;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getRdrtrNm() {
		return rdrtrNm;
	}
	public void setRdrtrNm(String rdrtrNm) {
		this.rdrtrNm = rdrtrNm;
	}
	public String getBztpNm() {
		return bztpNm;
	}
	public void setBztpNm(String bztpNm) {
		this.bztpNm = bztpNm;
	}
	public String getBzcatNm() {
		return bzcatNm;
	}
	public void setBzcatNm(String bzcatNm) {
		this.bzcatNm = bzcatNm;
	}
	public String getAprvYn() {
		return aprvYn;
	}
	public void setAprvYn(String aprvYn) {
		this.aprvYn = aprvYn;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCoDiv() {
		return coDiv;
	}
	public void setCoDiv(String coDiv) {
		this.coDiv = coDiv;
	}
	public String getRmksCts() {
		return rmksCts;
	}
	public void setRmksCts(String rmksCts) {
		this.rmksCts = rmksCts;
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
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getReqServiceList() {
		return reqServiceList;
	}
	public void setReqServiceList(String reqServiceList) {
		this.reqServiceList = reqServiceList;
	}

}
