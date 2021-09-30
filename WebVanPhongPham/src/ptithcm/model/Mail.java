package ptithcm.model;

import org.springframework.web.multipart.MultipartFile;

public class Mail {
	private String sender;
	private String mailRecipient;
	private String subject;
	private String messageBody;
	private MultipartFile attachments;
	public Mail() {
		super();
	}
	public Mail(String sender, String mailRecipient, String subject, String messageBody, MultipartFile attachments) {
		super();
		this.sender = sender;
		this.mailRecipient = mailRecipient;
		this.subject = subject;
		this.messageBody = messageBody;
		this.attachments = attachments;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMailRecipient() {
		return mailRecipient;
	}
	public void setMailRecipient(String mailRecipient) {
		this.mailRecipient = mailRecipient;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessageBody() {
		return messageBody;
	}
	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}
	public MultipartFile getAttachments() {
		return attachments;
	}
	public void setAttachments(MultipartFile attachments) {
		this.attachments = attachments;
	}
	
}
