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
@WebServlet(urlPatterns = "/request/create")
public class CreateController extends BaseRequiredAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // collect inputs
        String fromRaw = req.getParameter("from");
        String toRaw = req.getParameter("to");
        String reason = req.getParameter("reason");

        // build model
        model.RequestForLeave rfl = new model.RequestForLeave();
        model.Employee createdBy = new model.Employee();
        createdBy.setId(user.getEmployee().getId());
        rfl.setCreated_by(createdBy);
        rfl.setFrom(java.sql.Date.valueOf(fromRaw));
        rfl.setTo(java.sql.Date.valueOf(toRaw));
        rfl.setReason(reason);
        rfl.setStatus(0); // processing

        // save
        dal.RequestForLeaveDBContext db = new dal.RequestForLeaveDBContext();
        db.insert(rfl);

        // go back to list
        resp.sendRedirect(req.getContextPath() + "/request/list");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("../view/request/create.jsp").forward(req, resp);
    }
    
}
