package com.example.ecommerce.repository;

import com.example.ecommerce.dto.CategoryInfo;
import com.example.ecommerce.dto.IngredientInfo;
import com.example.ecommerce.entity.Category;
import com.example.ecommerce.entity.Ingredient;
import com.example.ecommerce.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface IngredientRepository extends JpaRepository<Ingredient, Integer> {

    @Query(nativeQuery = true, name = "getListIngredients")
    List<IngredientInfo> getListIngredients();

    List<Ingredient> searchIngredientByNameContainingIgnoreCase(String keyword);
    List<Ingredient> findByNameIn(List<String> names);

}