package com.mvc.book.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.book.model.dao.MsgDao;
import com.mvc.book.model.dto.FMsgDto;
import com.mvc.book.model.dto.MsgDto;

@Service
public class MsgBizImpl implements MsgBiz{

	@Autowired
	private MsgDao dao;
	
	@Override
	public int insertMsg(Map map) {
		return dao.insertMsg(map);
	}

	@Override
	public List<FMsgDto> selectMsgList(String be_id) {
		return dao.selectMsgList(be_id);
	}

	@Override
	public MsgDto selectMsg(int msg_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMsg(int msg_no) {
		return dao.deleteMsg(msg_no);
	}

	@Override
	public List<FMsgDto> sendMsgList(String be_id) {
		return dao.sendMsgList(be_id);
	}

}
