package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Order;
import ptithcm.service.OrderDetailService;
import ptithcm.service.OrderService;

@Controller
@RequestMapping("/admin")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDetailService orderDetailService;

	@RequestMapping("listOrder/{type}")
	public String showListOrder(HttpServletRequest request, ModelMap model, @PathVariable("type") Integer type) {
		
		List<Order> listChoXuLy = orderService.getOrderByStatus(1);
		List<Order> listYeuCauHuy = orderService.getOrderByStatus(2);
		List<Order> listDangGiao = orderService.getOrderByStatus(3);
		List<Order> listDaGiao = orderService.getOrderByStatus(4);
		List<Order> listDaHuy = orderService.getOrderByStatus(5);
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder1 = orderService.pagingManage(listChoXuLy, request, "p1");
		PagedListHolder pagedListHolder2 = orderService.pagingManage(listYeuCauHuy, request, "p2");
		PagedListHolder pagedListHolder3 = orderService.pagingManage(listDangGiao, request, "p3");
		PagedListHolder pagedListHolder4 = orderService.pagingManage(listDaGiao, request, "p4");
		PagedListHolder pagedListHolder5 = orderService.pagingManage(listDaHuy, request, "p5");
	
		model.addAttribute("pagedListHolder1", pagedListHolder1);
		model.addAttribute("pagedListHolder2", pagedListHolder2);
		model.addAttribute("pagedListHolder3", pagedListHolder3);
		model.addAttribute("pagedListHolder4", pagedListHolder4);
		model.addAttribute("pagedListHolder5", pagedListHolder5);
		model.addAttribute("type", type);
		
		return "admin/order/listOrder";
	}
	
	@RequestMapping("acceptOrder")
	public String acceptOrder(HttpServletRequest request, @RequestParam("id") Integer id) {
		
		orderService.acceptOrder(orderService.getOrderById(id));
		orderDetailService.updateSoldQuantityByOrderDetail(orderService.getOrderDetail(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("denyOrder")
	public String denyOrder(HttpServletRequest request, @RequestParam("id") Integer id) {
		
		orderService.denyOrder(orderService.getOrderById(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("acceptCancel")
	public String acceptCancel(HttpServletRequest request, @RequestParam("id") Integer id) {
		
		orderService.denyOrder(orderService.getOrderById(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("denyCancel")
	public String denyCancel(HttpServletRequest request, @RequestParam("id") Integer id) {
		
		orderService.acceptOrder(orderService.getOrderById(id));
		orderDetailService.updateSoldQuantityByOrderDetail(orderService.getOrderDetail(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("searchOrder")
	public String searchOrder() {
		return "admin/order/listOrder";
	}
}
