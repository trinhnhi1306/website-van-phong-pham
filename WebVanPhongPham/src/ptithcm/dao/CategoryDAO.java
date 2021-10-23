package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Category;

@Repository
public class CategoryDAO {

	@Autowired
	SessionFactory factory;
	
	public List<Category> getAllCategories() {
		Session session = factory.getCurrentSession();
		String hql = "from Category";
		Query query = session.createQuery(hql);

		List<Category> list = query.list();
		return list;
	}
	
	public Category getCategoryByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Category where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Category list = (Category) query.list().get(0);
		return list;
	}
	
	public List<Category> searchCategories(String name) {
		Session session = factory.getCurrentSession();
		String hql = "from Category where name like :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");

		List<Category> list = query.list();
		return list;
	}
	
	public int insertCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(category);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int updateCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(category);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int deleteCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(category);
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
