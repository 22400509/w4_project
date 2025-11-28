package org.example.w4_project01.common;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.w4_project01.bean.BoardVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {

    public BoardVO uploadPhoto(HttpServletRequest request) {
        int sizeLimit = 15 * 1024 * 1024;
        String realPath = request.getSession().getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) {dir.mkdirs();}

        BoardVO one = null;
        MultipartRequest multi = null;

        try {
            multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            String id = multi.getParameter("id");
            String title = multi.getParameter("title");
            String content = multi.getParameter("content");
            String writer = multi.getParameter("writer");
            String category = multi.getParameter("category");
            String is_public = multi.getParameter("is_public");
            String image = multi.getFilesystemName("image");

            if(image == null){
                image = multi.getParameter("beforeImage");
            }
            one = new BoardVO();

            one.setWriter(writer);
            one.setCategory(category);
            one.setTitle(title);
            one.setContent(content);
            one.setImage(image);
            one.setIs_public(is_public);

            if(id != null) {one.setId(Integer.parseInt(id));}

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String file) {
        String filepath = request.getServletContext().getRealPath("upload");
        File file1 = new File(filepath + "/" + file);
        if(file1.exists()) file1.delete();
    }
}