package com.hk.board.imps;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.board.dtos.HkBoardDto;

@Repository
public class BoardDao implements IBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.board.";

	@Override
	public List<HkBoardDto> getAllBoard() {
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public HkBoardDto getBoard(int seq) {
		return sqlSession.selectOne(namespace+"getBoard",seq);
	}

	@Override
	public boolean insertBoard(HkBoardDto dto) {
		int count=0;
		count=sqlSession.insert(namespace+"insertBoard",dto);
		return count>0? true:false;
	}

	@Override
	public boolean updateBoard(HkBoardDto dto) {
		int count=0;
		count=sqlSession.update(namespace+"updateBoard",dto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteBoard(int seq) {
		int count=0;
		count = sqlSession.delete(namespace+"deleteBoard",seq);
		return count>0?true:false;
	}

}
