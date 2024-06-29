package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.board.Board;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Setter
@Getter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 60)
    @NotBlank
    @Size(min = 3, max = 25)
    private String username;
    @NotBlank
    @Size(min = 6, message = "Hasło musi mieć co najmniej 6 znaków")
    @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$",
            message = "Hasło musi zawierać co najmniej jedną cyfrę, jedną małą literę, jedną dużą literę, jeden znak specjalny oraz mieć przynajmniej 8 znaków")
    private String password;
    private int enabled;
    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;
    @OneToMany(mappedBy = "user")
    private Set<Board> boards;

}