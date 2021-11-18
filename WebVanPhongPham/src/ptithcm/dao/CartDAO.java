package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Cart;

@Repository
public class CartDAO {

	@Autowired
	SessionFactory factory;

	public List<Cart> getCart(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "from Cart where users.id = :id";
		Query query = session.createQuery(hql);

		query.setParameter("id", userId);
		List<Cart> list = query.list();
		return list;
	}
	
	public Cart getCartByProduct(int userId, int productId) {
		Session session = factory.getCurrentSession();
		String hql = "from Cart where users.id = :userId and products.id = :productId";
		Query query = session.createQuery(hql);

		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		Cart list = (Cart) query.list().get(0);
		return list;
	}

	public double getTotalMoney(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "select sum(quantity*(products.price - products.price*products.discount/100)) from Cart where users.id = :id";
		Query query = session.createQuery(hql);

		query.setParameter("id", userId);
		if(query.list().get(0) != null)
			return (double) query.list().get(0);
		
		return 0.0;
	}
	
	public long getTotalItem(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "select sum(quantity) from Cart where users.id = :id";
		Query query = session.createQuery(hql);
		System.out.println(userId);
		query.setParameter("id", userId);
		if(query.list().get(0) != null)
			return (long) query.list().get(0);
		
		return 0;
	}

	public int insertCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int updateCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int deleteCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(cart);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

}
