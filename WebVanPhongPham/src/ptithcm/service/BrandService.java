package ptithcm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import ptithcm.dao.BrandDAO;
import ptithcm.entity.Brand;

@Service
@Transactional
public class BrandService {
	
	@Autowired
	BrandDAO brandDAO;
	
	public PagedListHolder paging(List<Brand> list, HttpServletRequest request) {
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);
		return pagedListHolder;
	}
	
	public List<Brand> getAllBrands() {
		return brandDAO.getAllBrands();
	}
	
	public Brand getBrandByID(int id) {
		
		return brandDAO.getBrandByID(id);
	}
	
	public Brand getBrandByName(String name) {
		Brand brand;
		try
		{
			brand = brandDAO.getBrandByName(name);
		}
		catch (Exception e) {
			brand = null;
		}
		return brand;
	}
	
	public List<Brand> searchBrands(String name) {
		
		return brandDAO.searchBrands(name);
	}
	
	public int addBrand(Brand brand) {
		
		return brandDAO.insertBrand(brand);
	}
	
	public int editBrand(Brand brand) {
		
		return brandDAO.updateBrand(brand);
	}
	
	public int deleteBrand(Brand brand) {
		return brandDAO.deleteBrand(brand);
	}
	
}
