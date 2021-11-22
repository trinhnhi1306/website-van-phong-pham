package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.User;

@Repository
public class UserDAO {

	@Autowired
	SessionFactory factory;
	
	public List<User> getAllUsers() {
		Session session = factory.getCurrentSession();
		String hql = "from User";
		Query query = session.createQuery(hql);

		List<User> list = query.list();
		return list;
	}
	
	public User getUserByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from User where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		User list = (User) query.list().get(0);
		return list;
	}
	
	public User getUserByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "from User where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);

		User list = (User) query.list().get(0);
		return list;
	}
	
	public User getUserByEmail(String email) {
		Session session = factory.getCurrentSession();
		String hql = "from User where email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);

		User list = (User) query.list().get(0);
		return list;
	}
	
	public User getUserByPhone(String phone) {
		Session session = factory.getCurrentSession();
		String hql = "from User where phone = :phone";
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);

		User list = (User) query.list().get(0);
		return list;
	}
	
	public User getUserByUsernameAndEmail(String username, String email) {
		Session session = factory.getCurrentSession();
		String hql = "from User where username = :username and email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("email", email);

		User list = (User) query.list().get(0);
		return list;
	}
	
	public List<User> searchUsers(String firstName) {
		Session session = factory.getCurrentSession();
		String hql = "from User where firstName like :firstName";
		Query query = session.createQuery(hql);
		query.setParameter("firstName", "%" + firstName + "%");

		List<User> list = query.list();
		return list;
	}
	
	public int insertUser(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(user);
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
	
	public int updateUser(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(user);
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
	
	public int deleteUser(User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(user);
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
