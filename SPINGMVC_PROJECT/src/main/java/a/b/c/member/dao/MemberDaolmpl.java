package a.b.c.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import a.b.c.member.sql.MemberMapper;




//@Component
@Repository
public class MemberDaolmpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int regist(Map map) {
		//sql에서 날아오므로 실렉트 외에는 모두 인트로 받는다
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.regist(map);
	}

	@Override
	public List select_member() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.select_member();
	}

	@Override
	public int delete_member(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		return mapper.delete_member(map);
	}

	@Override
	public int update_member(Map map) {

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.update_member(map);
	}

	@Override
	public Object get_member_info(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.get_member_info(map);
	}



	@Override
	public List select_member(Map map) {
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return (List) mapper.select_member(map);
	}

	@Override
	public int selectCnt(Map map) {
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return  mapper.selectCnt(map);
	}



}
