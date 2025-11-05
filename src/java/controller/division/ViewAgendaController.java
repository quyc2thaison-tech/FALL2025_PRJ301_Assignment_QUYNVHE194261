/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.division;

import controller.iam.BaseRequiredAuthorizationController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import model.Employee;
import model.RequestForLeave;
import model.iam.User;

/**
 *
 * @author sonnt
 */
@WebServlet(urlPatterns = "/division/agenda")
public class ViewAgendaController extends BaseRequiredAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // parse range
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fromRaw = req.getParameter("from");
        String toRaw = req.getParameter("to");
        LocalDate from = fromRaw != null ? LocalDate.parse(fromRaw, fmt) : LocalDate.now();
        LocalDate to = toRaw != null ? LocalDate.parse(toRaw, fmt) : from.plusDays(7);

        // build list of days (inclusive)
        List<LocalDate> days = new ArrayList<>();
        for (LocalDate d = from; !d.isAfter(to); d = d.plusDays(1)) {
            days.add(d);
        }

        // get leaves of current employee and subordinates
        dal.RequestForLeaveDBContext db = new dal.RequestForLeaveDBContext();
        ArrayList<RequestForLeave> rfls = db.getByEmployeeAndSubodiaries(user.getEmployee().getId());

        // unique employees and red days per employee (approved only status=1)
        Map<Integer, Employee> employeeById = new LinkedHashMap<>();
        Map<Integer, Set<LocalDate>> redDaysByEmployee = new LinkedHashMap<>();

        for (RequestForLeave r : rfls) {
            Employee e = r.getCreated_by();
            employeeById.putIfAbsent(e.getId(), e);
            if (r.getStatus() == 1) {
                Set<LocalDate> set = redDaysByEmployee.computeIfAbsent(e.getId(), k -> new LinkedHashSet<>());
                LocalDate rf = r.getFrom().toLocalDate();
                LocalDate rt = r.getTo().toLocalDate();
                for (LocalDate d = rf; !d.isAfter(rt); d = d.plusDays(1)) {
                    if (!d.isBefore(from) && !d.isAfter(to)) {
                        set.add(d);
                    }
                }
            }
        }

        req.setAttribute("days", days);
        req.setAttribute("employees", new ArrayList<>(employeeById.values()));
        req.setAttribute("redDaysByEmployee", redDaysByEmployee);
        req.getRequestDispatcher("../view/division/agenda.jsp").forward(req, resp);
    }
    
}
