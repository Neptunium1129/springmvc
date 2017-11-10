package com.cjass.web.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cjass.web.member.mybatis.MemberMapper;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	public List getAllMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getAllMember(map);
	}

	public int insertMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertMember(map);
	}
	
	public int insertMemberPLSQL(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertMemberPLSQL(map);
	}

	public int updateMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateMember(map);
	}

	public int deleteMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.deleteMember(map);
	}

}
