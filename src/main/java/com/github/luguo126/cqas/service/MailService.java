package com.github.luguo126.cqas.service;



import org.springframework.mail.javamail.JavaMailSender;



public interface MailService {
    public void sendSimpleMail(String to, String subject, String content);
    public void sendHtmlMail(String to, String subject, String content);
    // public String sendMail(String text, String subject,
    //                 String location, String emailAdress,
    //                 JavaMailSender javaMailSender, Boolean type);

}
