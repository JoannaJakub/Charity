package pl.coderslab.charity.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

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
    @NotBlank(message = "Proszę dodać wiadomość")
    private String message;


}
