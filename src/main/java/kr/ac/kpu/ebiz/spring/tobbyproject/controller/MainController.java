package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
         public ModelAndView enabledError() {

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

    @RequestMapping(value = "/test")
    public String test() throws Exception{

        return "test/test";
    }

    @RequestMapping(value = "/paging")
    public String paging() throws Exception{

        return "/etc/paging";
    }

}