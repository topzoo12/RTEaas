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
public class OwnerVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String mnuId;
	private String mnuNm;
	private String mnuDesc;
	private String ownCoId;
	private String ownCoNm;
	private String openYn;

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
	public String getMnuDesc() {
		return mnuDesc;
	}
	public void setMnuDesc(String mnuDesc) {
		this.mnuDesc = mnuDesc;
	}
	public String getOwnCoNm() {
		return ownCoNm;
	}
	public void setOwnCoNm(String ownCoNm) {
		this.ownCoNm = ownCoNm;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public String getOwnCoId() {
		return ownCoId;
	}
	public void setOwnCoId(String ownCoId) {
		this.ownCoId = ownCoId;
	}


}
