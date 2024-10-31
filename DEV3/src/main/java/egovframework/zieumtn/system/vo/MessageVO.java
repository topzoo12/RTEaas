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
public class MessageVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String msgId;
	private String taskdivCd;
	private String taskdivNm;
	private String msgdivCd;
	private String msgdivNm;
	private String msgCts;
	private String msgengCts;
	private String msgjpCts;
	private String useYn;
	private String regDtBegin;
	private String regDtEnd;

	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getTaskdivCd() {
		return taskdivCd;
	}
	public void setTaskdivCd(String taskdivCd) {
		this.taskdivCd = taskdivCd;
	}
	public String getMsgdivCd() {
		return msgdivCd;
	}
	public void setMsgdivCd(String msgdivCd) {
		this.msgdivCd = msgdivCd;
	}
	public String getMsgCts() {
		return msgCts;
	}
	public void setMsgCts(String msgCts) {
		this.msgCts = msgCts;
	}
	public String getMsgengCts() {
		return msgengCts;
	}
	public void setMsgengCts(String msgengCts) {
		this.msgengCts = msgengCts;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRegDtBegin() {
		return regDtBegin;
	}
	public void setRegDtBegin(String regDtBegin) {
		this.regDtBegin = regDtBegin;
	}
	public String getRegDtEnd() {
		return regDtEnd;
	}
	public void setRegDtEnd(String regDtEnd) {
		this.regDtEnd = regDtEnd;
	}
	public String getTaskdivNm() {
		return taskdivNm;
	}
	public void setTaskdivNm(String taskdivNm) {
		this.taskdivNm = taskdivNm;
	}
	public String getMsgdivNm() {
		return msgdivNm;
	}
	public void setMsgdivNm(String msgdivNm) {
		this.msgdivNm = msgdivNm;
	}
	public String getMsgjpCts() {
		return msgjpCts;
	}
	public void setMsgjpCts(String msgjpCts) {
		this.msgjpCts = msgjpCts;
	}
}
