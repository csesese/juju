package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface BannerService {
	
	public void register(BannerVO vo);

	public List<BannerVO> getBanner(String bannerType);
	
	public int remove(String imgNo);
	
	public BannerVO get(String imgNo);
	
	public List<ListItemVO> getItemList(ItemCriteria cri);
	
	public ListItemVO getItem(String itemCode);
	
	public void regSeason(ListItemVO vo);
	
	public List<ListItemVO> getSeason();
	
	public int getItemTotal(ItemCriteria cri);
}
