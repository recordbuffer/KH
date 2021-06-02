package com.mvc.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.book.model.biz.FriendBiz;
import com.mvc.book.model.dto.MemberDto;

@Controller
public class FriendController {

	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);

	@Autowired
	private FriendBiz fbiz;
	
	// [ 친구 검색 ]
		// 회원 검색 페이지로 이동
		@RequestMapping("/fsearch.do")
		public String fsearchpage() {
			logger.info("FRIEND SEARCH PAGE");

			return "friend/fsearchpage";
		}
		
			
		// 회원 검색 페이지 > 검색 결과 페이지로 이동
		@RequestMapping("/fres.do")
		public String fres(HttpServletRequest request,HttpSession session) {
			logger.info("FRIEND SEARCH RES PAGE");

			String searchid = request.getParameter("searchid");
			
			List<MemberDto> list = fbiz.searchMember(searchid);
			request.setAttribute("Searchlist", list);
			
			//친구 상태 확인
			MemberDto user = (MemberDto)session.getAttribute("user");
			String be_id = user.getBe_id();
			
			List<MemberDto> friendList = fbiz.selectFList(be_id);
			request.setAttribute("friendList", friendList);

			return "friend/fsearchpage_res";
		}
		
		
		// 친구 목록 조회
		@RequestMapping(value="/friend.do", method=RequestMethod.GET)
		public String flist(HttpSession session, Model model) {
			logger.info("SEARCH FRIEND LIST");
			
			MemberDto user = (MemberDto)session.getAttribute("user");
			String be_id = user.getBe_id();
			
			List<MemberDto> friendList = fbiz.selectFList(be_id);
			
			model.addAttribute("friendList",friendList);
			
			return "friend/friendpage";		
		}
		
		
		
		/*
		 * // 친구 맺기
		 * 
		 * @RequestMapping(value="insertF.do", method=RequestMethod.POST) public int
		 * insertFriend(HttpSession session,String M2) {
		 * 
		 * MemberDto user = (MemberDto)session.getAttribute("user"); String be_id =
		 * user.getBe_id();
		 * 
		 * int res = fbiz.insertFriend(be_id,M2);
		 * 
		 * 
		 * return 0; }
		 */
		
		// 친구 끊기
		@RequestMapping(value="/deleteF.do")
		public String deleteFriend(HttpSession session, String m2) {
			logger.info("FRIEND DELETE");
			
			MemberDto user = (MemberDto)session.getAttribute("user");
			String m1 = user.getBe_id();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("m1", m1);
			map.put("m2", m2);
			
			
			int res = fbiz.deleteFriend(map);
			
			if(res>0) {
				return "redirect:friend.do";
			} else {
				return "redirect:friend.do";
			}
			
		}
		
}
