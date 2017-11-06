package a.b.c.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import a.b.c.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Autowired
	MemberService memberservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/member/registForm", method = RequestMethod.GET)
	public String registForm(Locale locale, Model model, @RequestParam Map map) {
		logger.info("registform");
		
		return "member/registForm";
	}
	
	@RequestMapping(value = "/member/regist", method = RequestMethod.POST)
	public String regist(Locale locale, Model model, @RequestParam Map map, @RequestParam(value="file") MultipartFile file){
		
		System.out.println(map.get("name"));
		System.out.println(map.get("age"));
		System.out.println(map.get("gender"));
		System.out.println(file.getOriginalFilename());
		
		
	
		 try {
				
				String originalFileName = file.getOriginalFilename();
				
				if(originalFileName.equals("")) {
					
					map.put("o_file_name", null);
					map.put("n_file_name", null);
					
				}else {
					 String fName = file.getOriginalFilename().substring(0, originalFileName.lastIndexOf("."));
					 String fType= file.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
					 String newFileName = fName + "_" + System.currentTimeMillis() + fType ;
					 File newFile = new File(fileUploadPath + newFileName);
					file.transferTo(newFile);
					
					map.put("o_file_name", originalFileName);
					map.put("n_file_name", newFileName);
				
				}



			 
			 
			if(1== memberservice.regist(map)) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url" ,"/");
			}else {
				model.addAttribute("success_flag","N");
				model.addAttribute("forward_url","/member/registForm");
			}
				
			
				
		} catch (Exception e) {
		
			e.printStackTrace();
			model.addAttribute("success_flag","N");
			model.addAttribute("forward_url","/member/registForm");
			
			
		}
		
		
		return "common/common_alert";
	}
	
	@RequestMapping(value = "/member/updateForm", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, @RequestParam Map map) {
		
		System.out.println(map.get("seq"));

		
		//Object test= memberservice.get_member_info(map);
		
		model.addAttribute("member",(Map)memberservice.select_member(map).get(0));
		
		return "member/updateForm";
	}
	
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, @RequestParam Map map) {
		
		int update = memberservice.update_member(map);
		 try {
			if(1== update) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url" ,"/");
			}else {
				model.addAttribute("success_flag","N");
				model.addAttribute("forward_url","/");
			}
				
			
				
		} catch (Exception e) {
		
			
			model.addAttribute("success_flag","N");
			model.addAttribute("forward_url","/");
			
			
		}
		
		
		return "common/common_alert";
	
	}
	
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(Locale locale, Model model, @RequestParam Map map) {
		int test = memberservice.delete_member(map);

		 try {
				if(test==1) {
					
					return "1";
				
				}else {

					
					return "2";
				
				}
					
				
					
			} catch (Exception e) {
				logger.error("@@@@", e);
				return "0";
			
				
				
			}
			
			
	}
		
}
