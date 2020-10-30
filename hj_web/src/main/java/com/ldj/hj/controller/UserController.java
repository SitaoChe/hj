package com.ldj.hj.controller;


import com.ldj.hj.entity.Race;
import com.ldj.hj.entity.User;
import com.ldj.hj.entity.Userrace;
import com.ldj.hj.service.RaceService;
import com.ldj.hj.service.UserService;
import com.ldj.hj.service.UserraceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private RaceService raceService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserraceService userraceService;

    @RequestMapping("/userIndex")
    public void userIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");

        Integer adminId = user.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
        request.setAttribute("raceList",raceList);

        Integer userId = user.getUserId();
        List<Userrace> userraceList = userraceService.getUserraceByUserId(userId);
        request.setAttribute("USERRACE",userraceList);

        request.getRequestDispatcher("../userindex.jsp").forward(request,response);
    }
    @RequestMapping("/userraceAdd")
    public void userraceAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");
        Integer userId = user.getUserId();
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));

        if (raceId==0){
            response.sendRedirect("userIndex.do");
        }
        Userrace userrace = new Userrace();
        userrace.setUserId(userId);
        userrace.setRaceId(raceId);
//这里加判断是否复合年龄！
        userraceService.addUserrace(userrace);

        String userAccount = user.getUserAccount();
        String userPwd = user.getUserPwd();
        String boyName = request.getParameter("boyname");
        String girlName = request.getParameter("girlname");
        String userIdCard = user.getUserIdCard();
        String region = request.getParameter("region");
        String checkStatus = user.getCheckStatus();
        Integer adminId = user.getAdminId();
        Integer bmdId=user.getBmdId();

        User user1 = new User();
        user1.setUserId(userId);
        user1.setUserAccount(userAccount);
        user1.setUserPwd(userPwd);
        user1.setBoyName(boyName);
        user1.setGirlName(girlName);
        user1.setUserIdCard(userIdCard);
        user1.setRegion(region);
        user1.setCheckStatus(checkStatus);
        user1.setAdminId(adminId);
        user1.setBmdId(bmdId);

        userService.editUser(user1);
        response.sendRedirect("userIndex.do");
    }

}
