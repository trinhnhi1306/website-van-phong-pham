package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserProfileController {

	@RequestMapping("userProfile")
	public String showUserProfile() {
		return "user/userProfile";
	}
	
	@RequestMapping("changePassword")
	public String changePassword() {
		return "user/changePassword";
	}
	
	@RequestMapping("address")
	public String showAddress() {
		return "user/address";
	}
	
	@RequestMapping("changeAddress")
	public String changeAddress() {
		return "user/changeAddress";
	}
	
	@RequestMapping("order")
	public String showOrder() {
		return "user/order";
	}
	
	@RequestMapping("orderDetail")
	public String showOrderDetail() {
		return "user/orderDetail";
	}
	
	@RequestMapping("feedback")
	public String showFormFeedback() {
		return "user/feedback";
	}
}
