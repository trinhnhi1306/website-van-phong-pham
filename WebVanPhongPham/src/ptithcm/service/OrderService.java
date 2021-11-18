package ptithcm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;

import ptithcm.dao.OrderDAO;
import ptithcm.entity.Cart;
import ptithcm.entity.Order;
import ptithcm.entity.OrderDetail;

@Service
@Transactional
public class OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	public PagedListHolder paging(List<Order> list, HttpServletRequest request) {
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);
		return pagedListHolder;
	}
	
	public List<Order> getOrderByUser(int userId)
	{
		return orderDAO.getOrderByUser(userId);
	}
	
	public Order getOrderById(int id)
	{
		return orderDAO.getOrderById(id);
	}
	
	public List<OrderDetail> getOrderDetail(int orderId)
	{
		return orderDAO.getOrderDetail(orderId);
	}
	
	public int addOrder(Order order)
	{
		order.setDate(new java.util.Date());
		return orderDAO.insertOrder(order);
	}
	
	public void addOrderDetail(Order order, List<Cart> cart)
	{
		double price = 0.0;
		for(Cart c : cart) {
			OrderDetail orderDetail = new OrderDetail();
			price = c.getProducts().getPrice() - (c.getProducts().getPrice() * c.getProducts().getDiscount() / 100);
			orderDetail.setOrders(order);
			orderDetail.setProducts(c.getProducts());
			orderDetail.setQuantity(c.getQuantity());
			orderDetail.setItem_price(price);
			orderDAO.insertOrderDetail(orderDetail);
		}
	}
}
