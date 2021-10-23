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
}
