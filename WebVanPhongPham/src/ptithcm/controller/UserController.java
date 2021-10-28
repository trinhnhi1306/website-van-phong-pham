package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Province;
import ptithcm.entity.Address;
import ptithcm.entity.Category;
import ptithcm.entity.District;
import ptithcm.entity.Ward;
import ptithcm.entity.User;
import ptithcm.service.AddressService;
import ptithcm.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	AddressService addressService;
	
	@ModelAttribute("provinces")
	public List<Province> getProvinces() {
		return addressService.getAllProvinces();
	}
	
	@ModelAttribute("districts")
	public List<District> getDistricts() {
		return addressService.getAllDistricts();
	}
	
	@ModelAttribute("wards")
	public List<Ward> getWards() {
		return addressService.getAllWards();
	}
	
	@RequestMapping("listUser")
	public String showListUser(HttpServletRequest request, ModelMap model) {
		
		List<User> list = userService.getAllUsers();
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = userService.paging(list, request);
	
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/user/listUser";
	}
	
	@RequestMapping("detailUser")
	public String showDetailUser(ModelMap model, @RequestParam("id") Integer id) {
		
		model.addAttribute("user", userService.getUserByID(id));
		
		return "admin/user/detailUser";
	}
	
	@RequestMapping(value = "newUser", method = RequestMethod.GET)
	public String newUser(@ModelAttribute("user") User user, @ModelAttribute("address") Address address) {
		
		return "admin/user/newUser";
	}
	
	@RequestMapping(value = "newUser", method = RequestMethod.POST)
	public String addUser(ModelMap model, @ModelAttribute("user") User user, @ModelAttribute("address") Address address, @RequestParam("file") MultipartFile file) {
		
		int resultAddress = addressService.addAddress(address);
		if(resultAddress == 0) {
			model.addAttribute("message1", "Thêm địa chỉ thất bại");
			return "admin/user/newUser";
		}
		
		Address address1 = addressService.getAddressById(address.getId());
		
		int result = userService.addUser(user, address1, file);
		model.addAttribute("message", result);
		
		return "admin/user/newUser";
	}
	
	@RequestMapping(value = "editUser", method = RequestMethod.GET)
	public String editUser(ModelMap model, @RequestParam("id") Integer id) {
		
		model.addAttribute("edition", 1);
		
		User user = userService.getUserByID(id);
		model.addAttribute("user", user);
		
		return "admin/user/editUser";
	}
	
	@RequestMapping(value = "editUser", method = RequestMethod.POST)
	public String saveEdit(ModelMap model, @ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {
		
		model.addAttribute("edition", 1);
		
		int result = userService.editUser(user, file);
		model.addAttribute("message", result);
		
		return "admin/user/editUser";
	}
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		
		int result = userService.deleteUser(userService.getUserByID(id));
		model.addAttribute("message", result);
		
		List<User> list = userService.getAllUsers();
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = userService.paging(list, request);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/user/listUser";
	}
	
	@RequestMapping("myProfile")
	public String showMyProfile() {
		return "admin/user/myProfile";
	}
	
	@RequestMapping("editProfile")
	public String editMyProfile(HttpSession session, ModelMap model) {
		
		model.addAttribute("edition", 2);
		
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		
		Address address = addressService.getAddressById(user.getAddress().getId());
		System.out.println(address.getId());
		model.addAttribute("address", address);
		
		return "admin/user/editUser";
	}
	
	@RequestMapping(value = "editProfile", method = RequestMethod.POST)
	public String saveMyProfile(ModelMap model, @ModelAttribute("user") User user, @ModelAttribute("address") Address address, @RequestParam("file") MultipartFile file) {
		
		model.addAttribute("edition", 2);
		
		address.setId(user.getAddress().getId());
		System.out.println(address.getId());
		
		int resultAddress = addressService.editAddress(address);
		if(resultAddress == 0) {
			model.addAttribute("message1", "Sửa địa chỉ thất bại");
			return "admin/user/editUser";
		}
		
		int result = userService.editUser(user, file);
		model.addAttribute("message", result);
		
		return "admin/user/editUser";
	}
	
	@RequestMapping("myProfile/changePassword")
	public String changePassword() {
		return "admin/user/changePassword";
	}
	
	@RequestMapping("searchUser")
	public String searchUser(HttpServletRequest request, ModelMap model) {
		
		String name = request.getParameter("searchInput");
		
		List<User> list = userService.searchUsers(name);
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = userService.paging(list, request);
	
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/user/listUser";
	}
}
