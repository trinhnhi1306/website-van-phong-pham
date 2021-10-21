package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class UserController {

	@RequestMapping("listUser")
	public String showListUser() {
		return "admin/user/listUser";
	}
	
	@RequestMapping("detailUser")
	public String showDetailUser() {
		return "admin/user/detailUser";
	}
	
	@RequestMapping("newUser")
	public String newUser() {
		return "admin/user/newUser";
	}
	
	@RequestMapping("editUser")
	public String editUser() {
		return "admin/user/editUser";
	}
	
	@RequestMapping("myProfile")
	public String showMyProfile() {
		return "admin/user/myProfile";
	}
	
	@RequestMapping("myProfile/changePassword")
	public String changePassword() {
		return "admin/user/changePassword";
	}
	
	@RequestMapping("searchUser")
	public String searchUser() {
		return "admin/user/listUser";
	}
}
