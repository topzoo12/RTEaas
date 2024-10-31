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
public class MonitorVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String fcltsUuid;		//시설물 고유 아이디 - 측정장치 ID(기기 고유번호)
	private String fcltsNm;			//시설물 이름 - 측정소명
	private String fcltsItlpcNm;	//시설물 설치장소 이름
	private String fcltsItlpcNmDs;	//시설물 설치장소 이름
	private String fcltsItlpcAddr;	//시설물 설치장소 주소
	private Double fcltsItlpcLa;	//시설물 설치장소 위도
	private Double fcltsItlpcLo;	//시설물 설치장소 경도
	private String tlphonNo;		//측정장치 전화번호
	private String deviceStatus;		//
	private String deviceStatusDs;		//

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
	public String getFcltsItlpcNm() {
		return fcltsItlpcNm;
	}
	public void setFcltsItlpcNm(String fcltsItlpcNm) {
		this.fcltsItlpcNm = fcltsItlpcNm;
	}
	public String getFcltsItlpcAddr() {
		return fcltsItlpcAddr;
	}
	public void setFcltsItlpcAddr(String fcltsItlpcAddr) {
		this.fcltsItlpcAddr = fcltsItlpcAddr;
	}
	public Double getFcltsItlpcLa() {
		return fcltsItlpcLa;
	}
	public void setFcltsItlpcLa(Double fcltsItlpcLa) {
		this.fcltsItlpcLa = fcltsItlpcLa;
	}
	public Double getFcltsItlpcLo() {
		return fcltsItlpcLo;
	}
	public void setFcltsItlpcLo(Double fcltsItlpcLo) {
		this.fcltsItlpcLo = fcltsItlpcLo;
	}
	public String getTlphonNo() {
		return tlphonNo;
	}
	public void setTlphonNo(String tlphonNo) {
		this.tlphonNo = tlphonNo;
	}
	public String getFcltsItlpcNmDs() {
		return fcltsItlpcNmDs;
	}
	public void setFcltsItlpcNmDs(String fcltsItlpcNmDs) {
		this.fcltsItlpcNmDs = fcltsItlpcNmDs;
	}
	public String getDeviceStatus() {
		return deviceStatus;
	}
	public void setDeviceStatus(String deviceStatus) {
		this.deviceStatus = deviceStatus;
	}
	public String getDeviceStatusDs() {
		return deviceStatusDs;
	}
	public void setDeviceStatusDs(String deviceStatusDs) {
		this.deviceStatusDs = deviceStatusDs;
	}

}
