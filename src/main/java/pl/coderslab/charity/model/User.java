package pl.coderslab.charity.model;

import lombok.*;
import org.hibernate.annotations.SortComparator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;


@Entity
@Data
@Component
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email(message = "Format maila jest niepoprawny.")
    @NotEmpty(message = "Proszę wprowadzić maila.")
    @Column(nullable = false, unique = true,  length = 45)
    private String email;

    @NotBlank(message = "Proszę wprowadzić hasło")
    @Column(nullable = false, length = 64)
    private String password;

    @NotEmpty(message = "Proszę podać imię")
    @Column(nullable = false, length = 20)
    private String firstName;
    @NotBlank(message = "Proszę podać nazwisko")
    @Column(nullable = false, length = 20)
    private String lastName;

    @Transient
    @NotEmpty(message = "Proszę powtórzyć hasło")
    private String retypePassword;

    private int enabled;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

}
