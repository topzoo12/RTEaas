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
public class FcltsInfoVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String fcltsUuid;		//시설물 고유 아이디 - 측정장치 ID(기기 고유번호)
	private String fcltsClUuid;		//시설물 분류 고유아이디 - 버스정류장/CCTV (공통코드)
	private String fcltsClUuidNm;		//시설물 분류 고유아이디 - 버스정류장/CCTV (공통코드)
	private String fcltsNm;			//시설물 이름 - 측정소명
	private String fcltsItlpcNm;	//시설물 설치장소 이름
	private String fcltsItlpcNmDs;	//시설물 설치장소 이름
	private String fcltsItlpcAddr;	//시설물 설치장소 주소
	private Double fcltsItlpcLa;	//시설물 설치장소 위도
	private Double fcltsItlpcLo;	//시설물 설치장소 경도
	private String fcltsTyp;		//시설물 타입 - 고정값 = '01'
	private String fcltsTypDtl;		//시설물 타입 상세
	private String dataAqstMth;		//데이터 수집 방법 - 고정값 = '01'
	private String ipAddr;			//아이피 주소
	private String port;			//포트번호
	private String cctvLoginId;		//폐쇄회로텔레비전 로그인 아이디
	private String cctvLoginPwd;
	private String cctvStreamUrl;	//폐쇄회로텔레비전 스트리밍 주소
	private String cctvAuthType;	//폐쇄회로텔레비전 인증 방식 - 고정값 = 'Digest'
	private String instlDe;			//설치 일자
	private String useSttus;		//사용 상태 - 사용유무 (사용='1', 미사용='2')
	private String reason;			//사유
	private String vmsId;			//영상관리 시스템 아이디
	private String tlphonNo;		//측정장치 전화번호
	private String fwNo;			//영상관리 시스템 아이디
	private String sendDt;		//측정장치 전화번호
	private String stat;		//상태
	private String checkDt;		//최종점검일

	public String getFcltsUuid() {
		return fcltsUuid;
	}
	public void setFcltsUuid(String fcltsUuid) {
		this.fcltsUuid = fcltsUuid;
	}
	public String getFcltsClUuid() {
		return fcltsClUuid;
	}
	public void setFcltsClUuid(String fcltsClUuid) {
		this.fcltsClUuid = fcltsClUuid;
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
	public String getFcltsTyp() {
		return fcltsTyp;
	}
	public void setFcltsTyp(String fcltsTyp) {
		this.fcltsTyp = fcltsTyp;
	}
	public String getFcltsTypDtl() {
		return fcltsTypDtl;
	}
	public void setFcltsTypDtl(String fcltsTypDtl) {
		this.fcltsTypDtl = fcltsTypDtl;
	}
	public String getDataAqstMth() {
		return dataAqstMth;
	}
	public void setDataAqstMth(String dataAqstMth) {
		this.dataAqstMth = dataAqstMth;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getCctvLoginId() {
		return cctvLoginId;
	}
	public void setCctvLoginId(String cctvLoginId) {
		this.cctvLoginId = cctvLoginId;
	}
	public String getCctvLoginPwd() {
		return cctvLoginPwd;
	}
	public void setCctvLoginPwd(String cctvLoginPwd) {
		this.cctvLoginPwd = cctvLoginPwd;
	}
	public String getCctvStreamUrl() {
		return cctvStreamUrl;
	}
	public void setCctvStreamUrl(String cctvStreamUrl) {
		this.cctvStreamUrl = cctvStreamUrl;
	}
	public String getCctvAuthType() {
		return cctvAuthType;
	}
	public void setCctvAuthType(String cctvAuthType) {
		this.cctvAuthType = cctvAuthType;
	}
	public String getInstlDe() {
		return instlDe;
	}
	public void setInstlDe(String instlDe) {
		this.instlDe = instlDe;
	}
	public String getUseSttus() {
		return useSttus;
	}
	public void setUseSttus(String useSttus) {
		this.useSttus = useSttus;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getVmsId() {
		return vmsId;
	}
	public void setVmsId(String vmsId) {
		this.vmsId = vmsId;
	}
	public String getTlphonNo() {
		return tlphonNo;
	}
	public void setTlphonNo(String tlphonNo) {
		this.tlphonNo = tlphonNo;
	}
	public String getFcltsClUuidNm() {
		return fcltsClUuidNm;
	}
	public void setFcltsClUuidNm(String fcltsClUuidNm) {
		this.fcltsClUuidNm = fcltsClUuidNm;
	}
	public String getFcltsItlpcNmDs() {
		return fcltsItlpcNmDs;
	}
	public void setFcltsItlpcNmDs(String fcltsItlpcNmDs) {
		this.fcltsItlpcNmDs = fcltsItlpcNmDs;
	}
	public String getFwNo() {
		return fwNo;
	}
	public void setFwNo(String fwNo) {
		this.fwNo = fwNo;
	}
	public String getSendDt() {
		return sendDt;
	}
	public void setSendDt(String sendDt) {
		this.sendDt = sendDt;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getCheckDt() {
		return checkDt;
	}
	public void setCheckDt(String checkDt) {
		this.checkDt = checkDt;
	}

}
