package com.ldj.hj.controller;

import com.ldj.hj.entity.*;
import com.ldj.hj.service.SelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Controller
@RequestMapping("/self")
public class SelfController {

    @Autowired
    private SelfService selfService;


    @RequestMapping("/toLogin")
    public String toLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(request,response);
        return "login";
    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        if (account.indexOf("super") != -1 ){
            Super superA = selfService.superLogin(account,password);
            if (superA == null){
                request.setAttribute("errorMsg","账号或密码错误，请重新登录!");
                request.getRequestDispatcher("toLogin.do").forward(request,response);
//                response.sendRedirect("toLogin.do");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("SUPER",superA);
//                response.sendRedirect("super/superIndex.do");
                return "redirect:/super/superIndex.do";
            }
        }else if (account.indexOf("gl") != -1){
            Admin admin = selfService.adminLogin(account,password);
            if (admin == null){
                request.setAttribute("errorMsg","账号或密码错误，请重新登录!");
                request.getRequestDispatcher("toLogin.do").forward(request,response);
//                response.sendRedirect("toLogin.do");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("ADMIN",admin);
//                response.sendRedirect("admin/adminIndex.do");
                return "redirect:/admin/adminIndex.do";
            }
        }else  if (account.indexOf("bmd") != -1){
            Bmd bmd = selfService.bmdLogin(account,password);
            if (bmd == null){
                request.setAttribute("errorMsg","账号或密码错误，请重新登录!");
                request.getRequestDispatcher("toLogin.do").forward(request,response);
//                response.sendRedirect("toLogin.do");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("BMD",bmd);
//                response.sendRedirect("bmd/bmdIndex.do");
                return "redirect:/bmd/bmdIndex.do";
            }
        }else if (account.indexOf("ywy") != -1){
            Ywy ywy = selfService.ywyLogin(account,password);
            if (ywy == null){
                request.setAttribute("errorMsg","账号或密码错误，请重新登录!");
                request.getRequestDispatcher("toLogin.do").forward(request,response);
//                response.sendRedirect("toLogin.do");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("YWY",ywy);
//                response.sendRedirect("ywy/ywyIndex.do");
                return "redirect:/ywy/ywyIndex.do";
            }
        }else {
            request.setAttribute("errorMsg","请输入合理的账号名");
            request.getRequestDispatcher("toLogin.do").forward(request,response);
//            response.sendRedirect("toLogin.do");
        }
        return null;
    }


}
