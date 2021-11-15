package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.CartDAO;
import ptithcm.dao.ProductDAO;
import ptithcm.dao.UserDAO;
import ptithcm.entity.Cart;

@Service
@Transactional
public class CartService {
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;
	
	public List<Cart> getCartByUserId(int userId)
	{
		List<Cart> list;
		try
		{
			list = cartDAO.getCart(userId);
		}
		catch (Exception e) {
			e.printStackTrace();
			list = null;
		}
		return list;
	}
	
	public Double getTotalMoney(int userId)
	{
		Double result;
		try
		{
			result = cartDAO.getTotalMoney(userId);
		}
		catch (Exception e) {
			e.printStackTrace();
			result = 0.0;
		}
		return result;
	}
	
	public long getTotalItem(int userId)
	{
		long result;
		try
		{
			result = cartDAO.getTotalItem(userId);
		}
		catch (Exception e) {
			System.out.println("Gio hang khong co san pham");
			//e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	public int addCart(int userId, int productId)
	{
		Cart cart = new Cart();
		cart.setProducts(productDAO.getProductByID(productId));
		cart.setUsers(userDAO.getUserByID(userId));
		cart.setQuantity(1);
		return cartDAO.insertCart(cart);
	}
	
	public int editCart(Cart cart, int quantity)
	{
		cart.setQuantity(quantity);
		return cartDAO.updateCart(cart);
	}

	public Cart getCartByProduct(int userId, int productId) {
		Cart cart;
		try
		{
			cart = cartDAO.getCartByProduct(userId, productId);	
		}
		catch (Exception e) {
			cart = null;
		}
		return cart;
	}
	public int deleteCart(Cart cart)
	{
		
		return cartDAO.deleteCart(cart);
	}
}
