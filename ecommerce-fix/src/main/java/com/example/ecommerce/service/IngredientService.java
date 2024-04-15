package com.example.ecommerce.service;


import com.example.ecommerce.dto.CategoryInfo;
import com.example.ecommerce.dto.IngredientInfo;
import com.example.ecommerce.dto.ProductInfoDto;
import com.example.ecommerce.entity.Category;
import com.example.ecommerce.entity.Ingredient;
import com.example.ecommerce.entity.Product;
import com.example.ecommerce.exception.InternalServerException;
import com.example.ecommerce.exception.NotFoundException;
import com.example.ecommerce.repository.IngredientRepository;

import com.example.ecommerce.request.IngredientRequest;
import com.example.ecommerce.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;


@Service
public class IngredientService {
    @Autowired
    private IngredientRepository ingredientRepository;

    public List<Ingredient> getListIngredient(String list) {
        List<String> ingredientNames = Arrays.asList(list.split("\\s*,\\s*"));
        for (int i = 0; i < ingredientNames.size(); i++) {
            ingredientNames.set(i, ingredientNames.get(i).toLowerCase());
        }
        List<Ingredient> existingIngredients = ingredientRepository.findByNameIn(ingredientNames);

        // Lọc ra các thành phần chưa tồn tại trong cơ sở dữ liệu và lưu chúng
        List<String> existingIngredientNames = new ArrayList<>();
        for (Ingredient ingredient : existingIngredients) {
            existingIngredientNames.add(ingredient.getName());
        }

        for (String name : ingredientNames) {
            if (!existingIngredientNames.contains(name)) {
                Ingredient newIngredient = new Ingredient();
                newIngredient.setName(name);
                newIngredient.setRiskLevel(0);
                ingredientRepository.save(newIngredient);
            }
        }
        return ingredientRepository.findByNameIn(ingredientNames);
    }

    public Ingredient createIngredient(IngredientRequest request) {
        Ingredient ingredient = new Ingredient();
        ingredient.setName(request.getName());
        ingredient.setRiskLevel(request.getRiskLevel());
        ingredient.setDetail(request.getDetail());
        ingredient.setGuide(request.getGuide());
        ingredient.setUses(request.getUses());
        ingredient.setSkinCompatibility(request.getSkinCompatibility());

        return ingredientRepository.save(ingredient);
    }

    public List<IngredientInfo> getListIngredients() {
        return ingredientRepository.getListIngredients();
    };

    public List<Ingredient> getListIngredientsEntity() {
        return ingredientRepository.findAll();
    };

//    public List<Ingredient> searchIngredient(String keyword) {
//        List<Ingredient> pageInfo = ingredientRepository.findIngredientByNameContaining(keyword);
//        if (pageInfo.isEmpty()) {
//            throw new NotFoundException("Không tìm được trang");
//        }
//        return pageInfo;
//    }

    public List<Ingredient> searchIngredients(String keyword) {
//        Ingredient ingredient = new Ingredient();
//        ingredient.setName(keyword);
//
//        ExampleMatcher matcher = ExampleMatcher.matchingAny()
//                .withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase());
//
//        Example<Ingredient> example = Example.of(ingredient, matcher);

        return ingredientRepository.searchIngredientByNameContainingIgnoreCase(keyword);
    }

    public Ingredient getDetailProductById(int id) {
        // Get product info
        Optional<Ingredient> result = ingredientRepository.findById(id);
        if (result.isEmpty()) {
            throw new NotFoundException("Thành phần không tồn tại");
        }

        return result.get();
    }

    public void updateIngredient(int id, IngredientRequest request) {
        Optional<Ingredient> ingredientOptional = ingredientRepository.findById(id);
        if (ingredientOptional.isEmpty()) {
            throw new NotFoundException("Thành phần không tồn tại");
        }

        Ingredient ingredient = ingredientOptional.get();
        ingredient.setName(request.getName());
        ingredient.setDetail(request.getDetail());
        ingredient.setRiskLevel(request.getRiskLevel());
        ingredient.setUses(request.getUses());
        ingredient.setGuide(request.getGuide());
        ingredient.setSkinCompatibility(request.getSkinCompatibility());

        try {
            ingredientRepository.save(ingredient);
        } catch (Exception ex) {
            throw new InternalServerException("Lỗi khi chỉnh sửa thành phần");
        }
    }

    public void deleteIngredient(int id) {
        Optional<Ingredient> ingredientOptional = ingredientRepository.findById(id);
        if (ingredientOptional.isEmpty()) {
            throw new NotFoundException("thành phần không tồn tại");
        }

        Ingredient ingredient = ingredientOptional.get();

        try {
            ingredientRepository.delete(ingredient);
        } catch (Exception ex) {
            throw new InternalServerException("Lỗi khi xóa thành phần");
        }
    }
}
