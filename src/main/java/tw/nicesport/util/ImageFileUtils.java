package tw.nicesport.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class ImageFileUtils {

	public static String upLoadImageAsTempFile(
			ServletContext servletContext,
			@RequestParam("profileFile") MultipartFile profileFile) throws IllegalStateException, IOException {
		
		// 檔名
		String fileName = profileFile.getOriginalFilename();
		System.out.println("fileName===>"+fileName);
		
		// 暫存檔路徑
		String tempSavedPath = 
				servletContext.getRealPath("/") 
				+ "resources/courseImg/" + fileName;
		
		// 串流變暫存檔
		File tempSavedFile = new File(tempSavedPath);
		profileFile.transferTo(tempSavedFile);
		System.out.println("savedFile===>"+tempSavedFile);
		
		return fileName;
	}
	
}
