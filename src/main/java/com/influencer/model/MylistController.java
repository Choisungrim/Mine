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

@Controller
public class MylistController {
	HashMap<String,String> map = new HashMap<>();
	
	@Autowired
	MylistService service;
	@Autowired
	YtubeService yservice;
	
	@RequestMapping(value = "/mylistf")
	public ModelAndView rankf(ModelAndView mv,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			mv.addObject("list",service.selectList((String)session.getAttribute("Login_Id")));
			mv.setViewName("mylist/my_list");
		}
		else
			mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value = "/alllist")
	public ModelAndView alllist(ModelAndView mv,HttpServletRequest request,MylistVO vo
								,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		String str = "";
		List<YtubeVO> result = new ArrayList<>();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			for(int i = 0 ; i<service.selectList((String)session.getAttribute("Login_Id")).size(); i++) {
				str = service.selectList((String)session.getAttribute("Login_Id")).get(i).toString();
				str = str.substring(str.indexOf("name=")+5);
				str = str.substring(0,str.indexOf(","));
				result.addAll(yservice.detail(str));
			}
			mv.addObject("list",result);
			mv.setViewName("jsonView");
		}
		return mv;
	} 
	
	@RequestMapping(value = "/myinsert", method = RequestMethod.POST)
	public ModelAndView myinsert(ModelAndView mv,HttpServletRequest request,MylistVO vo
								 ,HttpServletResponse response
								 ,@RequestParam("insertobj")String name) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("Login_Id") != null) {
			String id = (String)session.getAttribute("Login_Id");
			map.put("id", id);
			map.put("name", name);
			service.myinsert(map);
			mv.setViewName("jsonView");
		}
		return mv;
	} 
}
