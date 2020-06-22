package com.itheima.interceptor;

import com.itheima.po.Player;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.indexOf("/login") >= 0 || url.indexOf("/registered.nick") >= 0 || url.indexOf("/register") >= 0) {
            return true;
        }
        HttpSession session = request.getSession();
        Player userImple = (Player) session.getAttribute("user_session");
        if (userImple != null) {
            if(userImple.getGrade()>=0) {
                return true;
            }else{
                request.setAttribute("msg","权限不足");
                request.getRequestDispatcher("/jsp/Insufficient_authority.jsp").forward(request,response);
                return false;
            }
        }
        request.getRequestDispatcher("/login").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
