package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Brand;
import ptithcm.entity.Category;
import ptithcm.entity.Product;
import ptithcm.service.BrandService;
import ptithcm.service.CategoryService;
import ptithcm.service.ProductService;

@Controller
@RequestMapping("/admin")
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;

	@RequestMapping("listProduct")
	public String showListProduct(HttpServletRequest request, ModelMap model) {
		List<Product> products = productService.getAllProducts();
		// Bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = productService.paging(products, request);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product/listProduct";
	}

	@RequestMapping("detailProduct")
	public String showDetailProduct(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		model.addAttribute("product", productService.getProductByID(id));
		return "admin/product/detailProduct";
	}

	@ModelAttribute("categorySel")
	public List<Category> getCategories() {
		List<Category> list = categoryService.getAllCategories();
		return list;
	}

	@ModelAttribute("brandsSel")
	public List<Brand> getBrands() {
		List<Brand> list = brandService.getAllBrands();
		return list;
	}

	@RequestMapping("newProduct")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "admin/product/newProduct";
	}
	
	@RequestMapping(value = "newProduct", method = RequestMethod.POST)
	public String newProduct(ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("file") MultipartFile file) {
		product.setSold_quantity(0);;
		product.setStatus(true);
		
		int result = productService.newProduct(product, file);
		model.addAttribute("message", result);
		return "admin/product/newProduct";
	}

	@RequestMapping(value = "editProduct", method = RequestMethod.GET)
	public String editProduct(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		model.addAttribute("product", productService.getProductByID(id));
		return "admin/product/editProduct";
	}

	@RequestMapping(value = "editProduct", method = RequestMethod.POST)
	public String editProduct(HttpServletRequest request, ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("file") MultipartFile file) {
		int add = Integer.parseInt(request.getParameter("add"));
		
		Product p = productService.getProductByID(product.getId());
		product.setQuantity(p.getQuantity() + add);
		product.setImage(p.getImage());
		product.setCalculation_unit(p.getCalculation_unit());
		product.setSold_quantity(p.getSold_quantity());
		product.setStatus(p.getStatus());
		
		int result = productService.editProduct(product, file);
		model.addAttribute("message", result);
		return "admin/product/editProduct";
	}
	
	@RequestMapping(value = "deleteProduct")
	public String deleteProduct(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		int result = productService.deleteProduct(productService.getProductByID(id));
		model.addAttribute("message", result);
		List<Product> list = productService.getAllProducts();
		PagedListHolder pagedListHolder = productService.paging(list, request);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product/listProduct";
	}

	@RequestMapping(value = "searchProduct", params = "btnsearch")
	public String searchProduct(HttpServletRequest request, ModelMap model) {
		List<Product> products = productService.searchProducts(request.getParameter("searchInput"));
		// Bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = productService.paging(products, request);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product/listProduct";
	}
}
