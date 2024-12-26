package interceptor;

import com.myx.po.Admin;
import com.myx.po.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin ==null){
            if (user == null) {
                try {
                    response.sendRedirect(request.getContextPath() + "/toLogin");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return false;
            }
        }
        if (user ==null){
            if (admin == null) {
                try {
                    response.sendRedirect(request.getContextPath() + "/toAdminLogin");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return false;
            }
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
