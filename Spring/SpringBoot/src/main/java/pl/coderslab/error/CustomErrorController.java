package pl.coderslab.error;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        String errorMessage = "Wystąpił nieoczekiwany błąd";

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            switch (statusCode) {
                case 400:
                    errorMessage = "Nieprawidłowe żądanie";
                    break;
                case 401:
                    errorMessage = "Brak autoryzacji - zaloguj się";
                    break;
                case 403:
                    errorMessage = "Zakaz dostępu - brak uprawnień";
                    break;
                case 404:
                    errorMessage = "Ups, coś poszło nie tak...";
                    break;
                case 500:
                    errorMessage = "Wewnętrzny błąd serwera";
                    break;
                default:
                    errorMessage = "Wystąpił nieoczekiwany błąd";
                    break;
            }
            model.addAttribute("statusCode", statusCode);
        }

        model.addAttribute("errorMessage", errorMessage);
        return "error";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
