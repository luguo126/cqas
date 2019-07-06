package  com.github.luguo126.cqas.controller;



import com.github.luguo126.cqas.domain.Question;
import com.github.luguo126.cqas.domain.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


// import org.springframework.ui.ModelMap;
// import org.springframework.web.bind.annotation.RequestParam;

// import  com.github.luguo126.cqas.domain.User;



@Controller
public class AdminPageController {

    @RequestMapping(value = "/admin_board")
    public ModelAndView admin_board() {
            return new ModelAndView("admin_board");
    }

    // new ModelAndView("admin_registerForm", "admin", new Admin())
    // Neither BindingResult nor plain target object for bean name 'admin' available as request attribute
    @RequestMapping(value = "/admin_registerForm")
    public ModelAndView admin_registerForm() {
            return new ModelAndView("admin_registerForm", "admin", new Admin());
    }

    @RequestMapping(value = "/admin_loginForm")
    public ModelAndView admin_loginForm() {
            return new ModelAndView("admin_loginForm", "admin", new Admin() );
    }

}
