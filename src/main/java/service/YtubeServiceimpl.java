package service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.YtubeMapper;
import vo.MemberVO;
import vo.YtubeVO;

@Service
public class YtubeServiceimpl implements YtubeService{
	@Autowired
	YtubeMapper mapper;
	
	@Override
	public int insert(YtubeVO vo) {
		return mapper.insert(vo);
	}
	@Override
	public List<YtubeVO> selectList() {
		return mapper.selectList();
	}
	
	@Override
	public List<YtubeVO> imgOne(String string) {
		return mapper.imgOne(string);
	}
	
	@Override
	public List<YtubeVO> intera(String interest) {
		System.out.println("service" + interest);
		System.out.println(mapper.intera(interest));
		return mapper.intera(interest);
	}
	@Override
	public List<YtubeVO> detail(String string) {
		return mapper.detail(string);
	}
	@Override
	public List<YtubeVO> interlist(HashMap<String,String> map) {
		return mapper.interlist(map);
	}
	
	@Override
	public int countdown(String name) {
		return mapper.countdown(name);
	}
	@Override
	public int countup(String name) {
		return mapper.countup(name);
	}
}
