package com.github.luguo126.cqas.service.impl;



import org.springframework.transaction.annotation.Transactional;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.MailException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;
// import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
// import org.springframework.core.io.FileSystemResource;




import com.github.luguo126.cqas.service.MailService;


@Service("mailService")
@Transactional
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private SimpleMailMessage simpleMailMessage;

    // @Value("${mail.username}")
    // private String from;

    // public void setJavaMailSender(JavaMailSender javaMailSender) {
    //     this.javaMailSender = javaMailSender;
    // }

    // public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
    //     this.simpleMailMessage = simpleMailMessage;
    // }


    @Override
    public void sendSimpleMail(String to, String subject, String content) {

        // SimpleMailMessage message = new SimpleMailMessage();
        // message.setFrom(from);
        simpleMailMessage.setTo(to);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(content);

        try {
            System.out.println("from " + simpleMailMessage.getFrom());
            System.out.println("to " + to);
            System.out.println("content " + content);
            javaMailSender.send(simpleMailMessage);
            // logger.info("简单邮件已经发送。");
        } catch (Exception e) {
            // logger.error("发送简单邮件时发生异常！", e);
            e.printStackTrace();
        }

    }

    /**
     * 发送HTML内容格式的邮件
     * @param sendFrom
     * @param sendTo      收件人组
     * @param subject      主题
     * @param htmlContent    HTML内容
     * @throws Exception
     */
    @Override
    public void sendHtmlMail(String to, String subject, String content) {

        // MimeMessageHelper messageHelper = new MimeMessageHelper(
        //                                 this.mimeMessage, true, "UTF-8");
        // messageHelper.setFrom(from);
        // messageHelper.setTo(to);
        // messageHelper.setSubject(subject);
        // messageHelper.setText(html, true);

        // JavaMailSenderImpl sender = new JavaMailSenderImpl();
        // sender.setHost("mail.host.com");

        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);
            helper.setFrom("withtz@163.com");

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);

            javaMailSender.send(message);
        } catch(MailException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
