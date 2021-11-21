package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.service.OrderService;

@Controller
@RequestMapping("/admin/orderDetail")
public class OrderDetailController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("")
	public String denyOrder(ModelMap model, @RequestParam("orderId") Integer id) {
		
		model.addAttribute("order", orderService.getOrderById(id));
		
		model.addAttribute("orderDetail", orderService.getOrderDetail(id));
		return "admin/order/orderDetail";
	}

}
