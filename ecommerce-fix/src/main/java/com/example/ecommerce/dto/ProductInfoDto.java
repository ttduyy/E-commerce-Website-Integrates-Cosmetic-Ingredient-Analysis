package com.example.ecommerce.dto;

import com.example.ecommerce.entity.Brand;
import com.example.ecommerce.entity.Comment;

import com.example.ecommerce.entity.Ingredient;
import lombok.*;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ProductInfoDto {
    private String id;

    private String name;

    private String slug;

    private long price;

    private int totalSold;

    private int quantity;

    private ArrayList<String> productImages;

    private List<Comment> comments;

    private String description;

    private Brand brand;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "product_ingredient",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "ingredient_id"))
    private List<Ingredient> ingredients = new ArrayList<>();
}
