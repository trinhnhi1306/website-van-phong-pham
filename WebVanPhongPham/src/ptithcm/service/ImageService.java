package ptithcm.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class ImageService {

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
    	return filepart.getOriginalFilename().replace(" ","-");
    }
	
}
