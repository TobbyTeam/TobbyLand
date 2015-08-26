package kr.ac.kpu.ebiz.spring.tobbyproject.security;

import org.springframework.security.access.AccessDeniedException;

import javax.security.sasl.AuthenticationException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by happy on 2015-08-26.
 */
public class AjaxSessionTimeoutFilter implements Filter {

    private String ajaxHeader;

    public void setAjaxHeader(String ajaxHeader) {
        this.ajaxHeader = ajaxHeader;
    }

    public String getAjaxHeader() {
        return ajaxHeader;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        if (isAjaxRequest(req)) {
            try {
                chain.doFilter(req, res);
            } catch (AccessDeniedException e) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
            } catch (AuthenticationException e) {
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            }
        } else {
            chain.doFilter(req, res);
        }
    }

    private boolean isAjaxRequest(HttpServletRequest req) {
        return req.getHeader(ajaxHeader) != null && req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void destroy() {

    }

}
