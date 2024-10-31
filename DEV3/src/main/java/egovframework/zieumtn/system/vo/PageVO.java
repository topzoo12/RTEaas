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
public class PageVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String srnId;
	private String srnNm;
	private String srnUrl;
	private String srntpCd;
	private String opntpCd;
	private String authgrpCd;
	private String rmksCts;
	private String useYn;
	private String mpYn;

	public String getSrnId() {
		return srnId;
	}
	public void setSrnId(String srnId) {
		this.srnId = srnId;
	}
	public String getSrnNm() {
		return srnNm;
	}
	public void setSrnNm(String srnNm) {
		this.srnNm = srnNm;
	}
	public String getSrnUrl() {
		return srnUrl;
	}
	public void setSrnUrl(String srnUrl) {
		this.srnUrl = srnUrl;
	}
	public String getSrntpCd() {
		return srntpCd;
	}
	public void setSrntpCd(String srntpCd) {
		this.srntpCd = srntpCd;
	}
	public String getOpntpCd() {
		return opntpCd;
	}
	public void setOpntpCd(String opntpCd) {
		this.opntpCd = opntpCd;
	}
	public String getAuthgrpCd() {
		return authgrpCd;
	}
	public void setAuthgrpCd(String authgrpCd) {
		this.authgrpCd = authgrpCd;
	}
	public String getRmksCts() {
		return rmksCts;
	}
	public void setRmksCts(String rmksCts) {
		this.rmksCts = rmksCts;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getMpYn() {
		return mpYn;
	}
	public void setMpYn(String mpYn) {
		this.mpYn = mpYn;
	}

}
