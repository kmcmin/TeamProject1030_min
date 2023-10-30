package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.OrderDTO;
import com.example.service.OrderService;

@Controller
public class AdminOrderController {
	@Autowired
	OrderService service;
	
	@RequestMapping("/admin/delivery")
	public String delivery() {
		return "ADMIN/delivery";
	}
	@PostMapping("/admin/OrderList")
	@ResponseBody
	public List<OrderDTO> adminOrderList() {
		List<OrderDTO> data = service.orderListAll();
		
		return data;
	}
	@PostMapping("/admin/DeliveryDone")
	@ResponseBody
	public String adminDeliveryDone(int order_no) {
		//주문테이블 배송정보 수정
		service.orderUpdate(order_no);
		String order_sta = service.selectSta(order_no);
		return order_sta;
	}
	//사용자가 관리자 페이지에 접근한 경우
	@RequestMapping("/access-denied")
	public String adminAccess() {
		return "access-denied";
	}
}
