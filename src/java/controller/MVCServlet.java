package controller;


import javax.inject.Inject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "MVCServlet",
        urlPatterns = {"/mvc/*"})
public class MVCServlet extends HttpServlet {

    @Inject
    ViewCustomersServletService viewCustomersServletService;
    @Inject
    NotFoundService notFoundService;


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        //String[] servicios = config.getInitParameter("MVCServlet").split(",");
    }


    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletService service = serviceFactory(request, response);

        service.procesar(request, response);

    }

    private ServletService serviceFactory(HttpServletRequest request, HttpServletResponse response) {
        String r = request.getParameter("action");
        ServletService service = notFoundService;
        switch (r) {
            case "customers":
                service = viewCustomersServletService;
                break;
            default:
                break;
        }

        return service;


    }


    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
