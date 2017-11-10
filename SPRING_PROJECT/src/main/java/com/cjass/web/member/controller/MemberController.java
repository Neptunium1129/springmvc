package com.cjass.web.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjass.web.member.service.MemberService;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/member")
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model, @RequestParam Map map) {

		List<HashMap> members = memberService.getAllMember(map);

		model.addAttribute("members", members);
		model.addAttribute("adults",
				members.stream().filter(m -> (int) (m.get("age")) >= 19).collect(Collectors.toList()));

		return "member/member_list";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/jsonList", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String jsonList(HttpServletRequest req, Model model, @RequestParam Map map) {

		List<HashMap> members = memberService.getAllMember(map);

		Gson gson = new Gson();
		return gson.toJson(members);
	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Locale locale, Model model) {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);

		return "member/member_form";
	}


	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req, Locale locale, Model model, @RequestParam Map map) {

		try {
			logger.info("Welcome MemberInsertTest! The client locale is {}.", locale);

			//int count = memberService.testTransaction(map);
			int count = memberService.insertMember(map);

			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");

		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome MemberDetailTest! The client locale is {}.", locale);

		List members = memberService.getAllMember(map);

		model.addAttribute("member", members.get(0));

		return "member/member_detail";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, @RequestParam Map map) {
		try {
			logger.info("Welcome MemberUpdateTest! The client locale is {}.", locale);

			int count = memberService.updateMember(map);

			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");

		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, @RequestParam Map map) {
		try {
			logger.info("Welcome MemberUpdateTest! The client locale is {}.", locale);

			int count = memberService.deleteMember(map);

			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");

		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}

}
