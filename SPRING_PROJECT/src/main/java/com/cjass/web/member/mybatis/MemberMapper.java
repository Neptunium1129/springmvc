package com.cjass.web.member.mybatis;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	public List getAllMember(Map map);
	public int insertMember(Map map);
	public int insertMemberPLSQL(Map map);
	public int updateMember(Map map);
	public int deleteMember(Map map);
}
