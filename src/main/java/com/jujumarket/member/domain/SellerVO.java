package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class SellerVO {
	//t_member(NN)
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;

	//t_member(nullable)
	private String pwd;
	private String memAddr;
	private String postCode;
	
	
	//m_shop(NN)
	private String shopName;
	private String shopAddr;
	private String contact1;

	
	//m_shop (nullable)
	private String contact2;
	private String shopPostCode;

	//m_shop_info(NN)
	private String businessCode;
	private String businessRegFile;
	private String bank;
	private String bankAccount;
	private String thumbImg;
	
	//m_shop_info(nullable)
	private String backImg;
}
