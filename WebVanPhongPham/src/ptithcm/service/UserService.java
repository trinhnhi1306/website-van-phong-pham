package ptithcm.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadFile;
import ptithcm.dao.UserDAO;
import ptithcm.entity.Address;
import ptithcm.entity.User;

@Service
@Transactional
public class UserService {

	@Autowired
	UserDAO userDAO;
	
	public PagedListHolder paging(List<User> list, HttpServletRequest request) {
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);
		return pagedListHolder;
	}
	
	public List<User> getAllUsers() {
		
		return userDAO.getAllUsers();
	}
	
	public User getUserByID(int id) {
		
		return userDAO.getUserByID(id);
	}
	
	public User getUserByUsername(String username) {
		
		return userDAO.getUserByUsername(username);
	}
	
	public User getUserByUsernameAndEmail(String username, String email) {
		User user;
		try
		{
			user = userDAO.getUserByUsernameAndEmail(username, email);
		}
		catch (Exception e) {
			user = null;
		}
		return user;
	}
	
	public List<User> searchUsers(String name) {
		
		return userDAO.searchUsers(name);
	}
	
	@Autowired
	@Qualifier("uploadfileTrinh")
	UploadFile uploadFile;
	
	public int addUser(User user, Address address, MultipartFile file) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12))); // mã hóa password
		user.setAddress(address);
		user.setStatus(true);
		user.setRegistrationDate(new java.util.Date());
		
		if(file.isEmpty())
			user.setImage("userDefaul.png");
		else {			
			try {	
				String fileName = uploadFile.setFileName(file);
				
	            String filePath = uploadFile.getBasePath() + "/users" + File.separator + fileName;
	            System.out.println(filePath);
	            file.transferTo(new File(filePath));
	            
				user.setImage(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				return 2;		
			}
		}
		
		return userDAO.insertUser(user);
	}
	
	public int editUser(User user, MultipartFile file) {
		
		if(!file.isEmpty()) {			
			try {	
				String fileName = uploadFile.setFileName(file);
				
	            String filePath = uploadFile.getBasePath() + "/users" + File.separator + fileName;
	            System.out.println(filePath);
	            file.transferTo(new File(filePath));
	            
				user.setImage(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				return 2;		
			}
		}
		
		return userDAO.updateUser(user);
	}
	
	public int updateUser(User user) {
		return userDAO.updateUser(user);
	}
	
	public int deleteUser(User user) {
		return userDAO.deleteUser(user);
	}
	
}
