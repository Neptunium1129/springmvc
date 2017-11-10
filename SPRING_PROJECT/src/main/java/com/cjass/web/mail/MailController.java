package com.cjass.web.mail;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	private String from = "@gmail.com";
	private String subject = "SPRING_PROJECT";

	@RequestMapping(value = "/mail")
	@ResponseBody
	public String sendMail(@RequestParam Map map) {
		Gson gson = new Gson();
		Map resultMap = new HashMap();

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(map.get("mail").toString());
			messageHelper.setText("Hello World!");
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);

			mailSender.send(message);

			map.put("isSuccess", "Y");

		} catch (Exception e) {
			System.out.println(e);
			map.put("isSuccess", "N");
		}

		return gson.toJson(map);
	}

}