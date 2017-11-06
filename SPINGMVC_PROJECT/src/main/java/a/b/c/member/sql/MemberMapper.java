package a.b.c.member.sql;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	
	public int regist(Map map);

	public List select_member();

	public int delete_member(Map map);
	
	public int update_member(Map map);
	
	public Object get_member_info(Map map);

	public List select_member(Map map);
	
	public int selectCnt(Map map);


}
