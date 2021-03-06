package com.jujumarket.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.order.domain.DeliveryVO;
import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.service.DeliverySerivce;
import com.jujumarket.order.service.OrderMemberService;
import com.jujumarket.order.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor

public class OrderController {
	private OrderService orderService;
	private OrderMemberService orderMemberService;
	private DeliverySerivce deliveryService;
	
	//상품테이블에서 idNo를 get방식으로 넘겨줌
	@GetMapping("/orderItemsForm")
	public void orderItemsForm(@RequestParam("idNo") String idNo, Model model) {
		log.info("orderList");
		//model에 orderList를 담아 주문서(orderItemsForm.jsp)에 출력
		model.addAttribute("orderList", orderService.getOrderResponse(idNo));
		//model에 memberInfo를 담아 주문서(orderItemsForm.jsp)에 출력
		model.addAttribute("memberInfo", orderMemberService.getOrderMemberInfo(idNo));
		//idNo로 최근주문정보 가져오기->deliveryService에서  해당 주문정보 호출
//		model.addAttribute("recentDelivery", deliveryService.get(orderService.getRecentOrderCode(idNo)));

	}

	//orderResult화면을 보여줌
	@GetMapping("/orderResult")
	public void orderResult(@RequestParam("orderCode") String orderCode, Model model) {
		log.info("/orderResult");
		OrderVO order = orderService.get(orderCode);
		String idNo = order.getIdNo();
		OrderMemberVO orderMember = orderMemberService.getOrderMemberInfo(idNo);
		List<OrderResponseVO> itemList = orderService.getOrderResponse(idNo);
		//주문번호로 배송정보를 가져오기
		DeliveryVO delivery = deliveryService.get(orderCode);
		//jsp에서 사용할 요소들을 order, orderMember, itemList, delivery로  이름 줘서 쓰기
		model.addAttribute("order", order);
		model.addAttribute("orderMember", orderMember);
		model.addAttribute("itemList", itemList);
		model.addAttribute("delivery", delivery);
	}

	//orderResult 정보를  t_delivery DB에 insert. orderCode를 기준으로 insert
	@PostMapping("/orderResult")
	public String orderResult(OrderRequestVO order) {
		log.info("orderResult");
		log.info(order);
		String orderCode = orderService.register(order);

		return "redirect:/order/orderResult" + "?orderCode=" + orderCode;
	}

	@PostMapping("/modify")
	public String modify(OrderVO order, RedirectAttributes rttr) {
		log.info("modify: " + order);

		if (orderService.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect: /order/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("orderCode") String orderCode, RedirectAttributes rttr) {
		log.info("remove......" + orderCode);
		if (orderService.remove(orderCode)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/order/list";
	}

}
