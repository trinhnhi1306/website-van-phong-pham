package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Address;
import ptithcm.entity.District;
import ptithcm.entity.Province;
import ptithcm.entity.Ward;

@Repository
public class AddressDAO {

	@Autowired
	SessionFactory factory;
	
	public List<Province> getAllProvinces() {
		Session session = factory.getCurrentSession();
		String hql = "from Province";
		Query query = session.createQuery(hql);

		List<Province> list = query.list();
		return list;
	}
	
	public List<District> getAllDistricts() {
		Session session = factory.getCurrentSession();
		String hql = "from District";
		Query query = session.createQuery(hql);

		List<District> list = query.list();
		return list;
	}
	
	public List<Ward> getAllWards() {
		Session session = factory.getCurrentSession();
		String hql = "from Ward";
		Query query = session.createQuery(hql);

		List<Ward> list = query.list();
		return list;
	}
	
	public List<District> getDistricts(int provinceId) {
		Session session = factory.getCurrentSession();
		String hql = "from District where province.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", provinceId);

		List<District> list = query.list();
		return list;
	}
	
	public List<Ward> getWards(int districtId) {
		Session session = factory.getCurrentSession();
		String hql = "from Ward where district.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", districtId);

		List<Ward> list = query.list();
		return list;
	}
	
	public Address getAddressById(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Address where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Address list = (Address) query.list().get(0);
		return list;
	}
	
	public int insertAddress(Address address) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(address);
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
	
	public int updateAddress(Address address) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(address);
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
