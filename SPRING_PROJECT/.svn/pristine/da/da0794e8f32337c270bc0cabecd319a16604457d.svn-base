package com.cjass.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.security.PrivateKey;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cjass.web.util.RSA;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Value("${file.upload.path}")
	private String fileUploadPath;

	@Autowired
	private ServletContext context;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView home(Locale locale, HttpSession session) {

		logger.info("Welcome home! The client locale is {}.", locale);

		System.out.println(">>RealPath=" + context.getRealPath(""));

		ModelAndView mav = new ModelAndView("/home");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		mav.setViewName("/home");

		mav.addObject("serverTime", formattedDate);
		mav.addObject("serverTime1", formattedDate);
		mav.addObject("serverTime2", formattedDate);
		mav.addObject("serverTime3", formattedDate);

		RSA rsa = RSA.getEncKey();
		mav.addObject("publicKeyModulus", rsa.getPublicKeyModulus());
		mav.addObject("publicKeyExponent", rsa.getPublicKeyExponent());
		session.setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());

		return mav;
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String ajax(Locale locale, Model model, @RequestParam Map map, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		return gson.toJson(map);
	}

	@RequestMapping(value = "/rsa", method = RequestMethod.POST)
	public String rsa(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request)
			throws Exception {

		String decPW = RSA.decryptRsa((PrivateKey) session.getAttribute("__rsaPrivateKey__"),
				(String) map.get("encPw"));

		model.addAttribute("decPW", decPW);

		return "forward:/";
	}

	@RequestMapping(value = "/enterChat", method = RequestMethod.GET)
	public String enterChat(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request)
			throws Exception {

		model.addAttribute("nick", (String) map.get("nick"));

		return "chat/chat";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String upload(Locale locale, Model model, @RequestParam(value = "file") List<MultipartFile> files)
			throws Exception {

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// String uploadPath =
		// "C:\\workspace_sts\\SPRING_PROJECT\\src\\main\\webapp\\resources\\upload\\";
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			File newFile = new File(fileUploadPath + file.getOriginalFilename());
			file.transferTo(newFile);
			fileName += file.getOriginalFilename() + "|";
			model.addAttribute("originalFileName", fileName);
		}
		return fileName;
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response) throws IOException {

		File file = new File(fileUploadPath + "byte_of_python.pdf");

		if (!file.exists()) {
			String errorMessage = "File Not Exist.";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
		}

		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}

		response.setContentType(mimeType);

		response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

		response.setContentLength((int) file.length());

		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

		FileCopyUtils.copy(inputStream, response.getOutputStream());
	}

}
