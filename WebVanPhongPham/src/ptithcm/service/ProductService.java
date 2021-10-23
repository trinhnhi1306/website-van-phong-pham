package ptithcm.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;

import ptithcm.dao.ProductDAO;
import ptithcm.entity.Product;

@Service
@Transactional
public class ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ServletContext context;
	
	public PagedListHolder paging(List<Product> list, HttpServletRequest request) {
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);
		return pagedListHolder;
	}
	
	public List<Product> getAllProducts() {
		
		return productDAO.getAllProducts();
	}
	
	public Product getProductByID(int id) {
		
		return productDAO.getProductByID(id);
	}
}
