package ptithcm.controller;

import java.security.Principal;
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

import ptithcm.bean.ChangedPassword;
import ptithcm.entity.Address;
import ptithcm.entity.Cart;
import ptithcm.entity.Category;
import ptithcm.entity.District;
import ptithcm.entity.Order;
import ptithcm.entity.Product;
import ptithcm.entity.Province;
import ptithcm.entity.User;
import ptithcm.entity.Ward;
import ptithcm.entity.Feedback;
import ptithcm.service.AddressService;
import ptithcm.service.CartService;
import ptithcm.service.FeedbackService;
import ptithcm.service.OrderService;
import ptithcm.service.ProductService;
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
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	FeedbackService feedbackService;
	
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
	public String saveUserProfile(HttpSession session, ModelMap model, @ModelAttribute("user") User user, BindingResult errors, @RequestParam("file") MultipartFile file) {
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
			return "user/userProfile";
		
		else
		{
			int result = userService.editUser(user, file);
			
			model.addAttribute("message", result);
			
			session.setAttribute("user", userService.getUserByID(user.getId()));
		}
		return "user/userProfile";
	}
	
	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public String changePassword(@ModelAttribute("password") ChangedPassword password) {
		return "user/changePassword";
	}
	
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public String savePassword(ModelMap model, @ModelAttribute("password") ChangedPassword password, BindingResult errors, HttpSession session) {
		User oldUser = (User) session.getAttribute("user");
		if (!BCrypt.checkpw(password.getOldPass(), oldUser.getPassword())) {
			errors.rejectValue("oldPass", "password", "Mật khẩu hiện tại không đúng!");
		}
		if (BCrypt.checkpw(password.getNewPass(), oldUser.getPassword())) {
			errors.rejectValue("newPass", "password", "Mật khẩu mới trùng với mật khẩu cũ!");
		}
		if (!password.getConfirmPass().equalsIgnoreCase(password.getNewPass())) {
			errors.rejectValue("confirmPass", "password", "Mật khẩu xác nhận không đúng!");
		}
		
		if(errors.hasErrors())
			return "user/changePassword";
		else
		{
			oldUser.setPassword(BCrypt.hashpw(password.getNewPass(), BCrypt.gensalt(12)));
			int result = userService.updateUser(oldUser);
			if(result == 1)
				session.setAttribute("admin", userService.getUserByID(oldUser.getId()));
			model.addAttribute("message", result);
		}
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
	public String addCart(HttpServletRequest request, HttpSession session, @RequestParam("id") Integer id) {
		User user = (User) session.getAttribute("user");
		
		cartService.addCart(user.getId(), id);

		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
		session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
		
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("editCart")
	public String editCart(HttpSession session, @RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
		User user = (User) session.getAttribute("user");
		
		cartService.editCart(cartService.getCartByProduct(user.getId(), id), quantity);
		
		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
		session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
		return "redirect:/user/cart.htm";
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
	
	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String checkOut(@ModelAttribute("order") Order order) {
		return "user/checkout";
	}	
	
	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String saveCheckOut(@ModelAttribute("order") Order order, HttpSession session) {
		int result = orderService.addOrder(order);
		if (result == 1) {
			List<Cart> cart = (List<Cart>) session.getAttribute("cart");
			orderService.addOrderDetail(order, cart);
			cartService.deleteAllCart(cart);
		}
		User user = (User) session.getAttribute("user");
		
		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", 0);
		session.setAttribute("totalMoney", 0.0);
		return "user/success";
	}	
	

	@RequestMapping(value = "shipping", method = RequestMethod.GET)
	public String shipping(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Address address = addressService.getAddressById(user.getAddress().getId());
		model.addAttribute("phone", user.getPhone());
		model.addAttribute("address", address);
		return "user/shipping";
	}
	
	@RequestMapping(value = "shipping", method = RequestMethod.POST)
	public String shipping(HttpSession session, ModelMap model, @ModelAttribute("address") Address address, @RequestParam("phone") String phone) {
		int result1 = addressService.editAddress(address);
		model.addAttribute("message1", result1);
		
		User user = (User) session.getAttribute("user");
		user.setPhone(phone);
		int result2 = userService.updateUser(user);
		model.addAttribute("message2", result2);
		session.setAttribute("user", userService.getUserByID(user.getId()));
		return "redirect:/user/checkout.htm";
	}
	
	@RequestMapping("order")
	public String showOrder(ModelMap model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> list = orderService.getOrderByUser(user.getId());
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = orderService.paging(list, request);
	
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "user/order";
	}
	
	@RequestMapping("orderDetail")
	public String showOrderDetail(ModelMap model, @RequestParam("id") Integer id) {
		model.addAttribute("order", orderService.getOrderById(id));
		model.addAttribute("orderDetail", orderService.getOrderDetail(id));
		return "user/orderDetail";
	}
	
	@RequestMapping("orderDetail/cancelRequest")
	public String cancelRequestCancelOrder(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		int result = orderService.cancelRequest(orderService.getOrderById(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("orderDetail/requestCancel")
	public String requestCancelOrder(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		int result = orderService.requestCancelOrder(orderService.getOrderById(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("orderDetail/receive")
	public String receiveOrder(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		int result = orderService.receiveOrder(orderService.getOrderById(id));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "feedback", method = RequestMethod.GET)
	public String showFormFeedback(HttpSession session, ModelMap model, @RequestParam("productId") Integer productId) {
		User user = (User) session.getAttribute("user");
		Feedback feedback = feedbackService.getFeedbackById(user.getId(), productId);
		if(feedback != null)
		{
			model.addAttribute("message", 1);
		}
		else
		{
			feedback = new Feedback();
			feedback.setUser(user);
			feedback.setProduct(productService.getProductByID(productId));
			model.addAttribute("message", 2);
		}
		model.addAttribute("feedback", feedback);
		return "user/feedback";
	}
	
	@RequestMapping(value = "feedback", method = RequestMethod.POST, params = "btnAdd")
	public String addFeedback(HttpServletRequest request, ModelMap model, @ModelAttribute("feedback") Feedback feedback) {
		int result = feedbackService.addFeedback(feedback);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "feedback", method = RequestMethod.POST, params = "btnEdit")
	public String editFeedback(HttpServletRequest request, ModelMap model, @ModelAttribute("feedback") Feedback feedback) {
		int result = feedbackService.editFeedback(feedback);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "feedback", method = RequestMethod.POST, params = "btnDelete")
	public String deleteFeedback(HttpServletRequest request, ModelMap model, @ModelAttribute("feedback") Feedback feedback) {
		int result = feedbackService.deleteFeedback(feedback);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("success")
	public String orderSuccess() {
		
		return "user/success";
	}
}
