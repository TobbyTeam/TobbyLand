package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
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

    @RequestMapping(value = {"", "/", "/main"}, method = RequestMethod.GET)
    public String home() {
        return "etc/main";
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("etc/admin");

        return model;
    }

/*    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {

        return "etc/login";

    }*/

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {

        return "etc/login";

    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login2() {

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

    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public ModelAndView top() {

        ModelAndView mav = new ModelAndView("/etc/top");

        mav.addObject("depts", departmentRepository.selectAll());

        return mav;
    }

    @RequestMapping(value = "/paging")
    public String paging() throws Exception{

        return "/etc/paging";
    }

}