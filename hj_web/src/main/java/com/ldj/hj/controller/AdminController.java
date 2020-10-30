package com.ldj.hj.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.ldj.hj.entity.*;
import com.ldj.hj.service.*;
import com.ldj.hj.util.CommUtil;
import com.ldj.hj.util.ExcelUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller()
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private BmdService bmdService;

    @Autowired
    private RaceService raceService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserraceService userraceService;

    @Autowired
    private YwyService ywyService;

    @RequestMapping("/adminIndex")
    public String adminIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("../adminindex.jsp").forward(request,response);
        return "adminindex";
    }
    @RequestMapping("/adminLoginOut")
    public String adminLoginOut(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("ADMIN",null);
//        response.sendRedirect(request.getContextPath()+"/toLogin.do");
        return "redirect:/self/toLogin.do";
    }
    @RequestMapping("/adminBmd")
    public void adminBmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNum = 1;
        int pageSize = 10;
        int allcountpernum = 0;
        int allcountperorder = 0;
        double allMoney = 0.0;
        if (request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("pageSize") != null){
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();

        PageHelper.startPage(pageNum,pageSize);

        List<Bmd> bmdList = bmdService.getAllBmd(adminId);
        for(Bmd bmd : bmdList){
            Integer countperorder = 0;
            Double bmdMoney = 0.0;
            if(bmd.getBmdId() != 0 || bmd.getBmdId() != null){
                countperorder = bmdService.getNumByBmdId(bmd.getBmdId(), true);
                bmdMoney = bmdService.getMoneyByBmdId(bmd.getBmdId(),false);
            }
            allcountperorder+= countperorder;
            allMoney += bmdMoney;
            bmd.setMoney(bmdMoney+"");
            bmd.setPerOrder(countperorder);
            Integer countpernum = bmdService.getNumByBmdId(bmd.getBmdId(), false);
            bmd.setPerNumber(countpernum);
            allcountpernum += countpernum;
        }
        PageInfo<Bmd> pageInfo =new PageInfo<Bmd>(bmdList);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("allcountpernum",allcountpernum);
        request.setAttribute("allcountperorder",allcountperorder);
        request.setAttribute("allMoney",allMoney);
        request.getRequestDispatcher("../adminbmd.jsp").forward(request,response);
    }
    @RequestMapping("/adminBmdToAdd")
    public void adminBmdToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../adminbmdadd.jsp").forward(request,response);
    }
    @RequestMapping("/adminBmdAdd")
    public void adminBmdAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bmdAccount = request.getParameter("bmdaccount");
        String bmdPwd = request.getParameter("bmdpwd");
        String team = request.getParameter("team");
        String name = request.getParameter("name");
        String idCard = request.getParameter("idcard");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Integer perNumber = 0;
        Integer perOrder = 0;
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();

        boolean isExist = false;
        List<Bmd> bmdList = bmdService.getAllBmd(adminId);
        if(bmdList.size() > 0)
            for (Bmd bmd : bmdList){
                if(bmd.getBmdAccount().equals(bmdAccount)) isExist = true;
            }
        if(isExist){
            request.setAttribute("msg","该账户已存在");
            request.getRequestDispatcher("adminBmdToAdd.do").forward(request,response);
        }else {
            Bmd bmd = new Bmd();
            bmd.setBmdAccount(bmdAccount);
            bmd.setBmdPwd(bmdPwd);
            bmd.setTeam(team);
            bmd.setName(name);
            bmd.setIdCard(idCard);
            bmd.setAddress(address);
            bmd.setPhone(phone);
            bmd.setAdminId(adminId);
            bmd.setPerNumber(perNumber);
            bmd.setPerOrder(perOrder);
            bmd.setStatus("未审核");
            bmdService.addBmd(bmd);

            response.sendRedirect("adminBmd.do");
        }


    }
    @RequestMapping("/adminBmdToEdit")
    public void adminBmdToEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bmdId = Integer.parseInt(request.getParameter("bmdid"));
        Bmd bmd = bmdService.getBmd(bmdId);
        request.setAttribute("OBJBMD",bmd);
        request.getRequestDispatcher("../adminbmdedit.jsp").forward(request,response);
    }
    @RequestMapping("/adminBmdEdit")
    public void adminBmdEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bmdId = Integer.parseInt(request.getParameter("bmdid"));
        String bmdAccount = request.getParameter("bmdaccount");
        String bmdPwd = request.getParameter("bmdpwd");
        String team = request.getParameter("team");
        String name = request.getParameter("name");
        String idCard = request.getParameter("idcard");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String bmdContact = request.getParameter("bmdcontact");
        String bmdPhone = request.getParameter("bmdphone");
        String bmdAddress = request.getParameter("bmdaddress");
        String bmdMessage = request.getParameter("bmdmessage");
        String ywyId = request.getParameter("ywyId");
        Integer perNumber = request.getParameter("perNumber") == ""?0:Integer.parseInt(request.getParameter("perNumber"));
        Integer perOrder = request.getParameter("perOrder") == ""?0:Integer.parseInt(request.getParameter("perOrder"));
        String money = request.getParameter("money");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();

        Bmd bmd = new Bmd();
        bmd.setBmdId(bmdId);
        bmd.setBmdAccount(bmdAccount);
        bmd.setBmdPwd(bmdPwd);
        bmd.setTeam(team);
        bmd.setName(name);
        bmd.setIdCard(idCard);
        bmd.setAddress(address);
        bmd.setPhone(phone);
        bmd.setBmdContact(bmdContact);
        bmd.setBmdPhone(bmdPhone);
        bmd.setBmdAddress(bmdAddress);
        bmd.setBmdMessage(bmdMessage);
        bmd.setPerNumber(perNumber);
        bmd.setPerOrder(perOrder);
        bmd.setMoney(money);
        bmd.setStatus(status);
        bmd.setAdminId(adminId);
        bmd.setYwyId(ywyId == null?0:Integer.parseInt(ywyId));
        bmdService.editBmd(bmd);

        response.sendRedirect("adminBmd.do");
    }

    @RequestMapping("/adminBmdRemove")
    public void adminBmdRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bmdId = Integer.parseInt(request.getParameter("bmdid"));
        bmdService.removeBmd(bmdId);
        response.sendRedirect("adminBmd.do");
    }

    @RequestMapping("/adminSsb")
    public void adminSsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
        request.setAttribute("RACELIST",raceList);
        request.setAttribute("adminId",adminId);
        request.setAttribute("download_type",0);
        request.getRequestDispatcher("../adminssb.jsp").forward(request,response);
    }
    @RequestMapping("/adminSsbLock")
    public void adminSsbLock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        raceService.editLock(raceId);
        response.sendRedirect("adminSsb.do");
    }
    @RequestMapping("/adminSsbToAdd")
    public void adminSsbToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../adminssbadd.jsp").forward(request,response);
    }
    @RequestMapping("/adminSsbAdd")
    public void adminSsbAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String raceName1 = request.getParameter("racename1");
        String raceName2 = request.getParameter("racename2");
        String raceName = raceName1+raceName2;
        String startAge = request.getParameter("startage");
        String endAge = request.getParameter("endage");
        String raceType = request.getParameter("racetype");
        String danceType = request.getParameter("dancetype");
        String startTime = request.getParameter("starttime");
        String endTime = request.getParameter("endtime");
        String startRace = request.getParameter("startrace");
        String money = request.getParameter("money");
        String lockStatus = "未锁定";
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();

        Race race = new Race();
        race.setRaceName(raceName);
        race.setStartAge(startAge);
        race.setEndAge(endAge);
        race.setStartTime(startTime);
        race.setEndTime(endTime);
        race.setStartRace(startRace);
        race.setMoney(money);
        race.setLockStatus(lockStatus);
        race.setAdminId(adminId);
        race.setRaceType(raceType);
        race.setDanceType(danceType);

        raceService.addRace(race);

        response.sendRedirect("adminSsb.do");
    }

    @RequestMapping("/adminSsbToEdit")
    public void adminSsbToEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        Race race = raceService.getRace(raceId);
        request.setAttribute("OBJRACE",race);
        request.getRequestDispatcher("../adminssbedit.jsp").forward(request,response);
    }
    @RequestMapping("/adminSsbEdit")
    public void adminSsbEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        String raceName = request.getParameter("racename");
        String startAge = request.getParameter("startage");
        String endAge = request.getParameter("endage");
        String raceType = request.getParameter("racetype");
        String danceType = request.getParameter("dancetype");
        String startTime = request.getParameter("starttime");
        String endTime = request.getParameter("endtime");
        String startRace = request.getParameter("startrace");
        String money = request.getParameter("money");
        String lockStatus = request.getParameter("lockstatus");
        Integer adminId = Integer.parseInt(request.getParameter("adminid"));

        Race race = new Race();
        race.setRaceId(raceId);
        race.setRaceName(raceName);
        race.setStartAge(startAge);
        race.setEndAge(endAge);
        race.setStartTime(startTime);
        race.setEndTime(endTime);
        race.setStartRace(startRace);
        race.setMoney(money);
        race.setLockStatus(lockStatus);
        race.setAdminId(adminId);
        race.setRaceType(raceType);
        race.setDanceType(danceType);
        race.setLockStatus(lockStatus);
        race.setAdminId(adminId);

        raceService.editRace(race);

        response.sendRedirect("adminSsb.do");
    }
    @RequestMapping("/adminSsbRemove")
    public void adminSsbRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer raceId = Integer.parseInt(request.getParameter("raceid"));
        raceService.removeRace(raceId);
        response.sendRedirect("adminSsb.do");
    }


//    public void adminXsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<User> userList = userService.getAllUser();
//        request.setAttribute("USERLIST",userList);
//        request.getRequestDispatcher("../adminxsb.jsp").forward(request,response);
//    }
    @RequestMapping("/adminXsb")
    public void adminXsb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        request.getRequestDispatcher("../adminxsb.jsp").forward(request,response);
    }

//    public void adminRace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Admin admin = (Admin)session.getAttribute("ADMIN");
//        Integer adminId = (Integer) admin.getAdminId();
//        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
//        request.setAttribute("RACELIST",raceList);
//
//
//
//        List<User> userraceList = userService.getUserByDeleteAndAdminId(adminId);
//        request.setAttribute("USERLIST",userraceList);
//        request.getRequestDispatcher("../adminrace.jsp").forward(request,response);
//    }
    @RequestMapping("/adminRace")
    public void adminRace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
        request.setAttribute("RACELIST",raceList);

        int pageNum = 1;
        int pageSize = 10;
        if (request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("pageSize") != null){
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        PageHelper.startPage(pageNum,pageSize);
        List<User> userraceList = userService.getUserByDeleteAndAdminId(adminId);
        PageInfo<User> pageInfo =new PageInfo<User>(userraceList);
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("../adminrace.jsp").forward(request,response);
    }

//    public void selectRace(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
//        HttpSession session = request.getSession();
//        Admin admin = (Admin)session.getAttribute("ADMIN");
//        Integer adminId = (Integer) admin.getAdminId();
//        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
//        request.setAttribute("RACELIST",raceList);
//
//        String raceProject = request.getParameter("raceProject");
//        if (raceProject == null){
//            request.getRequestDispatcher("../adminrace.jsp").forward(request,response);
//        }
//
//        List<User> userList = userService.getUserByDeleteAndRace(raceProject);
//        request.setAttribute("USERLIST",userList);
//        request.getRequestDispatcher("../adminrace.jsp").forward(request,response);
//    }
    @RequestMapping("/selectRace")
    public void selectRace(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();
        List<Race> raceList = raceService.getAllRaceByAdmin(adminId);
        request.setAttribute("RACELIST",raceList);


        String raceProject = request.getParameter("raceProject");
        int pageNum = 1;
        int pageSize = 10;
        if (request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("pageSize") != null){
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        PageHelper.startPage(pageNum,pageSize);
        List<User> userList = userService.getUserByDeleteAndRace(raceProject);
        PageInfo<User> pageInfo =new PageInfo<User>(userList);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("raceProjectQuery",raceProject);
        request.getRequestDispatcher("../adminrace.jsp").forward(request,response);
    }
    @RequestMapping("/adminRaceToDf")
    public void adminRaceToDf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId=Integer.parseInt(request.getParameter("userid"));
        User user = userService.getUser(userId);
        request.setAttribute("OBJUSER",user);
        String realpath  = request.getSession().getServletContext().getRealPath("");
        request.getRequestDispatcher("../adminracedf.jsp").forward(request,response);
    }
    @RequestMapping("/adminRaceDf")
    public void adminRaceDf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userid"));
        String userAccount = request.getParameter("useraccount");
        String userPwd = request.getParameter("userpwd");
        String boyName = request.getParameter("boyname");
        String girlName =request.getParameter("girlname");
        String userIdCard = request.getParameter("useridcard");
        String raceProject = request.getParameter("raceproject");
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
        user.setUserIdCard(userIdCard);
        user.setCheckStatus(checkStatus);
        user.setRegion(region);
        user.setRaceProject(raceProject);
        user.setGrade(grade);
        user.setDeleteStatus(deleteStatus);
        user.setAdminId(adminId);
        user.setBmdId(bmdId);

        userService.editUser(user);

        response.sendRedirect("adminRace.do");
    }
    @RequestMapping("/adminRaceToDL")
    public void adminRaceToDL(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId=Integer.parseInt(request.getParameter("userid"));
        userService.editDeleteStatus(userId);
        response.sendRedirect("adminRace.do");
    }

    /**
     * 数据导出Excel
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/excelExport", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> excelExport(HttpServletRequest request, HttpServletResponse response,Integer adminId) throws IOException {
        Map<String,Object> data = new HashMap<>();
        String fileName = CommUtil.formatTime("yyyyMMddHHmmss", new Date()) +".xls";
//        Integer adminId= 0;
        if(CommUtil.isNotNull(request.getParameter("adminId"))){
            adminId = Integer.parseInt(request.getParameter("adminId"));
        }
        String columnNames[] = {"组别名称","特色组","舞种","报名时间","报名结束","比赛开始时间","报名费","添加者"};
        String keys[] = {"raceName","raceType","danceType","startTime","endTime","startRace","money","admin"};
        List<Race> allRaceByAdmin = raceService.getAllRaceByAdmin(adminId);
        List<Map<String,Object>> listMap = new ArrayList<>();
        for (Race race:allRaceByAdmin){
            Map<String,Object> map = new HashMap<>();
            map.put("raceName",race.getRaceName()+"("+race.getStartAge()+"-"+race.getEndAge()+"岁)");
            map.put("raceType",race.getRaceType());
            map.put("danceType",race.getDanceType());
            map.put("startTime",race.getStartTime());
            map.put("endTime",race.getEndTime());
            map.put("startRace",race.getStartRace());//未完成
            map.put("money",race.getMoney());
            map.put("admin",race.getAdmin().getAdminAccount());
            listMap.add(map);
        }


        try {
            //创建Workbook
            Workbook wb = ExcelUtil.createWorkBook(listMap, keys, columnNames);
            //保存路径
            String savePath = request.getServletContext().getRealPath("/") + File.separator + fileName;
            // 创建文件流
            OutputStream stream = new FileOutputStream(savePath);
            // 写入数据
            wb.write(stream);
            // 关闭文件流
            stream.close();

            //返回结果
            data.put("code", 1);
            String downloadUrl = request.getScheme() + "://"+request.getServerName() + ":" +
                    request.getServerPort() + "/" + fileName;
//            data.put("download", "D:\\workSpaceIDEA\\hj\\hj_web\\target\\hj_web\\20201029131928.xls");
            data.put("download", downloadUrl);
            File file = new File(savePath);
            if (file.exists()) {
                //设置响应类型，这里是下载xls文件
                response.setContentType("application/xls");
                //设置Content-Disposition，设置attachment，浏览器会激活文件下载框；filename指定下载后默认保存的文件名
                //不设置Content-Disposition的话，文件会在浏览器内打卡，比如txt、img文件
                response.addHeader("Content-Disposition",
                        "attachment; filename=race.xls");
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                // if using Java 7, use try-with-resources
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (IOException ex) {
                    // do something,
                    // probably forward to an Error page
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                        }
                    }
                }
            }
            data.put("message", "文件流输出成功");
//            System.out.println("\n数据导出成功，下载路径：" + downloadUrl);
        } catch (IOException e) {
            System.err.println(e.getMessage());
            data.put("code", -1);
            data.put("message", "下载出错");
            return data;
        }
        return data;
    }

    /**
     * 数据导出ExcelXsb
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/excelExportXsb", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> excelExportXsb(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Admin admin = (Admin)session.getAttribute("ADMIN");
        Integer adminId = (Integer) admin.getAdminId();
        List<User> allUserList = userService.getAllUserByDelete();
        if(allUserList.size() != 0){
            Integer countAllUsers = allUserList.size();//总人数
            Integer countAllGroups = countAllUsers%15 == 0 ?countAllUsers/15:countAllUsers/15 + 1;//总组数,计算选手所在分组
            Integer countAllBatchs = countAllGroups%8 == 0 ?countAllGroups/8:countAllGroups/8 + 1; //总批数,用来计算时间
            List<User> allUserListEdited = new ArrayList<User>();
            Integer groupNo = 1;
            Integer countNo = 1;
            if(allUserList.size() >= 20){
                for(int i = 0; i < allUserList.size(); i ++){
                    User user = allUserList.get(i);
                    if( i % 10 == 0 && i >= 10){
                        groupNo = groupNo + 1;
                    }
                    user.setGroupsNum(groupNo);
                    allUserListEdited.add(user);
                }
            }else if (allUserList.size() >=14){
                int x = allUserList.size()/2;
                for (int i = 0;i < x;i++){
                    User user = allUserList.get(i);
                    user.setGroupsNum(1);
                    allUserListEdited.add(user);
                }
                for (int i = x;i <allUserList.size();i++){
                    User user = allUserList.get(i);
                    user.setGroupsNum(2);
                    allUserListEdited.add(user);
                }
            }else {
                for (int i = 0;i < allUserList.size();i++){
                    User user = allUserList.get(i);
                    user.setGroupsNum(1);
                    allUserListEdited.add(user);
                }
            }
            userService.updateUsersList(allUserListEdited);
        }

        //根据查询赛事导出excel表
        Map<String,Object> data = new HashMap<>();
        String raceProjectQuery = request.getParameter("raceProjectQuery");
        List<User> userList = userService.getUserByDeleteAndRace(raceProjectQuery);
        String fileName = CommUtil.formatTime("yyyyMMddHHmmss", new Date()) +".xls";


        String columnNames[] = {"背号","男选手","女选手","组别名称","比赛开始时间","分组","身份证","区域","成绩","状态"};
        String keys[] = {"userId","boyName","girlName","raceProject","startRace","groupsNum","userIdCard","region","grade","checkStatus"};
        List<Map<String,Object>> listMap = new ArrayList<>();
        for (User user:userList){
            Map<String,Object> map = new HashMap<>();
            map.put("userId",user.getUserId()%100000);
            map.put("boyName",user.getBoyName());
            map.put("girlName",user.getGirlName());
            map.put("raceProject",user.getRaceProject());
            Race race = raceService.getRace(user.getRaceId());
            map.put("startRace",race.getStartRace());
            map.put("groupsNum",user.getGroupsNum());
            map.put("userIdCard",user.getUserIdCard());
            map.put("region",user.getRegion());
            map.put("grade",user.getGrade());
            map.put("checkStatus",user.getCheckStatus());
            listMap.add(map);
        }


        try {
            //创建Workbook
            Workbook wb = ExcelUtil.createWorkBook(listMap, keys, columnNames);
            //保存路径
            String savePath = request.getServletContext().getRealPath("/") + File.separator + fileName;
            // 创建文件流
            OutputStream stream = new FileOutputStream(savePath);
            // 写入数据
            wb.write(stream);
            // 关闭文件流
            stream.close();

            //返回结果
            data.put("code", 1);
            String downloadUrl = request.getScheme() + "://"+request.getServerName() + ":" +
                    request.getServerPort() + "/" + fileName;
//            data.put("download", "D:\\workSpaceIDEA\\hj\\hj_web\\target\\hj_web\\20201029131928.xls");
            data.put("download", downloadUrl);
            File file = new File(savePath);
            if (file.exists()) {
                //设置响应类型，这里是下载xls文件
                response.setContentType("application/xls");
                //设置Content-Disposition，设置attachment，浏览器会激活文件下载框；filename指定下载后默认保存的文件名
                //不设置Content-Disposition的话，文件会在浏览器内打卡，比如txt、img文件
                response.addHeader("Content-Disposition",
                        "attachment; filename=race.xls");
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                // if using Java 7, use try-with-resources
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (IOException ex) {
                    // do something,
                    // probably forward to an Error page
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                        }
                    }
                }
            }
            data.put("message", "文件流输出成功");
//            System.out.println("\n数据导出成功，下载路径：" + downloadUrl);
        } catch (IOException e) {
            System.err.println(e.getMessage());
            data.put("code", -1);
            data.put("message", "下载出错");
            return data;
        }
        return data;
    }



    /**
     * Excel数据导入
     * @param request
     * @param response
     * @param filePro
     * @return
     */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> importExcel(HttpServletRequest request,HttpServletResponse response, String filePro){
        Map<String, Object> map = new HashMap<>();
        String keys[] = {"userId","boyName","girlName","raceProject","startRace","groupsNum","userIdCard","region","grade","checkStatus"};
        try {
            List<Map<String,String>> listData = ExcelUtil.getExcelData(request, "file",keys);
            if(listData.size() == 0){
                map.put("status",-1);
                map.put("message","上传失败，上传数据必须大于一条");
                return map;
            }
            for (Map<String, String> dataMap : listData) {
                    User usert = new User();
                    usert.setRaceProject(dataMap.get(keys[3]));
                    usert.setUserIdCard(dataMap.get(keys[6]));
                    User user = userService.getUserByUserIdCardAndRaceProject(usert);
//                user.setUserId(Integer.parseInt(dataMap.get(keys[0])));
                    user.setBoyName(dataMap.get(keys[1]));
                    user.setGirlName(dataMap.get(keys[2]));
                    user.setRaceProject(dataMap.get(keys[3]));
                    user.setGroupsNum(dataMap.get(keys[5]) == null?0:Integer.parseInt(dataMap.get(keys[5])));
                    user.setUserIdCard(dataMap.get(keys[6]));
                    user.setRegion(dataMap.get(keys[7]));
                    user.setGrade(dataMap.get(keys[8]));
                    user.setCheckStatus(dataMap.get(keys[9]));
                    userService.editUser(user);
            }
            map.put("listData", listData);
            map.put("code", 1);
            map.put("message", "导入成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/adminYwy")
    public void adminYwy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ywy> ywyList = ywyService.getAllYwy();
        request.setAttribute("YWYLIST",ywyList);
        request.getRequestDispatcher("../adminywy.jsp").forward(request,response);
    }
    @RequestMapping("/adminYwyToAdd")
    public void adminYwyToAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../adminywyadd.jsp").forward(request,response);
    }
    @RequestMapping("/adminYwyAdd")
    public void adminYwyAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ywyAccount = request.getParameter("ywyaccount");
        String ywyPwd = request.getParameter("ywypwd");
        String ywyName = request.getParameter("ywyname");
        String idCard = request.getParameter("idcard");
        String phone = request.getParameter("phone");

        boolean isExist = false;
        List<Ywy> ywyList = ywyService.getAllYwy();
        if(ywyList.size() > 0)
            for (Ywy ywy : ywyList){
                if(ywy.getYwyAccount().equals(ywyAccount)) isExist = true;
            }
        if(isExist){
            request.setAttribute("msg","该账户已存在");
            request.getRequestDispatcher("adminYwyToAdd.do").forward(request,response);
        }else {
            Ywy ywy = new Ywy();
            ywy.setYwyAccount(ywyAccount);
            ywy.setYwyPwd(ywyPwd);
            ywy.setYwyName(ywyName);
            ywy.setIdCard(idCard);
            ywy.setPhone(phone);

            ywyService.addYwy(ywy);
            response.sendRedirect("adminYwy.do");

        }
    }
    @RequestMapping("/adminYwyToEdit")
    public void adminYwyToEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer ywyId = Integer.parseInt(request.getParameter("ywyid"));
        Ywy ywy = ywyService.getYwy(ywyId);
        request.setAttribute("OBJYWY",ywy);
        request.getRequestDispatcher("../adminywyedit.jsp").forward(request,response);
    }
    @RequestMapping("/adminYwyEdit")
    public void adminYwyEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer ywyId = Integer.parseInt(request.getParameter("ywyid"));
        String ywyAccount = request.getParameter("ywyaccount");
        String ywyPwd = request.getParameter("ywypwd");
        String ywyName = request.getParameter("ywyname");
        String idCard = request.getParameter("idcard");
        String phone = request.getParameter("phone");

        Ywy ywy = new Ywy();
        ywy.setYwyId(ywyId);
        ywy.setYwyAccount(ywyAccount);
        ywy.setYwyPwd(ywyPwd);
        ywy.setYwyName(ywyName);
        ywy.setIdCard(idCard);
        ywy.setPhone(phone);
        ywyService.editYwy(ywy);

        response.sendRedirect("adminYwy.do");
    }
    @RequestMapping("/removeYwy")
    public void removeYwy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer ywyId = Integer.parseInt(request.getParameter("ywyid"));
        ywyService.removeYwy(ywyId);
        response.sendRedirect("adminYwy.do");
    }
}