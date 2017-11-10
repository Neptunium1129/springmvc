package com.cjass.web.member.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public List getAllMember(Map map);
//추상메소드
	public int insertMember(Map map);
	


	public int updateMember(Map map);

	public int deleteMember(Map map);

	public int testTransaction(Map map) throws Exception;
}
