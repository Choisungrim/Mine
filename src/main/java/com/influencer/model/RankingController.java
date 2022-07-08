package com.influencer.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MylistService;
import service.YtubeService;
import vo.MageCriVO;
import vo.MemberVO;
import vo.MylistVO;
import vo.YtubeVO;

/**
 * @author yujunjae
 * @since 22-06-28
 */

@Controller
public class RankingController {
	@Autowired
	YtubeService Yservice;
	@Autowired
	MylistService MYservice;
	
	//rank 페이지 이동시 상위 3개 와 모든 인플루언서의 obj (틀을 그렇게 짜서 이렇게 했어요)
	@RequestMapping(value = "/rankf")
	public ModelAndView rankf(ModelAndView mv,HttpServletRequest request,YtubeVO vo, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			List<MageCriVO> list = new ArrayList<>();
			list.addAll(MYservice.poplevel());
			mv.addObject("ingi",list);		
			mv.addObject("allytuber",Yservice.selectList());
			mv.addObject("oytuber",Yservice.selectList().get(0));
			mv.addObject("tytuber",Yservice.selectList().get(1));
			mv.addObject("hytuber",Yservice.selectList().get(2));
			mv.setViewName("ranking/ranking");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
	
	// 카테고리별 인플루언서 출력 // 모든 인플루언서 출력 시 찜한 상태 확인
	@RequestMapping(value = "/category",method = RequestMethod.GET)
	public ModelAndView category(ModelAndView mv,HttpServletRequest request,MemberVO vo
								 ,HttpServletResponse response
								 ,@RequestParam("value")String value) {
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			List<YtubeVO> list = Yservice.intera(value);
			mv.addObject("intera",list);
			mv.addObject("mylist",MYservice.selectList((String)session.getAttribute("Login_Id")));
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
			mv.addObject("allytuber",Yservice.selectList());
			mv.addObject("mylist",MYservice.selectList((String)session.getAttribute("Login_Id")));
			mv.setViewName("jsonView");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
}
