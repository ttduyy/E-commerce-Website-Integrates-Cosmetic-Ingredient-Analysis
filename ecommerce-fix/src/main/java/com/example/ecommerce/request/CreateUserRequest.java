package com.example.ecommerce.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CreateUserRequest {
    @NotNull(message = "Họ tên trống")
    @NotEmpty(message = "Họ tên trống")

    @JsonProperty("full_name")
    private String fullName;

    @NotNull(message = "Email trống")
    @NotEmpty(message = "Email trống")
    @Email(message = "Email không đúng định dạng")
    private String email;

    @NotNull(message = "Mật khẩu trống")
    @NotEmpty(message = "Mật khẩu trống")
    @Size(min = 4, max = 20, message = "Mật khẩu phải chứa từ 4 - 20 ký tự")
    private String password;

    @Pattern(regexp="0[0-9]{9}|84[0-9]{9}", message = "Điện thoại không hợp lệ")
    private String phone;
}
