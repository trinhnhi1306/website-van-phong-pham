package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Province;
import ptithcm.bean.ChangedPassword;
import ptithcm.entity.Address;
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
	public String addUser(ModelMap model, @ModelAttribute("user") User user, BindingResult errors, @ModelAttribute("address") Address address, @RequestParam("file") MultipartFile file) {
		if (userService.getUserByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", "user", "Tên người dùng đã được sử dụng!");
		}
		if (user.getUsername().length() > 50) {
			errors.rejectValue("username", "user", "Tên người dùng không được dài quá 50 ký tự!");
		}
		if (user.getLastName().matches(".*\\d+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa số!");
		}
		if (user.getLastName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa ký tự đặc biệt!");
		}
		if (user.getFirstName().matches(".*\\d+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa số!");
		}
		if (user.getFirstName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa ký tự đặc biệt!");
		}
		if (user.getLastName().length() > 100) {
			errors.rejectValue("lastName", "user", "Họ không được dài quá 100 ký tự!");
		}
		if (user.getFirstName().length() > 50) {
			errors.rejectValue("firstName", "user", "Tên không được dài quá 100 ký tự!");
		}
		if (user.getEmail().length() > 100) {
			errors.rejectValue("email", "user", "Email không được dài quá 100 ký tự!");
		}
		if (userService.getUserByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "user", "Email đã được sử dụng!");
		}
		if (!user.getPhone().matches("\\d{10,}")) {
			errors.rejectValue("phone", "user", "Số điện thoại không hợp lệ!");
		}
		if (userService.getUserByPhone(user.getPhone()) != null) {
			errors.rejectValue("phone", "user", "Số điện thoại đã được sử dụng!");
		}
		if(errors.hasErrors())
			return "admin/user/newUser";
		else
		{
			System.out.println(address.getId());
			int resultAddress = addressService.addAddress(address);
			System.out.println(address.getId());
			if(resultAddress == 0) {
				model.addAttribute("message1", "Thêm địa chỉ thất bại");
				return "admin/user/newUser";
			}
			
			Address address1 = addressService.getAddressById(address.getId());
			
			int result = userService.addUser(user, address1, file);
			model.addAttribute("message", result);
		}
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
	public String saveEdit(ModelMap model, @ModelAttribute("user") User user, BindingResult errors, @RequestParam("file") MultipartFile file) {
		User oldUser = userService.getUserByID(user.getId());
		if (userService.getUserByUsername(user.getUsername()) != null && !user.getUsername().equalsIgnoreCase(oldUser.getUsername())) {
			errors.rejectValue("username", "user", "Tên người dùng đã được sử dụng!");
		}
		if (user.getUsername().length() > 50) {
			errors.rejectValue("username", "user", "Tên người dùng không được dài quá 50 ký tự!");
		}
		if (user.getLastName().matches(".*\\d+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa số!");
		}
		if (user.getLastName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa ký tự đặc biệt!");
		}
		if (user.getFirstName().matches(".*\\d+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa số!");
		}
		if (user.getFirstName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa ký tự đặc biệt!");
		}
		if (user.getLastName().length() > 100) {
			errors.rejectValue("lastName", "user", "Họ không được dài quá 100 ký tự!");
		}
		if (user.getFirstName().length() > 50) {
			errors.rejectValue("firstName", "user", "Tên không được dài quá 100 ký tự!");
		}
		if (user.getEmail().length() > 100) {
			errors.rejectValue("email", "user", "Email không được dài quá 100 ký tự!");
		}
		if (userService.getUserByEmail(user.getEmail()) != null && !user.getEmail().equalsIgnoreCase(oldUser.getEmail())) {
			errors.rejectValue("email", "user", "Email đã được sử dụng!");
		}
		if (!user.getPhone().matches("\\d{10,}")) {
			errors.rejectValue("phone", "user", "Số điện thoại không hợp lệ!");
		}
		if (userService.getUserByPhone(user.getPhone()) != null && !user.getPhone().equalsIgnoreCase(oldUser.getPhone())) {
			errors.rejectValue("phone", "user", "Số điện thoại đã được sử dụng!");
		}
		if(errors.hasErrors())
		{
			model.addAttribute("edition", 1);
			return "admin/user/editUser";
		}
		else
		{
			model.addAttribute("edition", 1);
			
			int result = userService.editUser(user, file);
			model.addAttribute("message", result);
		}
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
		
		User admin = (User) session.getAttribute("admin");
		model.addAttribute("user", admin);
		
		Address address = addressService.getAddressById(admin.getAddress().getId());
		System.out.println(address.getId());
		model.addAttribute("address", address);
		
		return "admin/user/editUser";
	}
	
	@RequestMapping(value = "editProfile", method = RequestMethod.POST)
	public String saveMyProfile(HttpSession session, ModelMap model, @ModelAttribute("user") User user, BindingResult errors, @ModelAttribute("address") Address address, @RequestParam("file") MultipartFile file) {
		User oldUser = userService.getUserByID(user.getId());
		if (userService.getUserByUsername(user.getUsername()) != null && !user.getUsername().equalsIgnoreCase(oldUser.getUsername())) {
			errors.rejectValue("username", "user", "Tên người dùng đã được sử dụng!");
		}
		if (user.getUsername().length() > 50) {
			errors.rejectValue("username", "user", "Tên người dùng không được dài quá 50 ký tự!");
		}
		if (user.getLastName().matches(".*\\d+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa số!");
		}
		if (user.getLastName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa ký tự đặc biệt!");
		}
		if (user.getFirstName().matches(".*\\d+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa số!");
		}
		if (user.getFirstName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa ký tự đặc biệt!");
		}
		if (user.getLastName().length() > 100) {
			errors.rejectValue("lastName", "user", "Họ không được dài quá 100 ký tự!");
		}
		if (user.getFirstName().length() > 50) {
			errors.rejectValue("firstName", "user", "Tên không được dài quá 100 ký tự!");
		}
		if (user.getEmail().length() > 100) {
			errors.rejectValue("email", "user", "Email không được dài quá 100 ký tự!");
		}
		if (userService.getUserByEmail(user.getEmail()) != null && !user.getEmail().equalsIgnoreCase(oldUser.getEmail())) {
			errors.rejectValue("email", "user", "Email đã được sử dụng!");
		}
		if (!user.getPhone().matches("\\d{10,}")) {
			errors.rejectValue("phone", "user", "Số điện thoại không hợp lệ!");
		}
		if (userService.getUserByPhone(user.getPhone()) != null && !user.getPhone().equalsIgnoreCase(oldUser.getPhone())) {
			errors.rejectValue("phone", "user", "Số điện thoại đã được sử dụng!");
		}
		if(errors.hasErrors())
		{
			model.addAttribute("edition", 2);
			return "admin/user/editUser";
		}
		else
		{
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
			
			session.setAttribute("admin", userService.getUserByID(user.getId()));
		}
		return "admin/user/editUser";
	}
	
	@RequestMapping("myProfile/changePassword")
	public String changePassword(@ModelAttribute("password") ChangedPassword password) {
		return "admin/user/changePassword";
	}
	
	@RequestMapping(value = "myProfile/changePassword", method = RequestMethod.POST)
	public String savePassword(ModelMap model, @ModelAttribute("password") ChangedPassword password, BindingResult errors, HttpSession session) {
		User oldUser = (User) session.getAttribute("admin");
		if (!BCrypt.checkpw(password.getOldPass(), oldUser.getPassword())) {
			errors.rejectValue("oldPass", "password", "Mật khẩu hiện tại không đúng!");
		}
		if (!password.getConfirmPass().equalsIgnoreCase(password.getNewPass())) {
			errors.rejectValue("confirmPass", "password", "Mật khẩu xác nhận không đúng!");
		}
		
		if(errors.hasErrors())
			return "admin/user/changePassword";
		else
		{
			oldUser.setPassword(BCrypt.hashpw(password.getNewPass(), BCrypt.gensalt(12)));
			int result = userService.updateUser(oldUser);
			if(result == 1)
				session.setAttribute("admin", userService.getUserByID(oldUser.getId()));
			model.addAttribute("message", result);
		}
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
