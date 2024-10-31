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
public class UsageDataVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String fcltsUuid;
	private String fcltsNm;
	private String fcltsItlpcNmDs;
	private String fcltsItlpcAddr;
	private String fcltsItlpcLa;
	private String fcltsItlpcLo;
	private String usageCnt;

	public String getFcltsUuid() {
		return fcltsUuid;
	}
	public void setFcltsUuid(String fcltsUuid) {
		this.fcltsUuid = fcltsUuid;
	}
	public String getFcltsNm() {
		return fcltsNm;
	}
	public void setFcltsNm(String fcltsNm) {
		this.fcltsNm = fcltsNm;
	}
	public String getFcltsItlpcAddr() {
		return fcltsItlpcAddr;
	}
	public void setFcltsItlpcAddr(String fcltsItlpcAddr) {
		this.fcltsItlpcAddr = fcltsItlpcAddr;
	}
	public String getFcltsItlpcLa() {
		return fcltsItlpcLa;
	}
	public void setFcltsItlpcLa(String fcltsItlpcLa) {
		this.fcltsItlpcLa = fcltsItlpcLa;
	}
	public String getFcltsItlpcLo() {
		return fcltsItlpcLo;
	}
	public void setFcltsItlpcLo(String fcltsItlpcLo) {
		this.fcltsItlpcLo = fcltsItlpcLo;
	}
	public String getUsageCnt() {
		return usageCnt;
	}
	public void setUsageCnt(String usageCnt) {
		this.usageCnt = usageCnt;
	}
	public String getFcltsItlpcNmDs() {
		return fcltsItlpcNmDs;
	}
	public void setFcltsItlpcNmDs(String fcltsItlpcNmDs) {
		this.fcltsItlpcNmDs = fcltsItlpcNmDs;
	}

}
