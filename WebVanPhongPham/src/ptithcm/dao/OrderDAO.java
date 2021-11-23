package ptithcm.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Order;
import ptithcm.entity.OrderDetail;
import ptithcm.entity.OrderStatus;

@Repository
public class OrderDAO {
	
	@Autowired
	SessionFactory factory;
	
	public List<Order> getOrderByUser(int userId)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE user.id = :userId";
		Query query = session.createQuery(hql);
		query.setParameter("userId", userId);
		List<Order> list = query.list();
		return list;
	}
	
	public List<Order> getOrderByStatus(int statusId)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE status.id = :statusId";
		Query query = session.createQuery(hql);
		query.setParameter("statusId", statusId);
		List<Order> list = query.list();
		return list;
	}
	
	public List<Order> getOrderByDateAndStatus(Date date, int statusId)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE date = :date and status.id = :statusId";
		Query query = session.createQuery(hql);
		query.setParameter("date", date);
		query.setParameter("statusId", statusId);
		List<Order> list = query.list();
		return list;
	}
	
	public OrderStatus getOrderStatusById(int id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderStatus WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		OrderStatus list = (OrderStatus) query.list().get(0);
		return list;
	}
	
	public Order getOrderById(int id)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Order list = (Order) query.list().get(0);
		return list;
	}
	
	public List<OrderDetail> getOrderDetail(int orderId)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail WHERE orders.id = :orderId";
		Query query = session.createQuery(hql);
		query.setParameter("orderId", orderId);
		List<OrderDetail> list = query.list();
		return list;
	}
	
	public int insertOrder(Order order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(order);
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

	public int insertOrderDetail(OrderDetail orderDetail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(orderDetail);
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
	
	public int updateOrder(Order order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(order);
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
