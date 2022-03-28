package ca.sait.lab7.servlets;

import ca.sait.lab7.models.Role;
import ca.sait.lab7.models.User;
import ca.sait.lab7.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zhenrong Shi
 */
public class UserServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService service = new UserService();

        try {
            List<User> users = service.getAll();

            request.setAttribute("users", users);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                String action = request.getParameter("action");
                String firstName = request.getParameter("first");
                String lastName = request.getParameter("last");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int roleId;
                String role;
        UserService service = new UserService();
        try{
        if (action != null && action.equals("add")) {
                roleId = Integer.parseInt(request.getParameter("role"));
role = checkRole(roleId);
                Role newRole = new Role(roleId, role);
                service.insert(email, true, firstName, lastName, password, newRole);
            

        } else if (action != null && action.equals("delete")) {

                boolean deleted = service.delete(email);
            
        } else if (action != null && action.equals("edit")) {
                roleId = Integer.parseInt(request.getParameter("role"));
role = checkRole(roleId);

                Role newRole = new Role(roleId, role);
                service.update(email, true, firstName, lastName, password, newRole);
            
        }}catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex);
            }

        UserService userService = new UserService();
        try {
            List<User> users = userService.getAll();

            request.setAttribute("users", users);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
    }

    private String checkRole(int roleId) {
        String role;

        switch (roleId) {
            case 1:
                role = "System Admin";
                break;
            case 2:
                role = "Regular User";
                break;
            default:
                role = "Company Admin";
                break;
        }
return role;
    }

}
