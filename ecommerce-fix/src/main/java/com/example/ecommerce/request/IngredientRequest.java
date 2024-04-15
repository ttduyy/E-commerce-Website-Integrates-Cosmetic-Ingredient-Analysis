package com.example.ecommerce.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IngredientRequest {
    @NotBlank(message = "Tên không được để trống")
    private String name;
    private String detail;
    private Integer riskLevel;
    private String uses;
    private String guide;
    private String skinCompatibility;
}