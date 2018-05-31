package controller;

import javax.inject.Named;

@Named
public class NotFoundService implements ServletService {

    @Override
    public String jsp() {
        return "/error/not-found";
    }

}
