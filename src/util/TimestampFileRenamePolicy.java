package util;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;


/**
 * 사진을 저장한 시간에 따라 파일 이름을 저장하는 클래스
 * @author 나현기
 *
 */
public class TimestampFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		// TODO Auto-generated method stub
		    String name = f.getName();
	        String body = null;
	        String ext = null;
	 
	        int dot = name.lastIndexOf(".");
	        if (dot != -1) {
	            ext = name.substring(dot); // includes "."
	        } else {
	            ext = "";
	        }
	        body = Long.toString( System.currentTimeMillis() );
	 
	        File renameFile = new File( f.getParent(), body + ext );
	         
	        if(renameFile.exists() ){
	            int count = 0;
	            do {
	                count++;
	                String newName = body + count + ext;
	                renameFile = new File(f.getParent(), newName);
	            }while( renameFile.exists() && count < 9999 );
	             
	        }
	        f.renameTo( renameFile );
		
		return renameFile;
	}

}
