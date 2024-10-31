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
public class CodeVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String cdgrpId;
	private String cdgrpNm;
	private String taskDiv;
	private String taskDivNm;
	private String cdgrpDesc;
	private String useYn;
	private String rmksCts;

	private String comCd;
	private String cdId;
	private String cdNm;
	private String cdDesc;
	private Long srtSeq;
	private String hrnkcomCd;
	private String etc1;
	private String etc2;
	private String etc3;

	private String cdNmEng;
	private String cdNmJp;

	public String getCdNmEng() {
		return cdNmEng;
	}
	public void setCdNmEng(String cdNmEng) {
		this.cdNmEng = cdNmEng;
	}
	public String getCdNmJp() {
		return cdNmJp;
	}
	public void setCdNmJp(String cdNmJp) {
		this.cdNmJp = cdNmJp;
	}

	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getCdgrpId() {
		return cdgrpId;
	}
	public void setCdgrpId(String cdgrpId) {
		this.cdgrpId = cdgrpId;
	}
	public String getCdgrpNm() {
		return cdgrpNm;
	}
	public void setCdgrpNm(String cdgrpNm) {
		this.cdgrpNm = cdgrpNm;
	}
	public String getTaskDiv() {
		return taskDiv;
	}
	public void setTaskDiv(String taskDiv) {
		this.taskDiv = taskDiv;
	}
	public String getCdgrpDesc() {
		return cdgrpDesc;
	}
	public void setCdgrpDesc(String cdgrpDesc) {
		this.cdgrpDesc = cdgrpDesc;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRmksCts() {
		return rmksCts;
	}
	public void setRmksCts(String rmksCts) {
		this.rmksCts = rmksCts;
	}
	public String getComCd() {
		return comCd;
	}
	public void setComCd(String comCd) {
		this.comCd = comCd;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getCdDesc() {
		return cdDesc;
	}
	public void setCdDesc(String cdDesc) {
		this.cdDesc = cdDesc;
	}
	public Long getSrtSeq() {
		return srtSeq;
	}
	public void setSrtSeq(Long srtSeq) {
		this.srtSeq = srtSeq;
	}
	public String getHrnkcomCd() {
		return hrnkcomCd;
	}
	public void setHrnkcomCd(String hrnkcomCd) {
		this.hrnkcomCd = hrnkcomCd;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getEtc3() {
		return etc3;
	}
	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}
	public String getTaskDivNm() {
		return taskDivNm;
	}
	public void setTaskDivNm(String taskDivNm) {
		this.taskDivNm = taskDivNm;
	}

}
