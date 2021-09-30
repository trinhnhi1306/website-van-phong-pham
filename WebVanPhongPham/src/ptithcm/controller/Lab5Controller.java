package ptithcm.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.Mailer;
import ptithcm.bean.UploadFile;
import ptithcm.bean.User;
import ptithcm.model.Mail;

@Controller
@RequestMapping("/lab5")
public class Lab5Controller {
	
	//===========Demo 1===========
	@Autowired
	User user;

	@RequestMapping("/demo1")
	public String demo1() {
		return "lab5/demo1";
	}

	@ModelAttribute("user")
	public User getUser() {
		return user;
	}

	//===========Demo 2===========
	@Autowired
	@Qualifier("uploadfile")
	UploadFile baseUploadFile;

	@RequestMapping("/job/form")
	public String form() {
		return "lab5/demo21";
	}

	@RequestMapping("/job/apply")
	public String apply(ModelMap model, @RequestParam("fullname") String fullname,
			@RequestParam("photo") MultipartFile photo, @RequestParam("cv") MultipartFile cv) {

		if (photo.isEmpty() || cv.isEmpty())
			model.addAttribute("message", "Vui lòng chọn file");
		else {
			try {
				/*
				 * String date =
				 * LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss-"));
				 * String photoName = date + photo.getOriginalFilename(); String cvName = date +
				 * cv.getOriginalFilename();
				 */

				String photoPath = baseUploadFile.getBasePath() + File.separator + photo.getOriginalFilename();
				photo.transferTo(new File(photoPath));

				String cvPath = baseUploadFile.getBasePath() + File.separator + cv.getOriginalFilename();
				cv.transferTo(new File(cvPath));

				model.addAttribute("photo_name", photo.getOriginalFilename());
				model.addAttribute("cv_name", cv.getOriginalFilename());
				model.addAttribute("cv_type", cv.getContentType());
				model.addAttribute("cv_size", cv.getSize());
				return "lab5/demo22";
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file");
			}
		}

		return "lab5/demo21";
	}

	//===========Demo 3===========
	@Autowired
	Mailer mailer;
	
	@Autowired
	@Qualifier("attachfile")
	UploadFile baseAttachFile;
	
	@RequestMapping(value = "/mailer/send", method = RequestMethod.GET)
	public String mail(@ModelAttribute("mailObject") Mail mailObject) {
		return "lab5/demo3";
	}
	
	@RequestMapping(value = "/mailer/send", method = RequestMethod.POST)
	public String sendMail(ModelMap model, @ModelAttribute("mailObject") Mail mailObject, @RequestParam("attachments") MultipartFile attachments) {
		try {
			
			
			 mailer.send(mailObject.getSender(), mailObject.getMailRecipient(),
			 mailObject.getSubject(), mailObject.getMessageBody(), attachments);
			 
			 model.addAttribute("message", 1);
			 
			 mailObject.setSender(""); mailObject.setMailRecipient("");
			 mailObject.setSubject(""); mailObject.setMessageBody("");
			
			 
			/*
			 MimeMessage mail = mailer.createMimeMessage(); MimeMessageHelper helper = new
			 MimeMessageHelper(mail, true);
			 
			 helper.setFrom("yayoi1306@gmail.com", mailObject.getSender());
			 helper.setTo(mailObject.getMailRecipient());
			 helper.setReplyTo("yayoi1306@gmail.com");
			 helper.setSubject(mailObject.getSubject());
			 helper.setText(mailObject.getMessageBody(), true);
			 
			 if(!attachments.isEmpty())
				{
					String baseUploadFile = baseAttachFile.getBasePath() + File.separator + attachments.getOriginalFilename();
					attachments.transferTo(new File(baseUploadFile));
					
					FileSystemResource file1 = new FileSystemResource(new File(baseUploadFile));
					helper.addAttachment(attachments.getOriginalFilename(), file1);
				}
			 
			 mailer.send(mail); model.addAttribute("message", 1);
			 mailObject.setSender(""); mailObject.setMailRecipient("");
			 mailObject.setSubject(""); mailObject.setMessageBody("");
			 */
		} catch (

		Exception e) {
			model.addAttribute("message", 0);
		}
		return "lab5/demo3";
	}
}
