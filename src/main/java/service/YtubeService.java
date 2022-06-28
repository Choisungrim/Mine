package service;

import java.util.HashMap;
import java.util.List;

import vo.MemberVO;
import vo.YtubeVO;

public interface YtubeService {
	
	List<YtubeVO> imgOne(String string);
	List<YtubeVO> selectList();
	List<YtubeVO> category(String interest);
	List<YtubeVO> detail (String string);
	List<YtubeVO> interlist (HashMap<String,String> map);
	
	int insert(YtubeVO vo);
	int countup (String name);
	int countdown (String name);
}
