package com.example.ecommerce.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IngredientInfo {
    private int id;
    private String name;
    private String detail;
    private Integer riskLevel;
    private String uses;
    private String guide;
    private String skinCompatibility;
}