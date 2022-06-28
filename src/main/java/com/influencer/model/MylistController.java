package com.influencer.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MylistService;
import service.YtubeService;
import vo.MylistVO;
import vo.YtubeVO;


/**
 * @author ChoiSungRim
 * @since 22-06-28
 */

@Controller
public class MylistController {
	HashMap<String,String> map = new HashMap<>();
	
	@Autowired
	MylistService MYservice;
	@Autowired
	YtubeService Yservice;
	
	// mylist 페이지 이동 및 object로 선택한 list를 담음
	@RequestMapping(value = "/mylistf")
	public ModelAndView rankf(ModelAndView mv,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			mv.addObject("list",MYservice.selectList((String)session.getAttribute("Login_Id")));
			mv.setViewName("mylist/my_list");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
	
	// 선택한 list들을 가공하여 yservice detail로 정리하여 출력
	@RequestMapping(value = "/alllist")
	public ModelAndView alllist(ModelAndView mv,HttpServletRequest request,MylistVO vo
								,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		String str = "";
		List<YtubeVO> result = new ArrayList<>();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			for(int i = 0 ; i<MYservice.selectList((String)session.getAttribute("Login_Id")).size(); i++) {
				str = MYservice.selectList((String)session.getAttribute("Login_Id")).get(i).toString();
				str = str.substring(str.indexOf("name=")+5);
				str = str.substring(0,str.indexOf(","));
				result.addAll(Yservice.detail(str));
			}
			mv.addObject("list",result);
			mv.setViewName("jsonView");
		}
		return mv;
	}
	@RequestMapping(value = "/interlist")
	public ModelAndView interlist(ModelAndView mv,HttpServletRequest request,MylistVO vo
								  ,HttpServletResponse response
								  ,@RequestParam("val")String val) {
		response.setContentType("text/html; charset=UTF-8");
		HashMap<String,String> map1 = new HashMap<>();
		String str = "";
		List<YtubeVO> result = new ArrayList<>();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			for(int i = 0 ; i<MYservice.selectList((String)session.getAttribute("Login_Id")).size(); i++) {
				str = MYservice.selectList((String)session.getAttribute("Login_Id")).get(i).toString();
				str = str.substring(str.indexOf("name=")+5);
				str = str.substring(0,str.indexOf(","));
				map1.put("name", str);
				map1.put("interest", val);
				result.addAll(Yservice.interlist(map1));
			}
			mv.addObject("list",result);
			mv.setViewName("jsonView");
		}
		return mv;
	}
	
	
	
	// 하트를 선택한 대상의 이름과 세션아이디를 mylist 테이블에 저장. 선택된 ytuber의 good count +1
	@RequestMapping(value = "/myinsert", method = RequestMethod.POST)
	public ModelAndView myinsert(ModelAndView mv,HttpServletRequest request,MylistVO vo
								 ,HttpServletResponse response
								 ,@RequestParam("insertobj")String name) {
		map.clear();
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			String id = (String)session.getAttribute("Login_Id");
			if(Yservice.countup(name)>0) {
				map.put("id", id);
				map.put("name", name);
				MYservice.myinsert(map);
				mv.setViewName("jsonView");
			}
		}
		return mv;
	} 
	
	// 하트를 선택한 대상의 이름과 세션아이디를 mylist 테이블에서 제거. 선택된 ytuber의 good count -1
	@RequestMapping(value = "/mydelete", method = RequestMethod.POST)
	public ModelAndView mydelete(ModelAndView mv,HttpServletRequest request,MylistVO vo
			,HttpServletResponse response
			,@RequestParam("insertobj")String name) {
		map.clear();
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			String id = (String)session.getAttribute("Login_Id");
			if(Yservice.countdown(name)>0) {
				map.put("id", id);
				map.put("name", name);
				MYservice.mydelete(map);
				mv.setViewName("jsonView");
			}
		}
		return mv;
	} 
}
