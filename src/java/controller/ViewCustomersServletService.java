package controller;

import entity.Customer;
import session.CustomerFacade;

import javax.ejb.EJB;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Named
public class ViewCustomersServletService implements ServletEntityService<Customer, CustomerFacade> {

        @EJB
        CustomerFacade customerFacade;


    @Override
    public CustomerFacade facade() {
        return customerFacade;
    }

    @Override
    public String bussines(HttpServletRequest request, HttpServletResponse response) {


        String par = request.getParameter("action");
        switch (par) {
            case "view":
            case "delete":
                break;
            default:
                List customerList = facade().findAll();
                request.setAttribute("customerList", customerList);


        }

        return "admin";
    }


}
