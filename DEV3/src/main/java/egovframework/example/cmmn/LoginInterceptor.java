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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.zieumtn.common.web.LoginController;
import net.sf.json.JSONObject;


public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override // 이부분은 컨트롤러 타기전에
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션 객체 생성
        HttpSession session = request.getSession();
        // 세션에 id가 null이면
        if(session.getAttribute("authInfo") == null) {
            // 컨트롤러를 실행하지 않는다.(요청페이지로 이동하지 않는다)
			response.setContentType("text/html; charset=UTF-8");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("resultCode", -2);

			PrintWriter out = response.getWriter();
			out.write(jsonObject.toString());
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

    	 if(session.getAttribute("authInfo") != null) {
    		 if(modelAndView != null) {
        		 modelAndView.addObject("authInfo", session.getAttribute("authInfo"));
    		 }
         }

    }
}