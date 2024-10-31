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
package egovframework.zieumtn.common.service;

import java.util.List;

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
public class DeviceDataVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String ioId;
	private String coId;
	private String sensorId;
	private String readValue;
	private String readDtm;
	private String fcltsId;

	public String getIoId() {
		return ioId;
	}
	public void setIoId(String ioId) {
		this.ioId = ioId;
	}
	public String getReadValue() {
		return readValue;
	}
	public void setReadValue(String readValue) {
		this.readValue = readValue;
	}
	public String getReadDtm() {
		return readDtm;
	}
	public void setReadDtm(String readDtm) {
		this.readDtm = readDtm;
	}
	public String getFcltsId() {
		return fcltsId;
	}
	public void setFcltsId(String fcltsId) {
		this.fcltsId = fcltsId;
	}
	public String getSensorId() {
		return sensorId;
	}
	public void setSensorId(String sensorId) {
		this.sensorId = sensorId;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}

}
