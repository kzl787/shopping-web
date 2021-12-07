package jk2.javawebcode.admin.book.servlet;

import cn.itcast.commons.CommonUtils;
import jk2.javawebcode.book.damain.Book;
import jk2.javawebcode.book.service.BookService;
import jk2.javawebcode.category.domain.Category;
import jk2.javawebcode.category.service.CategoryService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet("/AddBookServlet")
public class addBook extends HttpServlet {
    private BookService bookService = new BookService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        //获取表单
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        fileUpload.setFileSizeMax(100*1024);
        List<FileItem> fileItems = null;
        try {
            fileItems = fileUpload.parseRequest(req);
        } catch (FileUploadException e) {
            error("上传的文件超出了100KB", req, resp);
            return;
        }
        //封装商品
        Map<String, Object> map = new HashMap<>();
        for(FileItem fileItem: fileItems){
            if(fileItem.isFormField()){
                map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
            }
        }
        Book book = CommonUtils.toBean(map, Book.class);
        Category category = CommonUtils.toBean(map, Category.class);
        book.setCategory(category);
        //获取图片文件
        FileItem fileItem = fileItems.get(1);
        String imageName = fileItem.getName();
        int index = imageName.lastIndexOf("\\");
        if(index != -1 ){
            imageName = imageName.substring(index+1);
        }
        imageName = CommonUtils.uuid().substring(0,9) + "_" + imageName;
        if(!imageName.toLowerCase().endsWith(".jpg") && !imageName.toLowerCase().endsWith(".png")){
            error("上传图片格式必须为jpg或png格式", req, resp);
            return;
        }
        //保存图片文件
        String savePeth = this.getServletContext().getRealPath("/book_img");
//        int pathIndex = savePeth.indexOf("\\out");
//        savePeth = savePeth.substring(0,pathIndex);
//        savePeth = savePeth + "\\Web\\book_img";
        File imageFile = new File(savePeth, imageName);
        try {
            fileItem.write(imageFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        //校验图片大小
        ImageIcon icon = new ImageIcon(imageFile.getAbsolutePath());
        Image image = icon.getImage();
        if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
            error("您上传的图片尺寸超出了350*350！", req, resp);
            imageFile.delete();//删除图片
            return;
        }
        book.setImage_w("book_img/" + imageName);

        //同上  保存大图的步骤
        fileItem = fileItems.get(2);
        imageName = fileItem.getName();
        index = imageName.lastIndexOf("\\");
        if(index != -1 ){
            imageName = imageName.substring(index+1);
        }
        imageName = CommonUtils.uuid().substring(0,9) + "_" + imageName;
        if(!imageName.toLowerCase().endsWith(".jpg") && !imageName.toLowerCase().endsWith(".png")){
            error("上传图片格式必须为jpg或png格式", req, resp);
            return;
        }
        savePeth = this.getServletContext().getRealPath("/book_img");
//        pathIndex = savePeth.indexOf("\\out");
//        savePeth = savePeth.substring(0,pathIndex);
//        savePeth = savePeth + "\\Web\\book_img";
        imageFile = new File(savePeth, imageName);
        try {
            fileItem.write(imageFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        icon = new ImageIcon(imageFile.getAbsolutePath());
        image = icon.getImage();
        if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
            error("您上传的图片尺寸超出了350*350！", req, resp);
            imageFile.delete();//删除图片
            return;
        }
        book.setImage_b("book_img/" + imageName);
        //为商品设置编号
        book.setBid(CommonUtils.uuid());
        //添加图书
        bookService.addBook(book);
        req.setAttribute("msg", "添加图书成功");
        req.getRequestDispatcher("/adminjsps/msg.jsp").forward(req, resp);
    }

    private void error(String msg, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("msg", msg);
        req.setAttribute("parentList", new CategoryService().findParent());
        req.getRequestDispatcher("//adminjsps/admin/book/add.jsp").forward(req, resp);
    }
}
