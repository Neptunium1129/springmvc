package a.b.c.member.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	public int regist(Map map);

	public List select_member();
	
	public int delete_member(Map map);

	public int update_member(Map map);

	public Object get_member_info(Map map);

}
