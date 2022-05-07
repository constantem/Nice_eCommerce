package tw.nicesport.util;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

public class BytesUtils {

	// fileName 沒有則回傳 null
	public static byte[] multipartFileToBytes(
			MultipartFile multipartFile) throws IOException {
		
		// 檔名
		String fileName = multipartFile.getOriginalFilename();
		System.out.println("fileName===>"+fileName);
		
		// 檔名為空
		if(fileName == null || fileName.trim().isEmpty()) {
			return null;
		}
		
		// 從檔案變串流
		InputStream inStream = multipartFile.getInputStream();
		
		// 從串流變 bytes
		byte[] bytes = new byte[inStream.available()]; // 空的 bytes
		inStream.read(bytes); // 從串流讀進 bytes
		inStream.close();
		
		return bytes;
	}
}
