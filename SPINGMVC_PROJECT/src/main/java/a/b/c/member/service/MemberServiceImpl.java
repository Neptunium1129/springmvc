package a.b.c.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.member.dao.MemberDao;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberdao;


	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int regist(Map map) {
		
		return memberdao.regist(map);
	}

	@Override
	public List select_member() {
		
		return memberdao.select_member();
	}
	@Override
	public List select_member(Map map) {
		
		return memberdao.select_member(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })

	public int delete_member(Map map) {
		
		return memberdao.delete_member(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })

	public int update_member(Map map) {
		
		return memberdao.update_member(map);

	}

	@Override
	public Object get_member_info(Map map) {
		
		return memberdao.get_member_info(map);
	}

	@Override
	public int selectCnt(Map map) {
		return memberdao.selectCnt(map);
	}



	
}
