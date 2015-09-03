package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.PhotoVo;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    DepartmentRepository departmentRepository;

    @Autowired
    BoardService boardService;


    @RequestMapping(value = {"", "/", "/main"}, method = RequestMethod.GET)
    public ModelAndView home() {

        ModelAndView mav = new ModelAndView("/etc/main");

        mav.addObject("sites", boardService.siteService());
        mav.addObject("kpus", boardService.kpuService());
        mav.addObject("latests", boardService.latestService());
        mav.addObject("hots", boardService.hotService());

        return mav;

    }

    @RequestMapping(value = "/top", method = {RequestMethod.GET, RequestMethod.POST })
    public ModelAndView top() {

        ModelAndView mav = new ModelAndView("/etc/top");

        mav.addObject("depts", boardService.topService());

        return mav;
    }

    @RequestMapping(value = "/bottom", method = {RequestMethod.GET, RequestMethod.POST })
    public String bottom() {

        return "/etc/bottom";
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("etc/admin");

        return model;
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST })
    public String login() {

        return "/etc/login";

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();

            model.addObject("username", userDetail.getUsername());

        }

        model.setViewName("etc/403");
        return model;

    }

    @RequestMapping(value = "/500", method = RequestMethod.GET)
         public ModelAndView dbError() {

        ModelAndView mav = new ModelAndView();

        mav.setViewName("etc/error");

        mav.addObject("message1", "500ERROR");
        mav.addObject("message2", "죄송합니다 에러가 발생했습니다. 다시 시도해 주세요.");

        return mav;

    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public ModelAndView noFindError() {

        ModelAndView mav = new ModelAndView();

        mav.setViewName("etc/error");

        mav.addObject("message1", "404ERROR");
        mav.addObject("message2", "페이지가 삭제 되었거나 존재하지 않는 페이지입니다.");

        return mav;

    }

    @RequestMapping(value = "/invalidAccess", method = RequestMethod.GET)
    public ModelAndView invalidAccess() {

        ModelAndView mav = new ModelAndView();

        mav.setViewName("etc/error");

        mav.addObject("message1", "Invalid Access");
        mav.addObject("message2", "잘못된 접근입니다.<br />정상적으로 했는데 이 메세지가 계속 나온다면 관리자에게 문의 해주세요.");

        return mav;

    }

    @RequestMapping(value = "/paging")
    public String paging() throws Exception{

        return "/etc/paging";
    }

    @RequestMapping(value = "/search")
    public String search() throws Exception{

        return "/etc/search";
    }


    //단일파일업로드
    @RequestMapping("/photoUpload")
    public String photoUpload(HttpServletRequest request, PhotoVo vo){
            String callback = vo.getCallback();
            String callback_func = vo.getCallback_func();
            String file_result = "";
            try {
                    if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
                            //파일이 존재하면
                            String original_name = vo.getFiledata().getOriginalFilename();
                            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
                            //파일 기본경로
                            String defaultPath = request.getSession().getServletContext().getRealPath("/");
                            //파일 기본경로 _ 상세경로
                            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;
                            File file = new File(path);
                            System.out.println("path:"+path);
                            //디렉토리 존재하지 않을경우 디렉토리 생성
                            if(!file.exists()) {
                                    file.mkdirs();
                                }
                            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                            String realname = UUID.randomUUID().toString() + "." + ext;
                        ///////////////// 서버에 파일쓰기 /////////////////
                            vo.getFiledata().transferTo(new File(path+realname));
                            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/photo_upload/"+realname;
                        } else {
                            file_result += "&errstr=error";
                        }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            return "redirect:" + callback + "?callback_func="+callback_func+file_result;
    }

    //다중파일업로드
    @RequestMapping("/multiplePhotoUpload")
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
            try {
                     //파일정보
                     String sFileInfo = "";
                     //파일명을 받는다 - 일반 원본파일명
                     String filename = request.getHeader("file-name");
                     //파일 확장자
                     String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
                     //확장자를소문자로 변경
                     filename_ext = filename_ext.toLowerCase();
                     //파일 기본경로
                     String dftFilePath = request.getSession().getServletContext().getRealPath("/");
                     //파일 기본경로 _ 상세경로
                     String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
                     File file = new File(filePath);
                     if(!file.exists()) {
                            file.mkdirs();
                         }
                     String realFileNm = "";
                     SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                     String today= formatter.format(new java.util.Date());
                     realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
                     String rlFileNm = filePath + realFileNm;
                     ///////////////// 서버에 파일쓰기 ///////////////// 
                     InputStream is = request.getInputStream();
                     OutputStream os=new FileOutputStream(rlFileNm);
                     int numRead;
                     byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
                     while((numRead = is.read(b,0,b.length)) != -1){
                            os.write(b,0,numRead);
                         }
                     if(is != null) {
                            is.close();
                         }
                     os.flush();
                     os.close();
                     ///////////////// 서버에 파일쓰기 /////////////////
                     // 정보 출력
                     sFileInfo += "&bNewLine=true";
                     // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
                     sFileInfo += "&sFileName="+ filename;;
                     sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
                     PrintWriter print = response.getWriter();
                     print.print(sFileInfo);
                     print.flush();
                     print.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
    }

}