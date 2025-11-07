/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import controller.iam.BaseRequiredAuthorizationController;
import dal.RequestForLeaveDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.RequestForLeave;
import model.iam.User;

/**
 *
 * @author sonnt
 */
@WebServlet(urlPatterns = "/request/list")
public class ListController extends BaseRequiredAuthorizationController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // Lấy tham số phân trang từ request
        int pageSize = 10; // Số đơn mỗi trang
        int pageIndex = 1; // Trang mặc định
        String pageParam = req.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                pageIndex = Integer.parseInt(pageParam);
                if (pageIndex < 1) pageIndex = 1;
            } catch (NumberFormatException e) {
                pageIndex = 1;
            }
        }

    int employeeId = user.getEmployee().getId();

    // Lấy tổng số đơn để tính số trang - dùng instance riêng để tránh đóng connection trước khi truy vấn dữ liệu
    RequestForLeaveDBContext dbCount = new RequestForLeaveDBContext();
    int totalRecords = dbCount.getTotalRecords(employeeId);
    dbCount.closeConnection();

    int totalPages = (totalRecords + pageSize - 1) / pageSize;
    if (totalPages == 0) totalPages = 1; // ensure at least 1 page
    if (pageIndex > totalPages) pageIndex = totalPages;

    // Lấy danh sách đơn theo trang (instance riêng)
    RequestForLeaveDBContext db = new RequestForLeaveDBContext();
    ArrayList<RequestForLeave> rfls = db.getByEmployeeAndSubodiariesPaging(employeeId, pageIndex, pageSize);
        
        // Đặt thuộc tính cho JSP
        req.setAttribute("rfls", rfls);
        req.setAttribute("pageIndex", pageIndex);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("totalRecords", totalRecords);
        
        req.getRequestDispatcher("../view/request/list.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

}
