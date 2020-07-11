package com.jujumarket.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.Board_ItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.SortVO;
import com.jujumarket.main.mapper.Board_ItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
 


@Log4j
@Service
@AllArgsConstructor
//@DependsOn(value={"sqlSession"})
public class BoardServiceImpl implements BoardService{
	

//	@Autowired
//	private SqlSession sqlSession;

	@Setter(onMethod_ = @Autowired)
	private Board_ItemMapper mapper;



	
	@Override
	public List<Board_ItemVO> gets(String classCode) {
		log.info("gets...");
	return mapper.gets(classCode);
	}
	
	@Override
	   public List<CategoryVO> category() {
	      log.info("카테고리 체크....");
	      return mapper.category();
	   }
	
	@Override
	public List<Board_ItemVO> getList(Criteria cri) {
		log.info("getList with Criteria"+cri);
		return mapper.getListWithPaging(cri);
	}
	
	//상품 sort해서 조회
	
	@Override public List<Board_ItemVO> listSort(String order) {
	  
	  if(order.equals("best")) {
		  return mapper.bestProduct(order); }
	  
	  else if(order.equals("highP")) { 
		  return mapper.highPrice(order); } 
	  
	  else if(order.equals("lowP")) {
		  return mapper.lowPrice(order); } 
	  
	  else return  mapper.newProduct(order);
	  
	  
	  //return sqlSession.selectList("productSQL.getUserProductList",map);
	  
	  }

}