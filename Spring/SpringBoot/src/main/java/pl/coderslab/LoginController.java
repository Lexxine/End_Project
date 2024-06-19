package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(String error, String logout, Model model) {
        if (error != null) {
            model.addAttribute("error", "Nieprawidłowa nazwa użytkownika lub hasło.");
        }
        if (logout != null) {
            model.addAttribute("message", "Wylogowano pomyślnie.");
        }

        return "login";
    }
}