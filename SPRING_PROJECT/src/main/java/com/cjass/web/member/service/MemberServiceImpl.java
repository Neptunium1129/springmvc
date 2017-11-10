package com.cjass.web.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cjass.web.member.dao.MemberDao;
import com.cjass.web.util.SHA256;

@Component
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	int result = 0;

	public List getAllMember(Map map) {
		return memberDao.getAllMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertMember(Map map) {
		map.put("password", SHA256.encryptSHA256((String) map.get("password")));
	//	return memberDao.insertMember(map);
		return memberDao.insertMemberPLSQL(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateMember(Map map) {
		map.put("password", SHA256.encryptSHA256((String) map.get("password")));
		return memberDao.updateMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteMember(Map map) {
		return memberDao.deleteMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int testTransaction(Map map) throws Exception {

		try {
			result = memberDao.insertMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("SEQ:" + map.get("seq"));
		if (1 == result) {

			result = memberDao.deleteMember(map);

			if (1 == result) {
				// success!
			} else {
				throw new Exception();
			}

		} else {
			throw new Exception();
		}
		return result;
	}

}
