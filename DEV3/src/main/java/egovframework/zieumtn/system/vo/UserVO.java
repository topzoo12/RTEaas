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
public class UserVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String usrId;
	private String usrNm;
	private String sectNo;

	private String sectNoOrg;

	private String authgrpId;
	private String authgrpNm;
	private String cotelNo;
	private String mpNo;
	private String emailAddr;
	private String deptCd;
	private String deptNm;
	private String useYn;
	private String rmksCts;
	private String statConfirm;
	private String adminYn;
	private String useDt;
	private String endDt;

	private String rowno;

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
	public String getSectNo() {
		return sectNo;
	}
	public void setSectNo(String sectNo) {
		this.sectNo = sectNo;
	}
	public String getCotelNo() {
		return cotelNo;
	}
	public void setCotelNo(String cotelNo) {
		this.cotelNo = cotelNo;
	}
	public String getMpNo() {
		return mpNo;
	}
	public void setMpNo(String mpNo) {
		this.mpNo = mpNo;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
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
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getStatConfirm() {
		return statConfirm;
	}
	public void setStatConfirm(String statConfirm) {
		this.statConfirm = statConfirm;
	}
	public String getAuthgrpId() {
		return authgrpId;
	}
	public void setAuthgrpId(String authgrpId) {
		this.authgrpId = authgrpId;
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
	public String getAuthgrpNm() {
		return authgrpNm;
	}
	public void setAuthgrpNm(String authgrpNm) {
		this.authgrpNm = authgrpNm;
	}
	public String getAdminYn() {
		return adminYn;
	}
	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}
	public String getSectNoOrg() {
		return sectNoOrg;
	}
	public void setSectNoOrg(String sectNoOrg) {
		this.sectNoOrg = sectNoOrg;
	}

	public String getRowno() {
		return rowno;
	}

	public void setRowno(String rowno) {
		this.rowno = rowno;
	}


}
