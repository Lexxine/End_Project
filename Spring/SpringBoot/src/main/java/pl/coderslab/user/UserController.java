package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String createUser(Model model) {
        model.addAttribute("user",new User());
        return "register";
//        User user = new User();
//        user.setUsername("admin2");
//        user.setPassword("admin2");
//        userService.saveUser(user);
//        return "admin2";
    }
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model){
        if(userService.findByUserName(user.getUsername()) != null){
            model.addAttribute("error","Użytkownik o podanej nazwie już istnieje.");
            return "register";
        }
        userService.saveUser(user);
        return "redirect:/login";
    }

}