package pl.coderslab.charity.model;

import lombok.*;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Entity
@Data
@Component
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Email(message = "Format maila jest niepoprawny.")
    @NotEmpty(message = "Proszę wprowadzić maila.")
    @Column(nullable = false,  length = 45)
    private String email;
    @NotBlank(message = "Proszę wprowadzić hasło")
    @Column(nullable = false, length = 64)
    private String password;
}
