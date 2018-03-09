package com.hk.board.service;

import java.util.List;

import com.hk.board.dtos.HkBoardDto;

public interface IBoardService {

	public List<HkBoardDto> getAllBoard();
	public HkBoardDto getBoard(int seq);
	public boolean insertBoard(HkBoardDto dto);
	public boolean updateBoard(HkBoardDto dto);
	public boolean deleteBoard(int seq);
	
}
