package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

	@RequestMapping("")
	public String showHome() {
		return "user/home";
	}
	
	@RequestMapping("information")
	public String showInform() {
		return "user/information";
	}
	
	@RequestMapping("search")
	public String search() {
		return "user/product";
	}
	
	@RequestMapping("product")
	public String showProduct() {
		return "user/productDetail";
	}
	
	@RequestMapping("cart")
	public String showCart() {
		return "user/cart";
	}
	
	@RequestMapping("checkout")
	public String checkOut() {
		return "user/checkout";
	}
	
	@RequestMapping("shipping")
	public String shipping() {
		return "user/shipping";
	}
	
	@RequestMapping("category")
	public String showCategory() {
		return "user/category";
	}
}
