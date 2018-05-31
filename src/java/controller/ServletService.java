package controller;

import session.AbstractFacade;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ServletService {



    default String jsp() {
        return getClass().getSimpleName();
    }

    default String bussines(HttpServletRequest request, HttpServletResponse response) {
        return jsp();
    }

    default void procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = bussines(request, response);
        String dispatch="/WEB-INF/view/"+s+".jsp";
        request.getRequestDispatcher(dispatch).include(request, response);
    }


}
