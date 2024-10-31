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
package egovframework.zieumtn.device.vo;

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
public class FcltsMngVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String checkNo;		//
	private String fcltsUuid;		//
	private String checkNm;		//
	private String checkDt;		//
	private String checkDiv;		//
	private String checkDivNm;		//
	private String checkCts;		//

	private String fcltsItlpcNm;
	private String fcltsNm;
	private String stat;

	public String getCheckNo() {
		return checkNo;
	}
	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}
	public String getFcltsUuid() {
		return fcltsUuid;
	}
	public void setFcltsUuid(String fcltsUuid) {
		this.fcltsUuid = fcltsUuid;
	}
	public String getCheckNm() {
		return checkNm;
	}
	public void setCheckNm(String checkNm) {
		this.checkNm = checkNm;
	}
	public String getCheckDt() {
		return checkDt;
	}
	public void setCheckDt(String checkDt) {
		this.checkDt = checkDt;
	}
	public String getCheckDiv() {
		return checkDiv;
	}
	public void setCheckDiv(String checkDiv) {
		this.checkDiv = checkDiv;
	}
	public String getCheckCts() {
		return checkCts;
	}
	public void setCheckCts(String checkCts) {
		this.checkCts = checkCts;
	}
	public String getFcltsItlpcNm() {
		return fcltsItlpcNm;
	}
	public void setFcltsItlpcNm(String fcltsItlpcNm) {
		this.fcltsItlpcNm = fcltsItlpcNm;
	}
	public String getFcltsNm() {
		return fcltsNm;
	}
	public void setFcltsNm(String fcltsNm) {
		this.fcltsNm = fcltsNm;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getCheckDivNm() {
		return checkDivNm;
	}
	public void setCheckDivNm(String checkDivNm) {
		this.checkDivNm = checkDivNm;
	}

}
