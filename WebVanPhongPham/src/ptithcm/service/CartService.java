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
		return cartDAO.getCart(userId);
	}
	
	public double getTotalMoney(int userId)
	{
		return cartDAO.getTotalMoney(userId);
	}
	
	public long getTotalItem(int userId)
	{
		return cartDAO.getTotalItem(userId);
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
