package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.ProductDAO;
import ptithcm.entity.OrderDetail;
import ptithcm.entity.Product;

@Service
@Transactional
public class OrderDetailService {
	
	@Autowired
	ProductDAO productDAO;
	
	public void updateSoldQuantityByOrderDetail(List<OrderDetail> orderDetail)
	{
		for(OrderDetail item : orderDetail)
		{
			Product product = item.getProducts();
			product.setSold_quantity(product.getSold_quantity() + item.getQuantity());
			productDAO.updateProduct(product);
		}
	}

}
