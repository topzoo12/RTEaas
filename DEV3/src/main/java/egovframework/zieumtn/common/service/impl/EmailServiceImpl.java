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
package egovframework.zieumtn.common.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Properties;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.common.service.EmailService;
import egovframework.zieumtn.common.service.EmailVO;
import egovframework.zieumtn.common.service.SMTPAuthenticator;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("emailService")
public class EmailServiceImpl extends EgovAbstractServiceImpl implements EmailService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EmailServiceImpl.class);

    @Inject
    JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입

    @Override
	public void sendMail(EmailVO vo) {
    	System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2,SSLv3");
        Properties prop = new Properties();

//        final String user = "platform@zieumtn.com"; //발신자의 이메일 아이디를 입력
//        final String password = "LwX5t5cdtGO1";         //발신자 이메일의 패스워드를 입력
        final String user = "daisol2022@gmail.com"; //발신자의 이메일 아이디를 입력
        final String password = "xtezjiyrzwtaxcrh";         //발신자 이메일의 패스워드를 입력

//        HGnA8x7K0voC

    	try{
    		/* ssl 연결 - 465 포트
    		prop.put("mail.smtp.host", "smtp.worksmobile.com");
    		prop.put("mail.smtp.port", 465);
    		prop.put("mail.smtp.auth", "true");
    		prop.put("mail.smtp.ssl.enable", "true");
    		prop.put("mail.smtp.ssl.trust", "smtp.worksmobile.com");
    		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");*/

    		//tls 연결 - 587 포트
    		prop.put("mail.smtp.host", "smtp.gmail.com");
    		prop.put("mail.smtp.port", 587);
    		prop.put("mail.smtp.auth", "true");
    		prop.put("mail.smtp.starttls.enable", "true"); // STARTTLS를 활성화
    		prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 1.2를 명시적으로 설정



    		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

    		MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getReceiveMail()));

            // Subject
            message.setSubject(vo.getSubject()); //메일 제목을 입력

 /*           String mailText =
            		"<div style=\"width: 650px;height: 656px; font-family: 'Noto Sans KR', sans-serif, '맑은 고딕', dotum;margin: 0;	padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<div style=\"padding: 60px; font-family: inherit;margin: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<div style=\"font-family: inherit;margin: 0;	padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<p></p>"
            		//<img src=\"http://123.212.42.108:8090/img/logo_gray.png\" style=\"border: 0\">
            		+ "<p style=\"margin: 33px 0 0;	font-size: 40px;color: #000;font-weight: 600;letter-spacing: -2px;font-family: inherit;	padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ vo.getMessage()
            		+ "<p style=\"margin: 30px 0 0;	font-size: 14px;color: #666666;font-family: inherit;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "이용해 주셔서 감사합니다.<br>더욱 편리한 서비스 제공을 위해 최선을 다하겠습니다.</p>"
            		+ "<p style=\"margin: 30px 0 0;	background: #f2f2f2;font-size: 12px;color: #666666;padding: 20px 15px;line-height: 180%;font-family: inherit;border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "본 메일은 발신전용입니다.<br>Copyright(C) 2022 지음테크넷. All Rights Reserved.</p></div></div></div>"
            		;*/


            String mailText = vo.getMessage()
            		+ "<table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"24\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table> \r\n"
            		+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"40\">&nbsp;</td></tr></tbody></table> \r\n"
            		+ "        <p style=\"Margin:0;color:#183153;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:16px;font-weight:400;line-height:1.5;margin:0;margin-bottom:24px;padding:0;text-align:left\">이용해 주셔서 감사합니다.<br/>\r\n"
            		+ "        더욱 편리한 서비스 제공을 위해 최선을 다하겠습니다.</p>\r\n"
            		+ "        <!-- CONTENT END -->\r\n"
            		+ "        </th><th colspan=\"1\" rowspan=\"1\" style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;hyphens:auto;line-height:1.5;margin:0;padding:0!important;text-align:left;vertical-align:top;visibility:hidden;width:0;word-wrap:break-word\"></th></tr></tbody></table></th></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>\r\n"
            		+ "        <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"32\">&nbsp;</td></tr></tbody></table> \r\n"
            		+ "        <!-- 카피라이터 -->\r\n"
            		+ "        <table align=\"center\" style=\"Margin:0 auto;border-collapse:collapse;border-spacing:0;float:none;margin:0 auto;padding:0;text-align:center;vertical-align:top;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;\">\r\n"
            		+ "        <table align=\"center\" style=\"Margin:0 auto;background:0 0;background-color:#f0f1f3;border-collapse:collapse;border-spacing:0;margin:0 auto;padding:0;text-align:inherit;vertical-align:top;width:580px\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;\"><p style=\"Margin:0;color:#8991a5;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:.9rem;font-weight:400;line-height:1.5;margin:0;margin-bottom:10px;padding:0;text-align:center\">본 메일은 발신전용입니다.<br>\r\n"
            		+ "        Copyright(C) 2025 지음테크넷. All Rights Reserved.</p></td></tr></tbody></table></td></tr></tbody></table>\r\n"
            		+ "    </center>\r\n"
            		+ "    <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"48\">&nbsp;</td></tr></tbody></table> \r\n"
            		+ "</td></tr></tbody></table>";



            // Text
            //message.setText(mailText);    //메일 내용을 입력
            message.setContent(mailText,"text/html; charset=euc-kr"); // HTML 형식
            // send the message
            System.out.println("▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽");
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");

    	} catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    	/*
        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true,"UTF-8");

            //helper.setFrom(vo.getSenderMail());
            helper.setTo(vo.getReceiveMail());
            helper.setSubject(vo.getSubject());

            String mailText =
            		"<div style=\"width: 650px;height: 656px; font-family: 'Noto Sans KR', sans-serif, '맑은 고딕', dotum;margin: 0;	padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<div style=\"padding: 60px; font-family: inherit;margin: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<div style=\"font-family: inherit;margin: 0;	padding: 0;	border: 0;	font-size: 100%;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "<p></p>"
            		//<img src=\"http://123.212.42.108:8090/img/logo_gray.png\" style=\"border: 0\">
            		+ "<p style=\"margin: 33px 0 0;	font-size: 40px;color: #000;font-weight: 600;letter-spacing: -2px;font-family: inherit;	padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ vo.getMessage()
            		+ "<p style=\"margin: 30px 0 0;	font-size: 14px;color: #666666;font-family: inherit;padding: 0;	border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "이용해 주셔서 감사합니다.<br>더욱 편리한 서비스 제공을 위해 최선을 다하겠습니다.</p>"
            		+ "<p style=\"margin: 30px 0 0;	background: #f2f2f2;font-size: 12px;color: #666666;padding: 20px 15px;line-height: 180%;font-family: inherit;border: 0;vertical-align: baseline;box-sizing: border-box;\">"
            		+ "본 메일은 발신전용입니다.<br>Copyright(C) 2022 Dobong-Gu. All Rights Reserved.</p></div></div></div>"
            		;
            //helper.setText("<html><body>"+vo.getMessage()+"</body></html>", true);
            helper.setText(mailText, true);

            message.setFrom(new InternetAddress(vo.getSenderMail()));
            // 이메일 보내기
            mailSender.send(message);

        }catch(NullPointerException e) {
			System.err.println("Null 에러 발생::"+e.toString());
		} catch (Exception e) {
            System.err.println("에러 발생::"+e.toString());
        }
        */
    }


    @Override
	public void sendFaqMail(EmailVO vo) {
    	System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2,SSLv3");
        Properties prop = new Properties();

        final String user = "daisol2022@gmail.com"; //발신자의 이메일 아이디를 입력
        final String password = "xtezjiyrzwtaxcrh";         //발신자 이메일의 패스워드를 입력

    	try{

    		/* ssl 연결 - 465 포트
    		prop.put("mail.smtp.host", "smtp.worksmobile.com");
    		prop.put("mail.smtp.port", 465);
    		prop.put("mail.smtp.auth", "true");
    		prop.put("mail.smtp.ssl.enable", "true");
    		prop.put("mail.smtp.ssl.trust", "smtp.worksmobile.com");
    		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");*/

    		//tls 연결 - 587 포트
    		prop.put("mail.smtp.host", "smtp.gmail.com");
    		prop.put("mail.smtp.port", 587);
    		prop.put("mail.smtp.auth", "true");
    		prop.put("mail.smtp.starttls.enable", "true"); // STARTTLS를 활성화
    		prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 1.2를 명시적으로 설정


    		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

    		MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getReceiveMail()));

            // Subject
            message.setSubject(vo.getSubject()); //메일 제목을 입력

            String mailText = vo.getMessage()
            		+ "<table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"24\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table> \r\n"
            		+ "        <!-- 카피라이터 -->\r\n"
            		+ "        <table align=\"center\" style=\"Margin:0 auto;border-collapse:collapse;border-spacing:0;float:none;margin:0 auto;padding:0;text-align:center;vertical-align:top;width:100%\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;\">\r\n"
            		+ "        <table align=\"center\" style=\"Margin:0 auto;background:0 0;background-color:#f0f1f3;border-collapse:collapse;border-spacing:0;margin:0 auto;padding:0;text-align:inherit;vertical-align:top;width:580px\"><tbody><tr style=\"padding:0;text-align:left;vertical-align:top\"><td style=\"-moz-box-sizing:border-box;-moz-hyphens:auto;-webkit-box-sizing:border-box;-webkit-hyphens:auto;Margin:0;border-collapse:collapse!important;box-sizing:border-box;\"><p style=\"Margin:0;color:#8991a5;font-family:'AppleSDGothicNeo-Regular','Malgun Gothic','맑은고딕','돋움',dotum,sans-serif;font-size:.9rem;font-weight:400;line-height:1.5;margin:0;margin-bottom:10px;padding:0;text-align:center\">본 메일은 발신전용입니다.<br>\r\n"
            		+ "        Copyright(C) 2025 지음테크넷. All Rights Reserved.</p></td></tr></tbody></table></td></tr></tbody></table>\r\n"
            		+ "    </center>\r\n"
            		+ "    <table style=\"border-collapse:collapse;border-spacing:0;padding:0;width:100%\"><tbody><tr><td height=\"48\">&nbsp;</td></tr></tbody></table> \r\n"
            		+ "</td></tr></tbody></table>";

            // Text
            //message.setText(mailText);    //메일 내용을 입력
            message.setContent(mailText,"text/html; charset=euc-kr"); // HTML 형식
            // send the message
            System.out.println("▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽");
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");

    	} catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
