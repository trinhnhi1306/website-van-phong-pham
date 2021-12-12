package ptithcm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadFile;

@Service
@Transactional
public class ImageService {

	@Autowired
	@Qualifier("uploadfile")
	UploadFile baseUploadFile;

	public String uploadFile(String uploadRootPath, MultipartFile file) {
		try {
			InputStream fis = file.getInputStream();
			byte[] data = new byte[fis.available()];
			fis.read(data);

			FileOutputStream out = new FileOutputStream(new File(uploadRootPath + "/" + getFileName(file)));

			out.write(data);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("That bai");
		}

		System.out.println("Thanh cong : " + uploadRootPath + "/" + getFileName(file));

		return getFileName(file);
	}

	public String getFileName(MultipartFile filepart) {
		return filepart.getOriginalFilename().replace(" ", "-");
	}

	public String uploadFile1(MultipartFile file) {
		String fileName = "";
		if (!file.isEmpty()) {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss"));
				fileName = date + file.getOriginalFilename();
				String photoPath = baseUploadFile.getBasePath() + "/products" + File.separator + fileName;
				file.transferTo(new File(photoPath));
				Thread.sleep(2000);
				System.out.println(photoPath);
			} catch (IllegalStateException | IOException | InterruptedException e) {
				e.printStackTrace();
				return "0";
			}
		}
		return fileName;
	}
}
