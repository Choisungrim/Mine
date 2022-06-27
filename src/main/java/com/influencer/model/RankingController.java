package com.influencer.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MylistService;
import service.YtubeService;
import vo.MemberVO;
import vo.YtubeVO;

@Controller
public class RankingController {
	@Autowired
	YtubeService yservice;
	@Autowired
	MylistService myservice;
	
	//rank 페이지 이동시 상위 3개 와 모든 인플루언서의 obj (틀을 그렇게 짜서 이렇게 했어요)
	@RequestMapping(value = "/rankf")
	public ModelAndView rankf(ModelAndView mv,HttpServletRequest request,YtubeVO vo, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			mv.addObject("allytuber",yservice.selectList());
			mv.addObject("oytuber",yservice.selectList().get(0));
			mv.addObject("tytuber",yservice.selectList().get(1));
			mv.addObject("hytuber",yservice.selectList().get(2));
			mv.setViewName("ranking/ranking");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
	
	// 카테고리별 인플루언서 출력 // 모든 인플루언서 출력 시 찜한 상태 확인
	@RequestMapping(value = "/category")
	public ModelAndView category(ModelAndView mv,HttpServletRequest request,MemberVO vo
								 ,HttpServletResponse response
								 ,@RequestParam("value")String value) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			mv.addObject("category",yservice.category(value));
			mv.addObject("mylist",myservice.selectList((String)session.getAttribute("Login_Id")));
			mv.setViewName("jsonView");
		}else
			mv.setViewName("member/login");
		return mv;
	}
	
	// 모든 인플루언서 출력 시 찜한 상태 확인
	@RequestMapping(value = "/rankall")
	public ModelAndView rankall(ModelAndView mv,HttpServletRequest request,MemberVO vo, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			mv.addObject("allytuber",yservice.selectList());
			mv.addObject("mylist",myservice.selectList((String)session.getAttribute("Login_Id")));
			mv.setViewName("jsonView");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
}
