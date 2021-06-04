package pl.coderslab.charity.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Entity
@Data
@ToString
@Component
@RequiredArgsConstructor
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Proszę wpisać imie")
    private String name;
    @NotBlank(message = "Proszę wpisać nazwisko")
    private String surname;
    @NotBlank(message = "Proszę wpisać email")
    private String email;
    @NotBlank(message = "Proszę wpisać wiadomość")
    private String message;
    @CreationTimestamp
    private LocalDateTime createdDate;
    @UpdateTimestamp
    private LocalDateTime updateDate;
    @ManyToOne
    private User user;
    @ManyToOne
    private ContactCategory contactCategory;

}
