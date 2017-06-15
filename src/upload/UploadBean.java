package upload;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadBean {
	
		private MultipartRequest multi;
		private String realPath;
		private int maxSize;
		
		private String encType;
		private String m_id;
		private String m_pw;
		private String m_mail;
		private String m_photo;
		private String m_addr;
		private String m_tel;
		
		
	public void setMulti(HttpServletRequest request){
			
			try {
				multi = 
					new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
			} catch (Exception err) {
				err.printStackTrace();
			}
		}
		
		public void setRealPath(String realPath, HttpServletRequest request) {
			//페이지 상에서 리퀘스트를 받아서 빈에서 realpath 를 받아오는 방법.
			this.realPath = request.getServletContext().getRealPath(realPath);
		}

		public void setMaxSize(int maxSize) {
			this.maxSize = maxSize;
		}

		public void setEncType(String encType) {
			this.encType = encType;
		}
		
		public String getM_photo(){
			
			String result = "";
			Enumeration enumer =  multi.getFileNames();

			enumer.hasMoreElements();
			String name = (String)enumer.nextElement();
			File f = multi.getFile(name);
			result = f.getPath(); 
			
			return result;
		}
		
		public String getM_id() {
			return multi.getParameter("m_id");
		}
		public String getM_pw() {
			return multi.getParameter("m_pw");
		}
		public String getM_mail() {
			return multi.getParameter("m_mail");
		}
		public String getM_addr() {
			return multi.getParameter("m_addr");
		}
		public String getM_tel() {
			return multi.getParameter("m_tel");
		}
		
		public String getUpFile(){
			String result = "";
			
			Enumeration enumer =  multi.getFileNames();
			
			while(enumer.hasMoreElements()){
				String name = (String)enumer.nextElement();
				result += "실제 파일명 : "
							+ multi.getOriginalFileName(name)+"<br>";
				result += "저장될 파일명 : "
							+ multi.getFilesystemName(name)+"<br>";
				result +=  "파일 타입 : "
						+ multi.getContentType(name) +"<br>";
				File f = multi.getFile(name);
				result += "파일의 크기 : " + f.length() + "<br>";
				result += "파일의 경로 : "  + f.getPath() + "<hr>";
			}
			
			return result;
		}
		
}
