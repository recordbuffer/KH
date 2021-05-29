package com.mvc.book.model.biz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mvc.book.model.dao.MemberDao;
import com.mvc.book.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{//로긴 넘겨준다고 다오로 연결
    @Autowired
    private MemberDao dao;
	
	@Override
	public int memberJoinMethod(MemberDto dto) {
		return dao.memberJoinMethod(dto);
	}

	@Override
	public int Idcheck(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.Idcheck(dto);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public String get_searchId(String be_name, String be_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void mailSendWithPW(String be_id, String be_email, HttpServletRequest reqeust) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String updateGET(HttpSession session, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMember(String be_id, String be_pw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String loginCheck(MemberDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String level(MemberDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String forced_Admin(String be_id, String be_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto getMemberInfo(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.selectMemberInfo(dto);
	}

	@Override
	public int modifyMemberInfo(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.updateMemberInfo(dto);
	}

}
