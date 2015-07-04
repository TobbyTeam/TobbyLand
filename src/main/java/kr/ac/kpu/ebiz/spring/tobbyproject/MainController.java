package kr.ac.kpu.ebiz.spring.tobbyproject;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "etc/login";
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("etc/admin");

        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("etc/login");

        return model;

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

    @RequestMapping(value = "/main")
    public String main() {

        return "/etc/main";
    }

    @RequestMapping(value = "/top")
    public String top() {

        return "/etc/top";
    }

    @RequestMapping(value = "/test1")
    public String test1() {

        return "/etc/test";
    }


    @RequestMapping(value = "/test")
    public ModelAndView test(@RequestParam ("msg")String msg) {

        System.out.println(msg+"확인확인확인");

        HashMap<String, String> result = new HashMap<String, String>();
        result.put("msg", msg);
        result.put("result", "true");

        System.out.println(result.toString());

        ModelAndView mav = new ModelAndView();
        mav.addObject("result", result);
        mav.setViewName("jsonView");

        return mav;
    }

}