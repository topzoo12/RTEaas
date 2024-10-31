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
package egovframework.example.cmmn;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.LoginService;
import egovframework.zieumtn.common.service.impl.CommonDAO;
import egovframework.zieumtn.common.service.impl.CommonServiceImpl;
import egovframework.zieumtn.common.web.CommonController;
import egovframework.zieumtn.common.web.LoginController;
import egovframework.zieumtn.system.vo.MenuVO;
import egovframework.zieumtn.system.vo.PageVO;
import net.sf.json.JSONObject;

public class LoginViewInterceptor extends HandlerInterceptorAdapter {

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "loginService")
	private LoginService loginService;

    @Override // 이부분은 컨트롤러 타기전에
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션 객체 생성
        HttpSession session = request.getSession();
        // 세션에 id가 null이면
        if(session.getAttribute("authInfo") == null) {

            // 로그인 페이지로 이동
            response.sendRedirect("/login.do");
            // 컨트롤러를 실행하지 않는다.(요청페이지로 이동하지 않는다)

            return false;
        // null이 아니면
        } else {
            // 컨트롤러를 실행(요청페이지로 이동한다.)
            return true;
        }
    }
    @Override // 이건 컨트롤러에서 뷰로 넘어가기 직전
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	HttpSession session = request.getSession();
    	//CommonServiceImpl commonService = new CommonServiceImpl();
    	//CommonController common = new CommonController();

    	if(session.getAttribute("authInfo") != null) {

    		if(modelAndView != null) {
        		MenuVO logVO = new MenuVO();
        		AuthVO authInfo = (AuthVO) session.getAttribute("authInfo");

        		logVO.setSessionCoId(authInfo.getSessionCoId());
        		logVO.setSessionUserId(authInfo.getSessionUserId());
        		logVO.setSrnUrl(modelAndView.getViewName());
        		logVO.setMnuCdNa(authInfo.getChangedCdNa() == null ? authInfo.getCdNa(): authInfo.getChangedCdNa());

        		commonService.insertMenuConHist(logVO);

        		PageVO menunameVO = new PageVO();
        		List<PageVO> menuList = (List<PageVO>) commonService.getMenuByUrl(logVO);

        		if(menuList.size()>0) {
            		menunameVO = menuList.get(0);
        			modelAndView.addObject("pageName", menunameVO);

        		}

    			List<?> coList = commonService.selectCoList();
    			modelAndView.addObject("selectListSessionCo", coList);

    			modelAndView.addObject("authInfo", session.getAttribute("authInfo"));
    		}
        }

    }
}