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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.LoginMenuVO;
import egovframework.zieumtn.common.service.LoginService;
import egovframework.zieumtn.common.service.LoginVO;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.util.SystemOutLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

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

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServiceImpl.class);

	// TODO ibatis 사용
	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public AuthVO loginAuth(LoginVO vo) throws Exception{

		System.out.println("vo--");
		System.out.println(vo);
		LoginVO user = loginDAO.selectById(vo); 				//여기서 로그인 유저 정보(region 포함) 생성됨
		if(user == null) {
			return new AuthVO("", "", "", "", "", "", "",
					"","","","","",null,null,"", null,null,null,null,null,null,null);
		}

		System.out.println("user--");
		System.out.println(user);

		List<?> usermenu = loginDAO.selectMenuById(user);      //Common_SQL.xml에 loginDAO.selectMenuById 쿼리 호출 됨 (user 파라미터에 cdNa 포함)
		List<?> userFavmenu = loginDAO.selectFavMenuById(user);

		System.out.println(usermenu);
		System.out.println("favorite list: " + userFavmenu);
		return new AuthVO(user.getCoId(), user.getCoNm(), user.getUsrId(), user.getUsrNm(), user.getDeptNm(), user.getCotelNo(), user.getAuthgrpId(),
				user.getWtX(),user.getWtY(),user.getWtNm(),user.getMapX(),user.getMapY(),usermenu, userFavmenu, user.getRestApiUrl(), user.getRestApiDistance(),
				user.getCdNa(), user.getChangedCdNa(), user.getMapMinSize(), user.getMapMaxSize(), user.getAreaCodeLv1(), user.getAreaCodeLv2());
	}

	@Override
	public LoginVO loginCheck(LoginVO vo) throws Exception {
		LoginVO user = loginDAO.checkPwd(vo);
		return user;
	}

	@Override
	public AuthVO loginGPKI() throws Exception {
		LoginVO user = loginDAO.selectByGPKI();

		List<?> usermenu = loginDAO.selectMenuById(user);
		List<?> userFavmenu = loginDAO.selectFavMenuById(user);

		return new AuthVO(user.getCoId(), user.getCoNm(), user.getUsrId(), user.getUsrNm(), user.getDeptNm(), user.getCotelNo(), user.getAuthgrpId(),
				user.getWtX(),user.getWtY(),user.getWtNm(),user.getMapX(),user.getMapY(),usermenu,userFavmenu,"","","","","","","","");
	}

	@Override
	public AuthVO changeAuth(LoginVO vo) throws Exception{
		LoginVO user = loginDAO.selectByCoId(vo);
		if(user == null) {
			return new AuthVO("", "", "", "", "", "", "",
					"","","","","",null,null,"","","","","","","","");
		}

		//List<?> usermenu = loginDAO.selectMenuById(user);
		//List<?> userFavmenu = loginDAO.selectFavMenuById(user);

		return new AuthVO(user.getCoId(), user.getCoNm(), user.getUsrId(), user.getUsrNm(), user.getDeptNm(), user.getCotelNo(), user.getAuthgrpId(),
				user.getWtX(),user.getWtY(),user.getWtNm(),user.getMapX(),user.getMapY(),null,null,"","","","","","","","");
	}

	@Override
	public AuthVO changeLanguageMenu(LoginVO vo) throws Exception{

		List<?> usermenu = loginDAO.selectMenuByChangeCdNaAndId(vo);      //Common_SQL.xml에 loginDAO.selectMenuById 쿼리 호출 됨 (user 파라미터에 cdNa 포함)
		List<?> userFavmenu = loginDAO.selectFavMenuByChangeCdNaAndId(vo);

		System.out.println(usermenu);

		return new AuthVO("", "", "", "", "", "", "",
				"","","","","",usermenu, userFavmenu, "", "", "", "","","","","");
	}

	/*@Override
	public String getClientIp(HttpServletRequest request) throws Exception {
	    String ip = request.getHeader("X-Forwarded-For");
	    String address = "";

	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	        System.out.println("Proxy-Client-IP: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        System.out.println("WL-Proxy-Client-IP: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        System.out.println("HTTP_CLIENT_IP: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        System.out.println("HTTP_X_FORWARDED_FOR: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("X-Real-IP");
	        System.out.println("X-Real-IP: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("X-RealIP");
	        System.out.println("X-RealIP: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("REMOTE_ADDR");
	        System.out.println("REMOTE_ADDR: " + ip);
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	        System.out.println("Remote-IP: " + ip);
	    }

	    if(ip.equals("0:0:0:0:0:0:0:1") || ip.equals("127.0.0.1")) {

	    	InetAddress localAddress = InetAddress.getLocalHost();
	    	//ip = address.getHostName() + "/" + address.getHostAddress();
	    	ip = localAddress.getHostAddress();
	    	System.out.println("내부 ip 확인: " +  request.getLocalAddr());
	    	System.out.println("Host-IP: " + ip);
	  }

		System.out.println("아이피 확인: " + ip);
		System.out.println("아이피 djemfp확인: " + ip);
	    return ip;
	}

	@Override
	public String getCountryCodeByIp(String ipAddress) throws Exception {

		String countryCode ="";

        try {
            // Create URL for API request
            String apiUrl = "https://ip2c.org/?ip=" + URLEncoder.encode(ipAddress, "UTF-8");
            URL url = new URL(apiUrl);

            // Open connection
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // Read response
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Parse response
            String[] parts = response.toString().split(";");
            if (parts.length >= 4) {
                countryCode = parts[1];
                String countryIsoCode = parts[2];
                String countryName = parts[3];

                System.out.println("국가 코드: " + countryCode);
                System.out.println("ISO 코드: " + countryIsoCode);
                System.out.println("국가 이름: " + countryName);
            } else {
                System.out.println("API 응답 형식 오류: " + response.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

		return countryCode;
	}*/


}
