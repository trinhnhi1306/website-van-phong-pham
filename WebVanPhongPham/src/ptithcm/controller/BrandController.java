package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Brand;
import ptithcm.service.BrandService;

@Controller
@RequestMapping("/admin")
public class BrandController {
	
	@Autowired
	BrandService brandService;
	
	@RequestMapping("listBrand")
	public String showListBrand(HttpServletRequest request, ModelMap model) {
		
		List<Brand> list = brandService.getAllBrands();
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = brandService.paging(list, request);
	
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/brand/listBrand";
	}
	
	@RequestMapping(value = "newBrand", method = RequestMethod.GET)
	public String newBrand(@ModelAttribute("brand") Brand brand) {	
		return "admin/brand/newBrand";
	}
	
	@RequestMapping(value = "newBrand", method = RequestMethod.POST)
	public String addBrand(ModelMap model, @ModelAttribute("brand") Brand brand, BindingResult errors) {	
		if (brandService.getBrandByName(brand.getName()) != null) {
			errors.rejectValue("name", "brand", "Tên thương hiệu này đã có!");
		}
		if (brand.getName().length() > 100) {
			errors.rejectValue("name", "brand", "Tên thương hiệu không được dài quá 100 ký tự!");
		}
		if (brand.getDescription().length() > 200) {
			errors.rejectValue("description", "brand", "Mô tả không được dài quá 200 ký tự!");
		}
		
		if(errors.hasErrors())
			return "admin/category/newBrand";
		else
		{
			int result = brandService.addBrand(brand);
			model.addAttribute("message", result);
		}	
		
		return "admin/brand/newBrand";
	}
	
	@RequestMapping(value = "editBrand", method = RequestMethod.GET)
	public String editBrand(ModelMap model, @RequestParam("id") Integer id) {
		model.addAttribute("brand", brandService.getBrandByID(id));
		return "admin/brand/editBrand";
	}
	
	@RequestMapping(value = "editBrand", method = RequestMethod.POST)
	public String saveEdit(ModelMap model, @ModelAttribute("brand") Brand brand, BindingResult errors) {
		Brand oldBrand = brandService.getBrandByID(brand.getBrand_id());
		if (brandService.getBrandByName(brand.getName()) != null && !brand.getName().equalsIgnoreCase(oldBrand.getName())) {
			errors.rejectValue("name", "brand", "Tên thương hiệu này đã có!");
		}
		if (brand.getName().length() > 100) {
			errors.rejectValue("name", "brand", "Tên thương hiệu không được dài quá 100 ký tự!");
		}
		if (brand.getDescription().length() > 200) {
			errors.rejectValue("description", "category", "Mô tả không được dài quá 200 ký tự!");
		}
		
		if(errors.hasErrors())
			return "admin/brand/editBrand";
		else
		{
			int result = brandService.editBrand(brand);
			model.addAttribute("message", result);
		}
		
		return "admin/brand/editBrand";
	}
	
	@RequestMapping(value = "deleteBrand", method = RequestMethod.GET)
	public String deleteCategory(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		
		int result = brandService.deleteBrand(brandService.getBrandByID(id));
		model.addAttribute("message", result);
		
		List<Brand> list = brandService.getAllBrands();
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = brandService.paging(list, request);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/brand/listBrand";
	}
	
	@RequestMapping("searchBrand")
	public String searchBrand(HttpServletRequest request, ModelMap model) {
		String name = request.getParameter("searchInput");
		
		
		List<Brand> list = brandService.searchBrands(name);
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = brandService.paging(list, request);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/brand/listBrand";
	}
}
