package ptithcm.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.dao.ProductDAO;
import ptithcm.entity.Product;

@Service
@Transactional
public class ProductService {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	ImageService imageService;

	@Autowired
	ServletContext context;

	public PagedListHolder paging(List<Product> list, HttpServletRequest request) {
		// Bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
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
	
	public List<Product> getProductsByCategory(int categoryId) {
		return productDAO.getProductsByCategory(categoryId);
	}

	public Product getProductByID(int id) {
		return productDAO.getProductByID(id);
	}

	public int newProduct(Product product, MultipartFile file) {
		String fileName = imageService.uploadFile1(file);
		if (fileName != "0" && fileName != "") {
			product.setImage(fileName);
		} else if (fileName == "0") {
			return 2;
		} else {
			product.setImage("default.png");
		}
		return productDAO.insertProduct(product);
	}

	public int editProduct(Product product, MultipartFile file) {
		String fileName = imageService.uploadFile1(file);
		if (fileName != "0" && fileName != "") {
			product.setImage(fileName);
		} else if (fileName == "0") {
			return 2;
		} else {
			product.setImage("default.png");
		}
		return productDAO.updateProduct(product);
	}

	public int deleteProduct(Product p) {
		return productDAO.deleteProduct(p);
	}

	public List<Product> searchProducts(String name) {
		return productDAO.searchProducts(name);
	}
}
