package com.example.ecommerce.controller.admin;

import com.example.ecommerce.dto.CategoryInfo;
import com.example.ecommerce.dto.IngredientInfo;
import com.example.ecommerce.entity.Category;
import com.example.ecommerce.entity.Ingredient;
import com.example.ecommerce.request.CategoryRequest;
import com.example.ecommerce.request.IngredientRequest;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.IngredientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class IngredientController {
    @Autowired
    private IngredientService ingredientService;

    @GetMapping("/admin/ingredients")
    public String getCategoryManagePage(Model model) {
        List<IngredientInfo> ingredients = ingredientService.getListIngredients();
        model.addAttribute("ingredients", ingredients);

        return "admin/ingredient/list";
    }

    @PostMapping("/api/admin/ingredients")
    public ResponseEntity<?> createIngredient(@Valid @RequestBody IngredientRequest request) {
        Ingredient ingredient = ingredientService.createIngredient(request);

        return ResponseEntity.ok(ingredient);
    }

    @PutMapping("/api/admin/ingredients/{id}")
    public ResponseEntity<?> updateIngredient(@Valid @RequestBody IngredientRequest request, @PathVariable int id) {
        ingredientService.updateIngredient(id, request);

        return ResponseEntity.ok("Cập nhật thành công");
    }

//    @GetMapping("/api/admin/ingredients/{id}")
//    public ResponseEntity<?> fingIngredient(@PathVariable int id) {
//        ingredientService.getDetailProductById(id);
//
//        return ResponseEntity.ok("Cập nhật thành công");
//    }

    @DeleteMapping("/api/admin/ingredients/{id}")
    public ResponseEntity<?> deleteIngredient( @PathVariable int id) {
        ingredientService.deleteIngredient(id);

        return ResponseEntity.ok("Xóa thành công");
    }
}
