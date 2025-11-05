    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import controller.iam.BaseRequiredAuthorizationController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.iam.User;

/**
 *
 * @author sonnt
 */
@WebServlet(urlPatterns = "/request/review")
public class ReviewController extends BaseRequiredAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String ridRaw = req.getParameter("rid");
        String action = req.getParameter("action"); // approve | reject
        int rid = Integer.parseInt(ridRaw);

        model.RequestForLeave rfl = new model.RequestForLeave();
        rfl.setId(rid);
        // 1 = approved, 2 = rejected per list.jsp mapping
        int status = "approve".equalsIgnoreCase(action) ? 1 : 2;
        rfl.setStatus(status);
        model.Employee approver = new model.Employee();
        approver.setId(user.getEmployee().getId());
        rfl.setProcessed_by(approver);

        dal.RequestForLeaveDBContext db = new dal.RequestForLeaveDBContext();
        db.update(rfl);
        resp.sendRedirect(req.getContextPath() + "/request/list");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String ridRaw = req.getParameter("rid");
        int rid = Integer.parseInt(ridRaw);
        dal.RequestForLeaveDBContext db = new dal.RequestForLeaveDBContext();
        model.RequestForLeave rfl = db.get(rid);
        req.setAttribute("rfl", rfl);
        req.getRequestDispatcher("../view/request/review.jsp").forward(req, resp);
    }
    
}
