package com.ldj.hj.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldj.hj.dao.RaceDao;
import com.ldj.hj.entity.Bmd;
import com.ldj.hj.entity.Race;
import com.ldj.hj.entity.User;
import com.ldj.hj.entity.Userrace;
import com.ldj.hj.service.BmdService;
import com.ldj.hj.service.RaceService;
import com.ldj.hj.service.UserService;
import com.ldj.hj.service.UserraceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller()
@RequestMapping("bmd")
public class BmdController {
    @Autowired
    private BmdService bmdService;

    @Autowired
    private RaceService raceService;

    @Autowired
    private UserService userService;
    @Qualifier("raceDao")
    @Autowired
    private RaceDao raceDao;

    @Autowired
    private UserraceService userraceService;

    @RequestMapping("/bmdIndex")
    public void bmdIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer bmdId = bmd.getBmdId();
        Bmd bmd1 = bmdService.getBmd(bmdId);
        request.setAttribute("OBJBMD",bmd1);
        request.getRequestDispatcher("../bmdindex.jsp").forward(request,response);
    }
    @RequestMapping("/bmdLoginOut")
    public String bmdLoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("BMD",null);
//        response.sendRedirect(request.getContextPath()+"/toLogin.do");
        return "redirect:/self/toLogin.do";
    }
    @RequestMapping("/bmdXg")
    public void bmdXg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer bmdId = bmd.getBmdId();
        Bmd bmd1 = bmdService.getBmd(bmdId);
        request.setAttribute("OBJBMD",bmd1);
        request.getRequestDispatcher("../bmdxg.jsp").forward(request,response);
    }
    @RequestMapping("/bmdXxXg")
    public void bmdXxXg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bmdId = Integer.parseInt(request.getParameter("bmdid"));
        String bmdAccount = request.getParameter("bmdaccount");
        String bmdPwd = request.getParameter("bmdpwd");
        String name = request.getParameter("name");
        String idCard = request.getParameter("idcard");
        String address=request.getParameter("address");
        String phone =request.getParameter("phone");
        String bmdContact = request.getParameter("bmdcontact");
        String bmdPhone = request.getParameter("bmdphone");
        String bmdAddress = request.getParameter("bmdaddress");
        String bmdMessage = request.getParameter("bmdmessage");
        String team = request.getParameter("team");
        Integer adminId = Integer.parseInt(request.getParameter("adminid")) ;


        Bmd bmd = new Bmd();
        bmd.setBmdId(bmdId);
        bmd.setBmdAccount(bmdAccount);
        bmd.setBmdPwd(bmdPwd);
        bmd.setName(name);
        bmd.setIdCard(idCard);
        bmd.setAddress(address);
        bmd.setPhone(phone);
        bmd.setBmdContact(bmdContact);
        bmd.setBmdPhone(bmdPhone);
        bmd.setBmdAddress(bmdAddress);
        bmd.setBmdMessage(bmdMessage);
        bmd.setTeam(team);
        bmd.setAdminId(adminId);

        bmdService.editBmd(bmd);

        response.sendRedirect("bmdIndex.do");
    }

    @RequestMapping("/bmdSsb")
    public void bmdSsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer adminId = bmd.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdminNoLock(adminId);
        request.setAttribute("RACELIST",raceList);
        request.getRequestDispatcher("../bmdssb.jsp").forward(request,response);
    }
    @RequestMapping("/bmdSsbLock")
    public void bmdSsbLock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        raceService.editLock(raceId);
        response.sendRedirect("bmdSsb.do");
    }
    @RequestMapping("/bmdXsb")
    public void bmdXsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer bmdId = bmd.getBmdId();

        int pageNum = 1;
        int pageSize = 10;
        if (request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("pageSize") != null){
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        PageHelper.startPage(pageNum,pageSize);
        List<User> userList = userService.getUserByDeleteAndBmdId(bmdId);
        PageInfo<User> pageInfo =new PageInfo<User>(userList);
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("../bmdxsb.jsp").forward(request,response);
    }
    @RequestMapping("/bmdXsbToAdd")
    public void bmdXsbToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer adminId = bmd.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdminNoLock(adminId);
        request.setAttribute("RACELIST",raceList);
        request.getRequestDispatcher("../bmdxsbadd.jsp").forward(request,response);
    }
    @RequestMapping("/bmdXsbAdd")
    public void bmdXsbAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userAccount = request.getParameter("useraccount");
        String userPwd = request.getParameter("userpwd");
        String boyName = request.getParameter("boyname");
        String girlName =request.getParameter("girlname");
        String phone = request.getParameter("phone");
        String userIdCard = request.getParameter("useridcard");
        String checkStatus = "未缴费";
        String region = request.getParameter("region");
        Integer raceId = Integer.parseInt(request.getParameter("raceId"));
        Race race = raceDao.selectByRaceId(raceId);
        String raceProject = race.getRaceName() + "(" + race.getStartAge() +"-" + race.getEndAge()+"岁)";

        String grade = "";
        String deleteStatus = "未删除";
        HttpSession session = request.getSession();
        Bmd bmd = (Bmd) session.getAttribute("BMD");
        Integer adminId = bmd.getAdminId();
        Integer bmdId = bmd.getBmdId();

        User user = new User();
        user.setUserAccount(userAccount);
        user.setUserPwd(userPwd);
        user.setBoyName(boyName);
        user.setGirlName(girlName);
        user.setPhone(phone);
        user.setUserIdCard(userIdCard);
        user.setCheckStatus(checkStatus);
        user.setRegion(region);
        user.setRaceProject(raceProject);
        user.setGrade(grade);
        user.setDeleteStatus(deleteStatus);
        user.setAdminId(adminId);
        user.setBmdId(bmdId);
        user.setRaceId(raceId);

        userService.addUser(user);
        response.sendRedirect("bmdXsb.do");

    }
    @RequestMapping("/bmdXsbToEdit")
    public void bmdXsbToEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userid"));
        User user = userService.getUser(userId);
        request.setAttribute("OBJUSER",user);
        Integer adminId = user.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdminNoLock(adminId);
        request.setAttribute("RACELIST",raceList);
        request.getRequestDispatcher("../bmdxsbedit.jsp").forward(request,response);
    }
    @RequestMapping("/bmdXsbEdit")
    public void bmdXsbEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userid"));
        String userAccount = request.getParameter("useraccount");
        String userPwd = request.getParameter("userpwd");
        String boyName = request.getParameter("boyname");
        String girlName =request.getParameter("girlname");
        String phone = request.getParameter("phone");
        String userIdCard = request.getParameter("useridcard");
        Integer raceId = Integer.parseInt(request.getParameter("raceId"));
        Integer groupsNum = Integer.parseInt(request.getParameter("groupsnum"));
        Race race = raceDao.selectByRaceId(raceId);
        String raceProject = race.getRaceName() + "-(" + race.getStartAge() +"-" + race.getEndAge()+"岁)";

        String grade = request.getParameter("grade");
        String checkStatus = request.getParameter("checkstatus");
        String region = request.getParameter("region");
        Integer adminId = Integer.parseInt(request.getParameter("adminid"));
        Integer bmdId = Integer.parseInt(request.getParameter("bmdid"));
        String deleteStatus = "未删除";

        User user = new User();
        user.setUserId(userId);
        user.setUserAccount(userAccount);
        user.setUserPwd(userPwd);
        user.setBoyName(boyName);
        user.setGirlName(girlName);
        user.setPhone(phone);
        user.setUserIdCard(userIdCard);
        user.setCheckStatus(checkStatus);
        user.setRegion(region);
        user.setRaceProject(raceProject);
        user.setGrade(grade);
        user.setDeleteStatus(deleteStatus);
        user.setAdminId(adminId);
        user.setBmdId(bmdId);
        user.setRaceId(raceId);
        user.setGroupsNum(groupsNum);
        userService.editUser(user);
        response.sendRedirect("bmdXsb.do");
    }
    @RequestMapping("/bmdXsbRemove")
    public void bmdXsbRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userid"));
        userService.removeUser(userId);
        response.sendRedirect("bmdXsb.do");
    }

}
