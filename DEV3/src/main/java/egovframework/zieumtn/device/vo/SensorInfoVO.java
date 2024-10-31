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
public class SensorInfoVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;
	private String ioId;		//입출력 아이디		- IO ID(통신규약/공통코드)
	private String ioIdDs;		//
	private String fcltsUuid;   //시설물 고유 아이디   - 측정장치 ID(기기 고유번호)
	private String ioNm;        //입출력 이름       -  IO명칭(공통코드)
	private String ioType;      //입출력 타입       -  고정값 = '02'
	private String ioAttr;      //입출력 속성       -  고정값 = 'R'
	private String ioValueType; //입출력 값 타입     -  고정값 = '04'
	private String ioValueUnit; //입출력 값 단위     -  센서단위(공통코드)
	private String textLength;  //텍스트 길이       -
	private String conncId;     //연결정보 아이디     -
	private String adptrId;     //수집 어댑터 아이디   - 고정값 = 'ADT_001'
	private String ioDscr;      //입출력 설명       -
	private String startChar;   //시작 문자         - 고정값 = '$'
	private String lastChar;    //마지막 문자       -  고정값 = '#'
	private String delimChar;   //구분 문자         - 고정값 = '|'
	private Integer parsedIdx;   //파싱 인덱스       -  센서값 순서(공통코드)

	public String getIoId() {
		return ioId;
	}
	public void setIoId(String ioId) {
		this.ioId = ioId;
	}
	public String getFcltsUuid() {
		return fcltsUuid;
	}
	public void setFcltsUuid(String fcltsUuid) {
		this.fcltsUuid = fcltsUuid;
	}
	public String getIoNm() {
		return ioNm;
	}
	public void setIoNm(String ioNm) {
		this.ioNm = ioNm;
	}
	public String getIoType() {
		return ioType;
	}
	public void setIoType(String ioType) {
		this.ioType = ioType;
	}
	public String getIoAttr() {
		return ioAttr;
	}
	public void setIoAttr(String ioAttr) {
		this.ioAttr = ioAttr;
	}
	public String getIoValueType() {
		return ioValueType;
	}
	public void setIoValueType(String ioValueType) {
		this.ioValueType = ioValueType;
	}
	public String getIoValueUnit() {
		return ioValueUnit;
	}
	public void setIoValueUnit(String ioValueUnit) {
		this.ioValueUnit = ioValueUnit;
	}
	public String getTextLength() {
		return textLength;
	}
	public void setTextLength(String textLength) {
		this.textLength = textLength;
	}
	public String getConncId() {
		return conncId;
	}
	public void setConncId(String conncId) {
		this.conncId = conncId;
	}
	public String getAdptrId() {
		return adptrId;
	}
	public void setAdptrId(String adptrId) {
		this.adptrId = adptrId;
	}
	public String getIoDscr() {
		return ioDscr;
	}
	public void setIoDscr(String ioDscr) {
		this.ioDscr = ioDscr;
	}
	public String getStartChar() {
		return startChar;
	}
	public void setStartChar(String startChar) {
		this.startChar = startChar;
	}
	public String getLastChar() {
		return lastChar;
	}
	public void setLastChar(String lastChar) {
		this.lastChar = lastChar;
	}
	public String getDelimChar() {
		return delimChar;
	}
	public void setDelimChar(String delimChar) {
		this.delimChar = delimChar;
	}
	public Integer getParsedIdx() {
		return parsedIdx;
	}
	public void setParsedIdx(Integer parsedIdx) {
		this.parsedIdx = parsedIdx;
	}
	public String getIoIdDs() {
		return ioIdDs;
	}
	public void setIoIdDs(String ioIdDs) {
		this.ioIdDs = ioIdDs;
	}

}
