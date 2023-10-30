package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.ProductDTO;
import com.example.dto.UserDTO;
import com.example.service.CartService;
import com.example.service.ProductService;

@Controller
public class ProductListController {

	@Autowired
	ProductService service;

	@Autowired
	CartService service2;

	@RequestMapping("/productList")
	public String productList() {
		return "productList";
	}
	

	@RequestMapping("/getProductList") 
	public @ResponseBody Map<String, Object> getProductList(HttpSession session, @RequestParam HashMap<Object, Object> filter){
		Map<String, Object> allList = new HashMap<>();
		// 필터값 서비스로 넘겨줌.
		System.out.println("여기다"+filter);
		List<HashMap<String, Object>> productList = new ArrayList<>();
		productList = service.getProductList(filter);
		allList.put("productList", productList);
		
		List<HashMap<String, Object>>getCartList = new ArrayList<>();
		UserDTO Udto = (UserDTO) session.getAttribute("login");
		
		if(Udto != null) {
			filter.put("user_no", Udto.getUser_no());
			getCartList = service2.getCartList(filter);
			allList.put("cartList", getCartList);
		}
		
		return allList;
	}
	
	
	// 테스트중
	@ResponseBody
	@RequestMapping("/adminProductList") 
	public Map<String, Object> adminProductList(HttpSession session, Model mo,@RequestParam HashMap<Object, Object> filter){
//		public List<ProductDTO> adminProductList(HttpSession session, Model mo,@RequestParam HashMap<Object, Object> filter){
		Map<String, Object> data = new HashMap<>();
		
		List<HashMap<String, Object>> productList = new ArrayList<>();
//		List<ProductDTO> productList = new ArrayList<>();
		productList = service.getProductList2();
//		mo.addAttribute("data",productList);
		System.out.println("어드민확인중 : "+productList);
		 
		data.put("data", productList);
		
		
		return data;
	}
	
	@RequestMapping("updateProduct") 
	public @ResponseBody Map<String, Object> updateProduct(@RequestParam HashMap<String, Object> param){
		Map<String, Object> getUserInfo = new HashMap<>();
		int upDate = 0;
		upDate = service.updateProduct(param);
		getUserInfo.put("upDate", upDate);
		return getUserInfo;
	}
	
	@RequestMapping("deleteProduct") 
	public @ResponseBody Map<String, Object> deleteProduct(@RequestParam HashMap<String, Object> param){
		Map<String, Object> getUserInfo = new HashMap<>();
		int deleteVal = 0;
		deleteVal = service.deleteProduct(param);
		getUserInfo.put("deleteVal", deleteVal);
		return getUserInfo;
	}
	
	@RequestMapping("insertProduct") 
	public @ResponseBody Map<String, Object> insertProduct(@RequestParam HashMap<String, Object> param){
		Map<String, Object> getUserInfo = new HashMap<>();
		int insertVal = 0;
		insertVal = service.insertProduct(param);
		getUserInfo.put("insertVal", insertVal);
		return getUserInfo;
	}
	
	@RequestMapping("/newProduct") 
	public @ResponseBody List<HashMap<String, Object>> newProductList(){
		List<HashMap<String, Object>> newProductList = new ArrayList<>();
		newProductList = service.newProductList();
	      
		return newProductList;
	}   
	
}
