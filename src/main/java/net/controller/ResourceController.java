package net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Controller
public class ResourceController {

    @RequestMapping("/resource")
    public String downloadResource(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println(session.getAttribute("loggedIn"));

        if (session == null || session.getAttribute("loggedIn") == null) {
            return "loginForm";
        }

        String dataDirectory = request.getServletContext().getRealPath("/WEB-INF/data");
//        File file = new File(dataDirectory, "jianli.txt");

        Path file = Paths.get(dataDirectory, "jianli.txt");
        if (Files.exists(file)) {
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition",
                    "attachment; filename=jianli.txt");
            try {
                Files.copy(file, response.getOutputStream());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;

//        if (file.exists()) {
//
//            response.setContentType("application/txt");
//            response.addHeader("Content-Disposition", "attachment; filename=jianli,txt");
//
//            byte[] buffer = new byte[1024];
//            FileInputStream fileInputStream = null;
//            BufferedInputStream bufferedInputStream = null;
//
//            if (Files.exists(file)) {
//                response.setContentType("application/pdf");
//                response.addHeader("Content-Disposition",
//                        "attachment; filename=secret.pdf");
//                try {
//                    Files.copy(file, response.getOutputStream());
//                } catch (IOException ex) {
//                }
//            }
//
//            try {
//                fileInputStream = new FileInputStream(file);
//                bufferedInputStream = new BufferedInputStream(fileInputStream);
//                OutputStream outputStream = response.getOutputStream();
//                int i = bufferedInputStream.read(buffer);
//                while (i != -1) {
//                    outputStream.write(buffer, 0, i);
//                    i = bufferedInputStream.read(buffer);
//                }
//
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//            } finally {
//                if (bufferedInputStream != null) {
//                    try {
//                        bufferedInputStream.close();
//                    } catch (IOException e) {
//
//                    }
//                }
//
//                if (fileInputStream != null) {
//                    try {
//                        fileInputStream.close();
//                    } catch (IOException e) {
//
//                    }
//                }
//            }

//            try (BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream)) {
//
//                bufferedInputStream.read(buffer);
//                OutputStream outputStream = response.getOutputStream();
//                int i = bufferedInputStream.read(buffer);
//                while (i != -1) {
//                    outputStream.write(buffer, 0, i);
//                    i = bufferedInputStream.read(buffer);
//                }
//
//            }

//        }

    }

}
