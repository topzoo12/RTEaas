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
package egovframework.zieumtn.status.vo;

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
public class StatusCarVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;


	private String carId;

	private String carDiv;
	private String carDivNm;
	private String carNo;
	private String carSize;
	private String carSizeNm;
	private String carSpec;
	private String itemCnt;

	private String manageDate;
	private String oilAmount;
	private String cleanerAmount;
	private String wiperChange;
	private String tireChange;

	public String getCarDiv() {
		return carDiv;
	}
	public void setCarDiv(String carDiv) {
		this.carDiv = carDiv;
	}
	public String getCarDivNm() {
		return carDivNm;
	}
	public void setCarDivNm(String carDivNm) {
		this.carDivNm = carDivNm;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getCarSize() {
		return carSize;
	}
	public void setCarSize(String carSize) {
		this.carSize = carSize;
	}
	public String getCarSpec() {
		return carSpec;
	}
	public void setCarSpec(String carSpec) {
		this.carSpec = carSpec;
	}
	public String getItemCnt() {
		return itemCnt;
	}
	public void setItemCnt(String itemCnt) {
		this.itemCnt = itemCnt;
	}
	public String getManageDate() {
		return manageDate;
	}
	public void setManageDate(String manageDate) {
		this.manageDate = manageDate;
	}
	public String getOilAmount() {
		return oilAmount;
	}
	public void setOilAmount(String oilAmount) {
		this.oilAmount = oilAmount;
	}
	public String getCleanerAmount() {
		return cleanerAmount;
	}
	public void setCleanerAmount(String cleanerAmount) {
		this.cleanerAmount = cleanerAmount;
	}
	public String getWiperChange() {
		return wiperChange;
	}
	public void setWiperChange(String wiperChange) {
		this.wiperChange = wiperChange;
	}
	public String getTireChange() {
		return tireChange;
	}
	public void setTireChange(String tireChange) {
		this.tireChange = tireChange;
	}
	public String getCarSizeNm() {
		return carSizeNm;
	}
	public void setCarSizeNm(String carSizeNm) {
		this.carSizeNm = carSizeNm;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}


}
