package ptithcm.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.Mailer;
import ptithcm.bean.Password;
import ptithcm.entity.User;
import ptithcm.service.UserService;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	Password password;
	
	@Autowired
	Mailer mailer;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword(@ModelAttribute("user") User user) {
		return "account/forgotPass";
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public String resetPassword(ModelMap model, @ModelAttribute("user") User user) {
		User findUser = userService.getUserByUsernameAndEmail(user.getUsername(), user.getEmail());
		if(findUser == null)
		{
			model.addAttribute("error", "Tài khoản không tồn tại");
			return "account/forgotPass";
		}
		String newPass = password.randomPassword();
		mailer.sendPassword(newPass, findUser.getEmail());
		
		findUser.setPassword(BCrypt.hashpw(newPass, BCrypt.gensalt(12)));
		userService.updateUser(findUser);
		return "account/changePassSuccess";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword() {
		return "account/changePassSuccess";
	}
	
}
