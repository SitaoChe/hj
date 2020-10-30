package com.ldj.hj.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldj.hj.entity.Admin;
import com.ldj.hj.entity.Race;
import com.ldj.hj.entity.User;
import com.ldj.hj.service.AdminService;
import com.ldj.hj.service.RaceService;
import com.ldj.hj.service.SuperService;
import com.ldj.hj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/super")
public class SuperController {
    @Autowired
    private SuperService superService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private RaceService raceService;

    @Autowired
    private UserService userService;

    @RequestMapping("/superIndex")
    public void superIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../superindex.jsp").forward(request,response);
    }
    @RequestMapping("/superLoginOut")
    public String superLoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("SUPER",null);
//        response.sendRedirect(request.getContextPath()+"/toLogin.do");
        return "redirect:/self/toLogin.do";
    }
    @RequestMapping("/superGl")
    public void superGl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Admin> adminList = adminService.getAllAdmin();
        request.setAttribute("ADMINLIST",adminList);
        request.getRequestDispatcher("../supergl.jsp").forward(request,response);
    }
    @RequestMapping("/superGlToAdd")
    public void superGlToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../supergladd.jsp").forward(request,response);
    }
    @RequestMapping("/superGlAdd")
    public void superGlAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminAccount = request.getParameter("adminaccount");
        String adminPwd = request.getParameter("adminpwd");
        boolean isExist = false;
        List<Admin> adminList = adminService.getAllAdmin();
        if(adminList.size() > 0)
            for (Admin adm : adminList){
                if(adm.getAdminAccount().equals(adminAccount)) isExist = true;
            }
        if(isExist){
            request.setAttribute("msg","该账户已存在");
            request.getRequestDispatcher("superGlToAdd.do").forward(request,response);
        }else {
            Admin admin = new Admin();
            admin.setAdminAccount(adminAccount);
            admin.setAdminPwd(adminPwd);

            adminService.addAdmin(admin);
            response.sendRedirect("superGl.do");

        }
    }
    @RequestMapping("/superGlToEdit")
    public void superGlToEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer adminId = Integer.parseInt(request.getParameter("adminid"));
        Admin admin = adminService.getAdmin(adminId);
        request.setAttribute("OBJADMIN",admin);
        request.getRequestDispatcher("../supergledit.jsp").forward(request,response);
    }
    @RequestMapping("/superGlEdit")
    public void superGlEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer adminId = Integer.parseInt(request.getParameter("adminid"));
        String adminAccount = request.getParameter("adminaccount");
        String adminPwd = request.getParameter("adminpwd");

        Admin admin = new Admin();
        admin.setAdminId(adminId);
        admin.setAdminAccount(adminAccount);
        admin.setAdminPwd(adminPwd);
        adminService.editAdmin(admin);

        response.sendRedirect("superGl.do");
    }
    @RequestMapping("/removeAdmin")
    public void removeAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer adminId = Integer.parseInt(request.getParameter("adminid"));
        adminService.removeAdmin(adminId);
        response.sendRedirect("superGl.do");
    }
    @RequestMapping("/superSsb")
    public void superSsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Race> raceList = raceService.getAllRace();
        request.setAttribute("RACELIST",raceList);
        request.getRequestDispatcher("../superssb.jsp").forward(request,response);
    }
    @RequestMapping("/superSsbLock")
    public void superSsbLock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        raceService.editLock(raceId);
        response.sendRedirect("superSsb.do");
    }
    @RequestMapping("/superSsbUnlock")
    public void superSsbUnlock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        raceService.editUnlock(raceId);
        response.sendRedirect("superSsb.do");
    }
    @RequestMapping("/superXsb")
    public void superXsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNum = 1;
        int pageSize = 10;
        if (request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("pageSize") != null){
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        PageHelper.startPage(pageNum,pageSize);
        List<User> userList = userService.getAllUser();

        PageInfo<User> pageInfo =new PageInfo<User>(userList);
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("../superxsb.jsp").forward(request,response);
    }
}
