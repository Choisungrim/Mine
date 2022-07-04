package com.influencer.model;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import service.MylistService;
import service.YtubeService;

@Controller
public class MypageController {

		HashMap<String,String> map = new HashMap<>();
		
		@Autowired
		MemberService Mservice;
		@Autowired
		YtubeService Yservice;
		
		// mylist 페이지 이동 및 object로 선택한 list를 담음
		@RequestMapping(value = "/mypagef")
		public ModelAndView mypagef(ModelAndView mv,HttpServletRequest request) {
			HttpSession session = request.getSession(false);
			if(session != null && session.getAttribute("Login_Id") != null) {
				mv.setViewName("mylist/my_list");
			}
			else
				mv.setViewName("member/login");
			return mv;
		}
}
