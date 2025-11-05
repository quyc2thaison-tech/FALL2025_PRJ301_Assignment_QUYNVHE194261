/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.iam;

import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.iam.User;

/**
 *
 * @author sonnt
 */
@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Kiểm tra đơn giản dữ liệu nhập vào (validation)
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("message", "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.");
            req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra thông tin đăng nhập
        UserDBContext db = new UserDBContext();
        User u = db.get(username, password);

        if (u != null) {
            // Lưu thông tin người dùng vào session
            HttpSession session = req.getSession();
            session.setAttribute("auth", u);

            // Chuyển hướng đến trang chính (home)
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            // Sai tài khoản hoặc mật khẩu
            req.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
    }
}