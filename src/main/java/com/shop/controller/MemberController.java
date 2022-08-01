package com.shop.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.MemberDTO;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	 @Autowired
	 MemberService memberService;
	 
		@Inject
		BCryptPasswordEncoder pwdEncoder;
	 
		@Autowired
		HttpSession session;

	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String mypage(@RequestParam String id, Model model) throws Exception {
		MemberDTO member = memberService.viewMember(id);
		model.addAttribute("member",member);
		return "member/mypage";
	}
		
	@GetMapping("joinform.do")
	public String joinform() {
		return "member/joinform";
	}
	
	@RequestMapping(value="getMember.do", method = RequestMethod.GET)
	public String getMember(@RequestParam String id, Model model) throws Exception {
		MemberDTO member = memberService.viewMember(id);
		model.addAttribute("member", member);
		return "member/memberRead";
	}
	
	@GetMapping("list.do")
		public String memberList(Model model) throws Exception {
		List<MemberDTO> memberList = memberService.memberList();
		model.addAttribute("memberList", memberList);
		return "member/memberList";
	}
	
	@RequestMapping(value="join.do", method = RequestMethod.POST)
	public String memberWrite(MemberDTO mdto, Model model) throws Exception {
		String mpw = mdto.getPwd();
		String pwd = pwdEncoder.encode(mpw);
		mdto.setPwd(pwd);
		memberService.insertMember(mdto);
		return "redirect:/";
	}
	
	
	@RequestMapping(value="idck.do", method = RequestMethod.GET)
	public String idCheck(@RequestParam String id, Model model, RedirectAttributes rttr) throws Exception {
		int cnt = memberService.idck(id);
		if(cnt==0) {
			model.addAttribute("msg", "가입 가능한 아이디");
			rttr.addFlashAttribute("message", "가입 가능한 아이디");
			model.addAttribute("ck", "ok");
			model.addAttribute("uid", id);
		} else {
			model.addAttribute("msg", "가입 불가능한 아이디");
			rttr.addFlashAttribute("message", "가입 불가능한 아이디");
			model.addAttribute("ck", null);
		}
		return "member/joinform";
	}
	
	@RequestMapping("loginform.do")
	public String memberLoginForm(Model model) throws Exception {
		return "member/loginform";
	}
	
	@RequestMapping(value="signin.do", method = RequestMethod.POST)
	public String memberSignin(@RequestParam String id, @RequestParam String pwd, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		//session.invalidate();
		MemberDTO mdto = new MemberDTO();
		mdto.setPwd(pwd);
		mdto.setId(id);
		//System.out.println("아이디 : "+mdto.getId()+", 패스워드 : "+mdto.getPwd());
		MemberDTO login = null; 
		login = memberService.signin(mdto);
		boolean loginSuccess;
		if(login!=null) {
			loginSuccess = pwdEncoder.matches(mdto.getPwd(),login.getPwd());
			if(loginSuccess) {
				session.setAttribute("member", login);
				session.setAttribute("sid", id);
				return "redirect:/";
			} else {
				return "redirect:loginform.do";
			}
		} else {
			session.setAttribute("member", null);
			session.setAttribute("sid", null);
			return "redirect:loginform.do";
		}
	}		
	
	@RequestMapping("logout.do")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO mdto, Model model) throws Exception {
		memberService.updateMember(mdto);
		return "redirect:/";
	}
	
	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
		memberService.deleteMember(id);
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="pwupdate.do", method = RequestMethod.POST)
	public String memberDelete(String id, String pwd) throws Exception {
		MemberDTO mdto = new MemberDTO();
		mdto.setId(id);
		mdto.setPwd(pwdEncoder.encode(pwd));
		memberService.pwupdate(mdto);		
		return "redirect:getMember.do?id="+mdto.getId();
	}
}