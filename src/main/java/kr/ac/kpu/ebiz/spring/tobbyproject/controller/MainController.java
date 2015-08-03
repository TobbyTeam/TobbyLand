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

    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public ModelAndView top() {

        ModelAndView mav = new ModelAndView("/etc/top");

        mav.addObject("depts", boardService.topService());

        return mav;
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

        return "etc/login";

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            model.addObject("username", userDetail.getUsername());

        }

        model.setViewName("etc/403");
        return model;

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