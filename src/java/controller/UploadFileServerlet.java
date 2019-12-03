/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Baohanh;
import model.Hinhanh;
import model.Khuyenmai;
import model.Loaisanpham;
import model.Sanpham;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author phand
 */
public class UploadFileServerlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // location to store file uploaded
    //vị trí để lưu trữ tập tin được tải lên
    private static final String UPLOAD_DIRECTORY = "Image";

    // upload settings
    //cài đặt tải lên
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf = new SimpleDateFormat("HH-mm-ss");
        String time = sdf.format(date.getTime());
        String strDate = formatter.format(date);
        // checks if the request actually contains upload file
        //kiểm tra xem yêu cầu có thực sự chứa tệp tải lên không
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            //nếu không, chúng tôi dừng lại ở đây
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        //cấu hình cài đặt tải lên
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        //đặt ngưỡng bộ nhớ - ngoài các tệp được lưu trữ trong đĩa
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        //đặt vị trí tạm thời để lưu trữ tệp
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        //sets maximum size of upload file
        //đặt kích thước tối đa của tệp tải lên
        upload.setFileSizeMax(MAX_FILE_SIZE);

        //sets maximum size of request (include file + form data)
        //đặt kích thước tối đa của yêu cầu (bao gồm tệp + dữ liệu biểu mẫu)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        //xây dựng đường dẫn thư mục để lưu trữ tập tin tải lên// đường dẫn này liên quan đến thư mục của ứng dụng
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        //tạo thư mục nếu nó không tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            //phân tích nội dung của yêu cầu để trích xuất dữ liệu tệp
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            ArrayList tenfile = new ArrayList<>();

            Hinhanh ssss = new Hinhanh();
            Hashtable param = new Hashtable();
            Iterator<FileItem> iter = formItems.iterator();
            String filename = null;
            String hiep = "gà";
            String masanpham = "";
            String maloaisanpham = "";
            String hinhdaidien = "t";
            String tensanpham = "";
            String soluong = "";
            String dongia = "";
            //String hinhanh;
            String khuyenmai = "";
            String baohanh = "";
            String mausac = "";
            String trangthaisanpham = "";
            String trangthaikinhdoanh = "";
            String motachitiet = "";

            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.isFormField()) {
                    hiep = item.getString();
                    param.put(item.getFieldName(), item.getString());
                } else {
                    if (item.getFieldName().equals("hinhdd")) {
                        filename = strDate + "_" + time + "_" + item.getName();
                    }
                    tenfile.add(item.getName());
                    //filename = strDate + "_" + time + item.getName();
                }

                //filename = strDate + "_" + time +"_"+ filename;// hình ảnh
                masanpham = (String) param.get("msp");
                maloaisanpham = (String) param.get("hiep");
                tensanpham = (String) param.get("tensp");
                soluong = (String) param.get("soluong");
                dongia = (String) param.get("dongia");
                khuyenmai = (String) param.get("khuyenmai");
                baohanh = (String) param.get("baohanh");
                mausac = (String) param.get("mau");
                motachitiet = (String) param.get("motachitiet");
                trangthaisanpham = (String) param.get("ttsp");
                trangthaikinhdoanh = (String) param.get("ttkd");
            }
            int ma = Integer.parseInt(masanpham);
            String maloai = new String(maloaisanpham.getBytes("ISO-8859-1"), "UTF-8");
            String mal = Loaisanpham.layMaLoaiSP(maloai);
            String ten = new String(tensanpham.getBytes("ISO-8859-1"), "UTF-8");
            int so = Integer.parseInt(soluong);
            int don = Integer.parseInt(dongia);
            String khuyen = new String(khuyenmai.getBytes("ISO-8859-1"), "UTF-8");
            String km = Khuyenmai.laymaKM(khuyen);
            String bao = new String(baohanh.getBytes("ISO-8859-1"), "UTF-8");
            String bh = Baohanh.layMaBH(bao);
            String mau = new String(mausac.getBytes("ISO-8859-1"), "UTF-8");
            String mota = new String(motachitiet.getBytes("ISO-8859-1"), "UTF-8");
            String trangthaisp = new String(trangthaisanpham.getBytes("ISO-8859-1"), "UTF-8");
            String trangthaikd = new String(trangthaikinhdoanh.getBytes("ISO-8859-1"), "UTF-8");
            Sanpham newsanpham = new Sanpham();

            newsanpham.themSanPham(mal, km, bh, ten, filename, mau, mota, trangthaisp, trangthaikd, ma, so, don);
            for (Object formItem : tenfile) {
                //ssss.insertHinhanh(100, (String) strDate + "_" + time + "_" + formItem);
                ssss.insertHinhanh(ma, (String) strDate + "_" + time + "_" + formItem);
            }
            //
            //for (int i =0; i <=tenfile.size();i++ ) {
            //ssss.insertHinhanh(100, (String) strDate + "_" + time + "_" + tenfile.get(0));
            // }
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                //lặp đi lặp lại trên các lĩnh vực của hình thức
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    //chỉ xử lý các trường không phải là trường
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String tenmoi = strDate + "_" + time + "_" + fileName;
                        String filePath = uploadPath + File.separator + tenmoi;
                        File storeFile = new File(filePath);

                        // saves the file on disk
                        //lưu tập tin vào đĩa
                        item.write(storeFile);
                        request.setAttribute("msg", UPLOAD_DIRECTORY + "/" + tenmoi);
                        request.setAttribute("message",
                                "Upload has been done successfully >>" + UPLOAD_DIRECTORY + "/" + tenmoi);
                    }
                }
            }

        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
        //chuyển hướng khách hàng đến trang tin nhắn
        getServletContext().getRequestDispatcher("/danhsachSanpham.jsp").forward(request, response);

    }
}
