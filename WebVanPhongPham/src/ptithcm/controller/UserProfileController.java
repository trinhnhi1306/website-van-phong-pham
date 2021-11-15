package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Address;
import ptithcm.entity.Cart;
import ptithcm.entity.District;
import ptithcm.entity.Province;
import ptithcm.entity.User;
import ptithcm.entity.Ward;
import ptithcm.service.AddressService;
import ptithcm.service.CartService;
import ptithcm.service.UserService;

@Controller
@RequestMapping("/user")
public class UserProfileController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	CartService cartService;
	
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

	@RequestMapping(value = "userProfile", method = RequestMethod.GET)
	public String showUserProfile(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/userProfile";
	}
	
	@RequestMapping(value = "userProfile", method = RequestMethod.POST)
	public String saveUserProfile(HttpSession session, ModelMap model, @ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {
		
		int result = userService.editUser(user, file);
		
		model.addAttribute("message", result);
		
		session.setAttribute("user", userService.getUserByID(user.getId()));
		return "user/userProfile";
	}
	
	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public String changePassword() {
		return "user/changePassword";
	}
	
	@RequestMapping("address")
	public String showAddress() {
		return "user/address";
	}
	
	@RequestMapping(value = "changeAddress", method = RequestMethod.GET)
	public String changeAddress(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Address address = addressService.getAddressById(user.getAddress().getId());
		model.addAttribute("address", address);
		return "user/changeAddress";
	}
	
	@RequestMapping(value = "changeAddress", method = RequestMethod.POST)
	public String saveAddress(HttpSession session, ModelMap model, @ModelAttribute("address") Address address) {
		int result = addressService.editAddress(address);
		model.addAttribute("message", result);
		
		User user = (User) session.getAttribute("user");
		session.setAttribute("user", userService.getUserByID(user.getId()));
		return "user/changeAddress";
	}
	
	@RequestMapping("addCart")
	public String addCart(HttpSession session, @RequestParam("id") Integer id) {
		User user = (User) session.getAttribute("user");
		
		cartService.addCart(user.getId(), id);

		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
		session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
		
		return "redirect:/home/product.htm?id=" + id;
	}
	
	@RequestMapping("deleteCart")
	public String deleteCart(HttpSession session, @RequestParam("id") Integer id) {
		User user = (User) session.getAttribute("user");
		
		cartService.deleteCart(cartService.getCartByProduct(user.getId(), id));
		
		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
		session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
		return "redirect:/user/cart.htm";
	}
	
	@RequestMapping("cart")
	public String showCart() {
		return "user/cart";
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
