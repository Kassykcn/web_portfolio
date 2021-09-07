package web.my.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

// 참고 사이트 : https://victorydntmd.tistory.com/174
@Repository
public class FileUploadService {
	
	private static final String SAVE_PATH = "D:\\soldesk_project\\git\\web_portfolio\\webproject\\src\\main\\webapp\\resources\\uploads";
	private static final String PREFIX_URL = SAVE_PATH+"\\";
	
	public String upload(MultipartFile multipartFile) {
		String url = null;
		String saveFileName = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			//Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			saveFileName = SaveFileName(extName);
			/*
			System.out.println("=======================================");
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			*/
			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + saveFileName;
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return saveFileName;
	}
	
	public String upload2(MultipartFile multipartFile) {
		String url = null;
		String saveFileName = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			//Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			saveFileName = SaveFileName2(extName);
			/*
			System.out.println("=======================================");
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			*/
			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + saveFileName;
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return saveFileName;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String SaveFileName(String extName) {
		String fileName = "";
		
		Date date = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyyMMddHHmmss"; 
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
		fileName = formatter.format(date);
		fileName += extName;
		
		return fileName;
	}
	
	private String SaveFileName2(String extName) {
		String fileName = "";
		
		Date date = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyyMMddHHmmss"; 
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
		fileName = formatter.format(date)+1;
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}