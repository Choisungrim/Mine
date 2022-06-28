package mapperInterface;

import java.util.HashMap;
import java.util.List;

import vo.MylistVO;
import vo.YtubeVO;

public interface MylistMapper {
	List<MylistVO> selectList(String id);
	int myinsert (HashMap<String,String> map);
	int mydelete (HashMap<String,String> map);
	
}
