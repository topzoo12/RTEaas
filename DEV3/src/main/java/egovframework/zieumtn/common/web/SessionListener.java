package egovframework.zieumtn.common.web;

import java.time.LocalTime;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginVO;


public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(final HttpSessionEvent event) {
		LocalTime now = LocalTime.now();
		HttpSession session = event.getSession();
		System.out.println(session.getId());
		System.out.println(session.getAttribute("authInfo"));
		System.out.println("세션 IN   :   " + now);
	}


	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		LocalTime now = LocalTime.now();
		HttpSession session = event.getSession();
		System.out.println(session.getAttribute("authInfo"));
		System.out.println("세션 OUT   :   " + now);

		if (session.getAttribute("authInfo") != null) {
			AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");
			LoginVO loginVO = new LoginVO();
			loginVO.setCoId(authInfo.getCoId());
			loginVO.setUsrId(authInfo.getUsrId());

			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
			CommonService commonService = (CommonService) ctx.getBean("commonService");

			System.out.println("-----------------API키삭제-----------------");
			commonService.deleteApiKey(loginVO);
			System.out.println("--------------API키삭제완료-----------------");

		}
	}

}