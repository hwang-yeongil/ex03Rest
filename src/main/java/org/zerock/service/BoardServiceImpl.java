package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.BoardMapper;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register__________"+board);
		mapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get____" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("modify_____"+ board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove_____"+ bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		 log.info("get List with critheria: " + cri);
		 return mapper.getListWithPaging(cri);
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		log.info("getList_________");
//		return mapper.getList();
//	}

}
