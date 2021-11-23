package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Brand;

@Repository
public class BrandDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Brand> getAllBrands() {
		Session session = factory.getCurrentSession();
		String hql = "from Brand";
		Query query = session.createQuery(hql);
		List<Brand> list = query.list();
		return list;
	}
	
	public Brand getBrandByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Brand where brand_id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Brand list = (Brand) query.list().get(0);
		return list;
	}
	
	public Brand getBrandByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "from Brand where name = :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", name);

		Brand list = (Brand) query.list().get(0);
		return list;
	}
	
	public List<Brand> searchBrands(String name) {
		Session session = factory.getCurrentSession();
		String hql = "from Brand where name like :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");

		List<Brand> list = query.list();
		return list;
	}
	
	public int insertBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(brand);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int updateBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(brand);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int deleteBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(brand);
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
