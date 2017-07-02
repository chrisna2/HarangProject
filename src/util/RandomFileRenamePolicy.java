package util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;


/**
 * 사진을 저장한 시간에 따라 파일 이름을 저장하는 클래스
 * @author 나현기
 *
 */
public class RandomFileRenamePolicy implements FileRenamePolicy {

    public File rename(File f) {
        long currentTime = System.currentTimeMillis();
        SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
        int randomNumber = (int)(Math.random()*100000);
  
        String uniqueFileName = "" + randomNumber + simDf.format(new Date(currentTime));

        String name = f.getName();
        String body = null;
        String ext = null;

        int dot = name.lastIndexOf(".");
        if (dot != -1) {
             body = name.substring(0, dot);
             ext = name.substring(dot);  // includes "."
        }
        else {
             body = name;
             ext = "";
        }
  
        String tempName = uniqueFileName + ext;
        f = new File(f.getParent(), tempName);
        if (createNewFile(f)) {
             return f;
        }

        int count = 0;
        while (!createNewFile(f) && count < 9999) {
             count++;
             String newName = uniqueFileName + "_" + count + ext;
             f = new File(f.getParent(), newName);
        }

        return f;
   }
    
    private boolean createNewFile(File f) {
        try {
             return f.createNewFile();
        }
        catch (IOException ignored) {
             return false;
        }
   }

}
