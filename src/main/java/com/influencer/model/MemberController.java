package com.influencer.model;

import java.util.List;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.FirstnameService;
import service.MemberService;
import service.YtubeService;
import vo.FirstnameVO;
import vo.MemberVO;
import vo.YtubeVO;

/**
 * @author ChoiSungRim, yujunjae
 * @since 22-05-28
 */

@Controller
public class MemberController{
	List<YtubeVO> list = new ArrayList<YtubeVO>();
	@Autowired
	MemberService Mservice;
	@Autowired
	FirstnameService Fservice;
	@Autowired
	YtubeService Yservice;

	
	//interest
	@RequestMapping(value = "/interestCheck",method = RequestMethod.POST)
	public ModelAndView interestCheck(ModelAndView mv) {
		mv.setViewName("member/interestForm");
		return mv;
	} 
		
	// chbox값(관심사)을 받아 member테이블에 업데이트
	int cnt = 0 ;
	@RequestMapping(value = "/interest",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView interest (ModelAndView mv, MemberVO vo, HttpServletRequest request, 
								  @RequestParam(value="valueArrTest[]") List<String> chbox )throws Exception {
		
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		String interest ="";
		HashMap<String,String> map =new HashMap<String,String>();

		map.put("id", id);
		for (int i=0 ; i<chbox.size() ; i++ ) {
			if(i!=chbox.size()-1)
				interest +=chbox.get(i)+",";
			else
				interest +=chbox.get(i);
		}
		map.put("interest",interest);
		Mservice.update(map);
		mv.setViewName("/");
		return mv;
	}
	
	//login
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	} 
	@RequestMapping(value = "/login")
	@ResponseBody
	public ModelAndView login(ModelAndView mv, HttpServletRequest request, RedirectAttributes attr, MemberVO vo, YtubeVO vo1) {
		String password = request.getParameter("pw"); // 입력한 비밀번호
		vo = Mservice.selectOne(vo); // vo에 저장된 비밀번호
		
		if(vo != null) {
			if(vo.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("Login_Id", vo.getId());
				session.setAttribute("Login_Name", vo.getNick_name());
				session.setAttribute("Login_Email", vo.getEmail());
				if(vo.getInterest() != null) {
					session.setAttribute("interest", vo.getInterest());
					List<YtubeVO> imglist = Yservice.imgOne(vo.getInterest());
					if(vo.getInterest().length() >= 3) {
						session.setAttribute("interest", vo.getInterest().substring(0,2));
					}
					//Interest에 따른 Ytube Image 출력 
					mv.addObject("list", imglist);
					mv.setViewName("home");
				}else {
					List<YtubeVO>imglist = Yservice.imgOne("운동");
					mv.addObject("list", imglist);
					mv.setViewName("home");
				}
			}else {
				mv.setViewName("member/login");
			}
		}else { 
			
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	
	//logout control
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv) {
		request.getSession().invalidate();
		List<YtubeVO>imglist = Yservice.imgOne("운동");
		mv.addObject("list", imglist);
		mv.setViewName("home");
		return mv;
	}
	
	// check control
	@RequestMapping(value = "/id_pw_getf")
	public ModelAndView allcheck(HttpServletRequest request, ModelAndView mv, HttpServletResponse response) {
		request.getSession().invalidate();
		mv.setViewName("member/id_pw_get");
		return mv;
	}
	@RequestMapping(value = "/idGet" , method = RequestMethod.POST)
	public ModelAndView idGet(ModelAndView mv, MemberVO vo , 	
							  @RequestParam("email_get") String email,
							  @RequestParam("birthday_get") int birth, 	
							  @RequestParam("color_get") String color) {
		
		HashMap<String,Object>map = new HashMap<>(); // 1:N 매칭을 하기위해서 HashMap 사용 (파라미터값이 N개 이상)
		map.put("email",email);
		map.put("birth",birth);
		map.put("color",color);

		MemberVO id = Mservice.getAll(map);
		mv.addObject(id.getId()); // 아이디찾기
		mv.setViewName("member/idGet");
		return mv;
	}
	@RequestMapping(value = "/pwGet", method = RequestMethod.POST)
	public ModelAndView pwGet(ModelAndView mv, MemberVO vo , 
							  @RequestParam("id_get") String id,
			  				  @RequestParam("birthday_get") int birth, 	
			  				  @RequestParam("color_get") String color) {
		
		HashMap<String,Object>map = new HashMap<>();
		map.put("id",id);
		map.put("birth",birth);
		map.put("color",color);

		MemberVO password = Mservice.getAll(map);
		mv.addObject(password.getPassword()); // 비밀번호찾기
		mv.setViewName("member/pwGet");
		return mv;
	}
	
	
	// join
	@RequestMapping(value = "/joinf", method = RequestMethod.GET)
	public ModelAndView joinf(ModelAndView mv,HttpServletRequest request,MemberVO vo) {
		List<FirstnameVO> nickname = Fservice.givenick();
		mv.addObject("apple", nickname.get(cnt).getNick_name()); // 닉네임 넣어주기
		mv.setViewName("member/join");
		return mv;
		
	}
	
	@RequestMapping(value = "/join" , method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView join (ModelAndView mv, HttpServletRequest request, MemberVO vo)throws Exception {
		HttpSession session = request.getSession();
		vo.setEmail(vo.getEmail().replace("%40","@"));
		List<FirstnameVO>nickname = Fservice.givenick();
		if(Mservice.insert(vo)>0) {
			Fservice.countUpdate(nickname.get(cnt).getNick_name());
			session.setAttribute("id",vo.getId());
			mv.addObject("result",200);
			mv.setViewName("jsonView");
		}else {
			mv.addObject("result",201);
			mv.setViewName("jsonView");
		}
		return mv;
		
	}
	
	// join idCheck
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(HttpServletRequest req,MemberVO vo) throws Exception{
		int result = Mservice.idCheck(vo.getId());//중복아이디 있으면 1, 없으면 0
		return result;
			
	}
	
	@RequestMapping(value = "/catel")
	public ModelAndView catel(ModelAndView mv, HttpServletResponse response,
							  @RequestParam("value")String value) {
		
		response.setContentType("text/html; charset=UTF-8");
		list.clear();
		for(int i = 0; i<3; i++)
		list.add(Yservice.imgOne(value).get(i));
		
		mv.addObject("result",list);
		mv.setViewName("jsonView");
		return mv;
	}

}
