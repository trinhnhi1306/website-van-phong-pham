package ptithcm.bean;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("mailer")
public class Mailer {

	@Autowired
	JavaMailSender mailer;
	
	@Autowired
	@Qualifier("attachfile")
	UploadFile baseAttachFile;
	
	public void send(String from, String to, String subject, String body, MultipartFile attachments) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("yayoi1306@gmail.com", from);
			helper.setTo(to);
			helper.setReplyTo("yayoi1306@gmail.com");
			helper.setSubject(subject);
			helper.setText(body, true);
			
			if(!attachments.isEmpty())
			{
				String baseUploadFile = baseAttachFile.getBasePath() + File.separator + attachments.getOriginalFilename();
				attachments.transferTo(new File(baseUploadFile));
				
				FileSystemResource file1 = new FileSystemResource(new File(baseUploadFile));
				helper.addAttachment(attachments.getOriginalFilename(), file1);
			}
			
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void sendPassword(String newPass, String email) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("yayoi1306@gmail.com", "MiniStore");
			helper.setTo(email);
			helper.setReplyTo("yayoi1306@gmail.com");
			helper.setSubject("MiniStore - Mật khẩu mới cho tài khoản");
			helper.setText("Đây là mật khẩu mới cho tài khoản của bạn: " + newPass + "<br>Bạn có thể đổi mật khẩu sau khi đăng nhập. Thân gửi!", true);
			/*
			 * FileSystemResource file1 = new FileSystemResource(new
			 * File("C:\\Users\\TRINH\\Documents\\Nam4\\Lập trình web\\website-van-phong-pham\\WebVanPhongPham\\WebContent\\resources\\images\\shoplogo.jpg"
			 * )); helper.addAttachment("shoplogo.jpg", file1);
			 */
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
