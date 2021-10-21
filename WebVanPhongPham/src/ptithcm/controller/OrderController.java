package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class OrderController {

	@RequestMapping("listOrder")
	public String showListOrder() {
		return "admin/order/listOrder";
	}
	
	@RequestMapping("searchOrder")
	public String searchOrder() {
		return "admin/order/listOrder";
	}
}
