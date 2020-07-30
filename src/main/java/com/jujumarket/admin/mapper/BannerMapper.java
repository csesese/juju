package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface BannerMapper {
	
	public void insert(BannerVO vo);
	
	public void insertSelectKey(BannerVO vo);
	
	public List<BannerVO> getBanner(String bannerType);
	
	public int delete(String imgNo);
	
	public BannerVO read(String imgNo);
	
	public List<ListItemVO> getItemList(ItemCriteria cri);
	
	public ListItemVO getItem(String itemCode);
	
	public void regSeason(ListItemVO vo);
	
	public List<ListItemVO> getSeason();

	public int getItemTotal(ItemCriteria cri);
}
