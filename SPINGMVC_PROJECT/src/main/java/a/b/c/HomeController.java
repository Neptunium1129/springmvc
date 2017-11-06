package a.b.c;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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

import a.b.c.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		//페이징
		int maxCnt = memberService.selectCnt(map);
		int tPage = maxCnt/2;
		if(0 < maxCnt%2) {
			tPage++;
		}
		
		//Limit
		int sIdx = 0;
		if(map.get("pno")!=null) {
			
			sIdx = (Integer.parseInt((String)map.get("pno"))-1) * 2;
			
		}
		
		map.put("sIdx",sIdx);
		List members = memberService.select_member(map);
		
	
		model.addAttribute("member", members);
		model.addAttribute("name", map.get("name"));
		model.addAttribute("tPage", tPage);

		return "home";
	}
	
}
