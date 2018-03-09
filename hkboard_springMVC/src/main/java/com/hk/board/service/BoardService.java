package com.hk.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.board.dtos.HkBoardDto;
import com.hk.board.imps.IBoardDao;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardDao boardDaoImp;
	
	@Override
	public List<HkBoardDto> getAllBoard() {
		return boardDaoImp.getAllBoard();
	}

	@Override
	public HkBoardDto getBoard(int seq) {
		return boardDaoImp.getBoard(seq);
	}

	@Override
	public boolean insertBoard(HkBoardDto dto) {
		return boardDaoImp.insertBoard(dto);
	}

	@Override
	public boolean updateBoard(HkBoardDto dto) {
		return boardDaoImp.updateBoard(dto);
	}

	@Override
	public boolean deleteBoard(int seq) {
		return boardDaoImp.deleteBoard(seq);
	}

}
