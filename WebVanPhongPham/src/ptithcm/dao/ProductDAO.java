package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Product;

@Repository
public class ProductDAO {
	
	@Autowired
	SessionFactory factory;
	
	public List<Product> getAllProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE status = 1";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	public Product getProductByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Product list = (Product) query.list().get(0);
		return list;
	}
	
	public Integer insertProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(p);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer updateProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(p);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer deleteProduct(Product p) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			p.setStatus(false);
			session.update(p);
			//session.delete(p);
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
	
	public List<Product> searchProducts(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE name LIKE :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		List<Product> list = query.list();
		return list;
	}

}
