package  com.github.luguo126.cqas.controller;

import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;


import java.util.UUID;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.luguo126.cqas.service.MailService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.mail.SimpleMailMessage;
// import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailController {

    @Autowired
	private MailService mailService;


    @RequestMapping(value="/retrievePassword", method=RequestMethod.GET)
    @ResponseBody
    public String retrievePassword(HttpServletRequest request, HttpSession session) {
        // String TO_EMAIL = null;

        String to = (String)request.getParameter("email");
        System.out.println(to);
        // String to = "2061286765@qq.com";
        String content = "<h3>找回密码 html格式</h3>";
        // Map map = new HashMap<String ,String >();
        // String msg = "";

        // String secretKey= UUID.randomUUID().toString();  //密钥
        // Timestamp outDate = new Timestamp(System.currentTimeMillis()+30*60*1000);//30分钟后过期
        // long date = outDate.getTime()/1000*1000;                  //忽略毫秒数
        // String key = "gibili"+"$"+date+"$"+secretKey;
        // System.out.println("secretKey: " + secretKey);
        // System.out.println("date: " + date);
        // System.out.println("key: " + key);
        // System.out.println("----: " + DigestUtils.md5Hex(key));

        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

        content = "<a href=" + basePath + "resetPasswordForm.mvc?to=" + to + ">找回密码</a>";
        System.out.println(content);

        session.setAttribute("TO_EMAIL", to);
        mailService.sendHtmlMail(to, "cqas 找回密码", content);

        return "send_mail_success";
    }
}
