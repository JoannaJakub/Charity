package pl.coderslab.charity.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Data
@Component
@RequiredArgsConstructor
@ToString
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull(message = "Liczba worków musi być większa niż 0")
    @Min(1)
    private Integer quantity;
    @NotBlank(message = "Proszę wpisać ulicę")
    private String street;
    @NotBlank(message = "Proszę wpisać miasto")
    private String city;
    @NotBlank(message = "Proszę wpisać kod pocztowy")
    @Pattern(regexp="[0-9]{2}-[0-9]{3}", message = "")
    private String zipCode;
    @NotBlank(message = "Proszę wpisać numer telefonu")
    @Pattern(regexp="[0-9]{9}", message = "Błędny format numeru")
    private String phoneNumber;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate pickUpDate;
  //  @DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
    @NotNull(message = "Proszę podać godzinę")
    private LocalTime pickUpTime;
    private String pickUpComment;
    @ManyToMany
            private List<Category> categories = new ArrayList<>();
/*
    Set<Category> categories = new HashSet<>();
*/
    @ManyToOne
    private Institution institution;
}
