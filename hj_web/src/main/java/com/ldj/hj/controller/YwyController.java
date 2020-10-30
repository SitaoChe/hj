package com.ldj.hj.controller;

import com.ldj.hj.service.BmdService;
import com.ldj.hj.service.YwyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/ywy")
public class YwyController {
    @Autowired
    private YwyService ywyService;

    @Autowired
    private BmdService bmdService;

    @RequestMapping("/ywyIndex")
    public String ywyIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("../ywyIndex.jsp").forward(request,response);
        return "ywyIndex";
    }
    @RequestMapping("/ywyLoginOut")
    public String ywyLoginOut(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("YWY",null);
        //response.sendRedirect(request.getContextPath()+"/toLogin.do");
        return "redirect:/self/toLogin.do";
    }
    @RequestMapping("/ywyBmd")
    public void ywyBmd(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        request.getRequestDispatcher("../ywyIndex.jsp").forward(request,response);
    }
    @RequestMapping("/ywyBmdToAdd")
    public void ywyBmdToAdd(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        request.getRequestDispatcher("../ywyIndex.jsp").forward(request,response);
    }

    @RequestMapping("/ywyBmdAdd")
    public void ywyBmdAdd(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        response.sendRedirect("ywyBmd.do");
    }

    @RequestMapping("/ywyBmdToEdit")
    public void ywyBmdToEdit(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        request.getRequestDispatcher("../ywyIndex.jsp").forward(request,response);
    }

    @RequestMapping("/ywyBmdEdit")
    public void ywyBmdEdit(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        response.sendRedirect(request.getContextPath()+"/toLogin.do");
    }
}
