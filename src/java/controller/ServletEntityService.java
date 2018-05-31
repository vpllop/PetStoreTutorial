package controller;

import session.AbstractFacade;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ServletEntityService<T, F extends AbstractFacade<T>> extends ServletService {

    F facade();




}
