package com.ldj.hj.global;

import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        String path = request.getServletPath();

        if (path.toLowerCase().indexOf("login") != -1){
            filterChain.doFilter(request,response);
        }else {
            HttpSession userSession = request.getSession();
            HttpSession bmdSession = request.getSession();
            HttpSession adminSession = request.getSession();
            HttpSession superSession = request.getSession();
            HttpSession ywySession = request.getSession();
            Object objUser = userSession.getAttribute("USER");
            Object objBmd = bmdSession.getAttribute("BMD");
            Object objAdmin = adminSession.getAttribute("ADMIN");
            Object objSuperAdmin = superSession.getAttribute("SUPER");
            Object objYwy = superSession.getAttribute("YWY");
            if ( objUser != null ){
                filterChain.doFilter(request,response);
            } else if (objBmd != null){
                filterChain.doFilter(request,response);
            } else if (objAdmin != null){
                filterChain.doFilter(request,response);
            } else if (objSuperAdmin != null){
                filterChain.doFilter(request,response);
            }else if (objYwy != null){
                filterChain.doFilter(request,response);
            }  else {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
