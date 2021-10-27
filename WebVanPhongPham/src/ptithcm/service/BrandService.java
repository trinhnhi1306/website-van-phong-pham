package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.BrandDAO;
import ptithcm.entity.Brand;

@Service
@Transactional
public class BrandService {
	@Autowired
	BrandDAO brandDAO;
	
	public List<Brand> getAllBrands() {
		return brandDAO.getAllBrands();
	}
}
