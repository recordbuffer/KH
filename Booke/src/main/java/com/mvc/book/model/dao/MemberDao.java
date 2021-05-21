
package com.mvc.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.mvc.book.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "mybooke.";
			// [ 회원기능 ]
		// 회원가입
		public int memberJoinMethod(MemberDto dto);
		// 회원가입_아이디중복체크
		public int Idcheck(String be_id);
		 int result = sql.selectOne("signuppage_idchk", dto);
			return result;
		}
		
		// 로그인
		public MemberDto login(MemberDto dto);
		// 로그인 아이디 찾기
		public String get_searchId(String be_name, String be_email);
		// 로그인 비밀번호 찾기
		public void mailSendWithPW(String be_id, String be_email, HttpServletRequest reqeust);
		// 회원 정보 수정
		public String updateGET(HttpSession session, Model model);
		// 회원 탈퇴
		public int deleteMember(String be_id, String be_pw);
		//[ 관리자 기능 ]
		// 회원 정보 조회
		public String loginCheck(MemberDto dto);
		// 회원 등급 조정
		public String level(MemberDto dto);
		// 회원 강제 탈퇴
		public String forced_Admin(String be_id, String be_pw);
}