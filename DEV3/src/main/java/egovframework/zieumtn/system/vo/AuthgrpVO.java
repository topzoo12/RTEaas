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
public class AuthgrpVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String coId;
	private String coNm;
	private String authgrpId;
	private String authgrpNm;
	private String authgrpCd;
	private String useYn;
	private String rmksCts;

	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getAuthgrpId() {
		return authgrpId;
	}
	public void setAuthgrpId(String authgrpId) {
		this.authgrpId = authgrpId;
	}
	public String getAuthgrpNm() {
		return authgrpNm;
	}
	public void setAuthgrpNm(String authgrpNm) {
		this.authgrpNm = authgrpNm;
	}
	public String getAuthgrpCd() {
		return authgrpCd;
	}
	public void setAuthgrpCd(String authgrpCd) {
		this.authgrpCd = authgrpCd;
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
	public String getCoNm() {
		return coNm;
	}
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}
}
