package ptithcm.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.PermissionDAO;
import ptithcm.entity.Permission;

@Service
@Transactional
public class PermissionService {

	@Autowired
	PermissionDAO permissionDAO;
	
	public Permission getPermissionByID(Integer id) {
		return permissionDAO.getPermissionByID(id);
	}
	
}
