package com.jujumarket.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jujumarket.main.domain.ItemMainVO;

public interface ItemMainMapper {
	
//	@Select("select * from t_item")
	public List<ItemMainVO> getList();

	public void insert(ItemMainVO item);
	
	public void insertSelectKey(ItemMainVO item);
	
	public ItemMainVO get(String ItemCode);
	
	public int delete(String ItemCode);
	
	public int update(ItemMainVO item);
	
}
