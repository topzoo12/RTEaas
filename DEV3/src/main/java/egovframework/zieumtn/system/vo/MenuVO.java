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
public class MenuVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String mnuTree;
	private String coId;
	private String coNm;
	private String mnuId;
	private String mnuNm;
	private String mnuNmUs;
	private String mnuNmJp;
	private String mnuCdNa;

	private String mnuLvl;
	private String hrnkmnuId;
	private String srtSeq;
	private String srnId;
	private String argVal;
	private String markYn;

	private String srnNm;
	private String srnUrl;

	private String useYn;
	private String mnuDesc;
	private String mpYn;

	private String usageCnt;

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
	public String getHrnkmnuId() {
		return hrnkmnuId;
	}
	public void setHrnkmnuId(String hrnkmnuId) {
		this.hrnkmnuId = hrnkmnuId;
	}
	public String getSrtSeq() {
		return srtSeq;
	}
	public void setSrtSeq(String srtSeq) {
		this.srtSeq = srtSeq;
	}
	public String getSrnId() {
		return srnId;
	}
	public void setSrnId(String srnId) {
		this.srnId = srnId;
	}
	public String getArgVal() {
		return argVal;
	}
	public void setArgVal(String argVal) {
		this.argVal = argVal;
	}
	public String getMarkYn() {
		return markYn;
	}
	public void setMarkYn(String markYn) {
		this.markYn = markYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getMnuDesc() {
		return mnuDesc;
	}
	public void setMnuDesc(String mnuDesc) {
		this.mnuDesc = mnuDesc;
	}
	public String getMpYn() {
		return mpYn;
	}
	public void setMpYn(String mpYn) {
		this.mpYn = mpYn;
	}
	public String getMnuTree() {
		return mnuTree;
	}
	public void setMnuTree(String mnuTree) {
		this.mnuTree = mnuTree;
	}
	public String getSrnUrl() {
		return srnUrl;
	}
	public void setSrnUrl(String srnUrl) {
		this.srnUrl = srnUrl;
	}
	public String getSrnNm() {
		return srnNm;
	}
	public void setSrnNm(String srnNm) {
		this.srnNm = srnNm;
	}
	public String getUsageCnt() {
		return usageCnt;
	}
	public void setUsageCnt(String usageCnt) {
		this.usageCnt = usageCnt;
	}
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
	public String getMnuNmJp() {
		return mnuNmJp;
	}
	public void setMnuNmJp(String mnuNmJp) {
		this.mnuNmJp = mnuNmJp;
	}
	public String getMnuNmUs() {
		return mnuNmUs;
	}
	public void setMnuNmUs(String mnuNmUs) {
		this.mnuNmUs = mnuNmUs;
	}
	public String getMnuCdNa() {
		return mnuCdNa;
	}
	public void setMnuCdNa(String mnuCdNa) {
		this.mnuCdNa = mnuCdNa;
	}

}
