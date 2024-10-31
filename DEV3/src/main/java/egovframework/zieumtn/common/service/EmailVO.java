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
public class EmailVO extends CommonDefaultVO {

	private static final long serialVersionUID = 1L;

	private String senderName;    //발신자 이름
    private String senderMail;    //발신자 이메일 주소
    private String receiveMail;    //수신자 이메일 주소
    private String subject;            //제목
    private String message;            //본문

    //getter,setter,toString
    public String getSenderName() {
        return senderName;
    }
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }
    public String getSenderMail() {
        return senderMail;
    }
    public void setSenderMail(String senderMail) {
        this.senderMail = senderMail;
    }
    public String getReceiveMail() {
        return receiveMail;
    }
    public void setReceiveMail(String receiveMail) {
        this.receiveMail = receiveMail;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    @Override
    public String toString() {
        return "EmailVO [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
                + ", subject=" + subject + ", message=" + message + "]";
    }
}
