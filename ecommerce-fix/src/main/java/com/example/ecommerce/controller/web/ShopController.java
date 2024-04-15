package com.example.ecommerce.controller.web;

import com.example.ecommerce.dto.ProductInfoDto;
import com.example.ecommerce.entity.*;
import com.example.ecommerce.exception.NotFoundException;
import com.example.ecommerce.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ShopController {
    @Autowired
    private PostService postService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private IngredientService ingredientService;


    @GetMapping("/")
    public String indexPage(Model model) {

        List<Product> products = productService.getListProductLimit();

        model.addAttribute("newProducts", products);

        model.addAttribute("bestSellerProducts", products);

        model.addAttribute("suggestProducts", products);

        model.addAttribute("currentPath", "/san-pham");

        List<Post> latestPosts = postService.getLatestPost();
        model.addAttribute("latestPosts", latestPosts);

        return "shop/index";
    }

    @GetMapping("/thanh-phan")
    public String ingredientPage(Model model){
        try {

            List<Ingredient> ingredients = ingredientService.getListIngredientsEntity();

            model.addAttribute("ingredient_list", ingredients);
            model.addAttribute("currentPath", "/thanh-phan");


        }catch (NotFoundException ex){
            return "error/404";
        }


        return "shop/ingredient";
    }

    @GetMapping("/thanh-phan/tim-kiem")
    public String searchIngredient(@RequestParam("keyword") String keyword,
                                   Model model) {
        try {
//            model.addAttribute("categories", categoryService.getListCategory());
//
//            model.addAttribute("brands", brandService.getListBrand());
            List<Ingredient> list = ingredientService.searchIngredients(keyword);
            model.addAttribute("data", list);
//            model.addAttribute("data", productService.searchProducts(page, size, keyword));
//            if (list.isEmpty()){
//                System.out.println("Hong cos");
//                System.err.println("NONEEEEEEEEE");
//            }
//            System.out.println("haaaaaaa");
            model.addAttribute("currentPath", "/thanh-phan");
//            for (Ingredient n: list
//                 ) {
//                System.out.println(n.getName());
//            }

        } catch (NotFoundException ex) {
            return "error/404";
        }

        return "shop/search-result-ingredient";

    }

    @GetMapping("/thanh-phan/{id}")
    public String getDetailIngredientPage(Model model, @PathVariable int id) {

        Ingredient ingredientInfo;
        try {
            ingredientInfo = ingredientService.getDetailProductById(id);
        } catch (NotFoundException ex) {
            return "error/404";
        } catch (Exception ex) {
            return "error/500";
        }

        model.addAttribute("ingredient", ingredientInfo);
        model.addAttribute("currentPath", "/san-pham");

        return "shop/detail-ingredient";
    }

    @GetMapping("/san-pham")
    public String shopPage(Model model,
                           @RequestParam(required = false, defaultValue = "1") int page,
                           @RequestParam(required = false, defaultValue = "12") int size) {
        try {
            List<Brand> brands = brandService.getListBrand();
            model.addAttribute("brands", brands);

            List<Category> categories = categoryService.getListCategory();
            model.addAttribute("categories", categories);

            model.addAttribute("data", productService.getAll(page, size));

            model.addAttribute("currentPath", "/san-pham");

        } catch (NotFoundException ex) {
            return "error/404";
        }

        return "shop/product";
    }

    @GetMapping("/san-pham/tim-kiem")
    public String searchProduct(@RequestParam(required = false, defaultValue = "1") int page,
                                @RequestParam(required = false, defaultValue = "10") int size,
                                @RequestParam("keyword") String keyword,
                                Model model) {
        try {
            model.addAttribute("categories", categoryService.getListCategory());

            model.addAttribute("brands", brandService.getListBrand());

            model.addAttribute("data", productService.searchProducts(page, size, keyword));

            model.addAttribute("currentPath", "/san-pham");

        } catch (NotFoundException ex) {
            return "error/404";
        }

        return "shop/search-result";

    }

    @GetMapping("/san-pham/{slug}/{id}")
    public String getDetailProductPage(Model model, @PathVariable Long id) {

        ProductInfoDto product;
        try {
            product = productService.getDetailProductById(id);
        } catch (NotFoundException ex) {
            return "error/404";
        } catch (Exception ex) {
            return "error/500";
        }
        model.addAttribute("product", product);
        model.addAttribute("ingredient_product", product.getIngredients());
        model.addAttribute("currentPath", "/san-pham");

        List<Integer> availableProducts = productService.getListAvailableProduct(id);
        model.addAttribute("availableSizes", availableProducts);
        if (availableProducts.size() > 0) {
            model.addAttribute("canBuy", true);
        } else {
            model.addAttribute("canBuy", false);
        }

        List<Product> products = productService.getListProductLimit();

        model.addAttribute("newProducts", products);

        return "shop/detail";
    }

    @GetMapping("/san-pham/danh-muc/{id}")
    public String getProductsByCategory(@PathVariable int id, Model model,
                                        @RequestParam(required = false, defaultValue = "1") int page,
                                        @RequestParam(required = false, defaultValue = "12") int size) {
        try {
            model.addAttribute("brands", brandService.getListBrand());

            model.addAttribute("categories", categoryService.getListCategory());

            model.addAttribute("currentPath", "/san-pham");

            model.addAttribute("data", productService.getAllByCategories_Id(id, page, size));

            return "shop/product";

        } catch (NotFoundException ex) {
            return "error/404";
        }
    }

    @GetMapping("/san-pham/thuong-hieu/{id}")
    public String getProductsByBrand(@PathVariable int id, Model model,
                                     @RequestParam(required = false, defaultValue = "1") int page,
                                     @RequestParam(required = false, defaultValue = "12") int size) {
        try {
            model.addAttribute("brands", brandService.getListBrand());

            model.addAttribute("categories", categoryService.getListCategory());

            model.addAttribute("data", productService.getAllByBrand_Id(id, page, size));

            model.addAttribute("currentPath", "/san-pham");

            return "shop/product";

        } catch (NotFoundException ex) {
            return "error/404";
        }
    }

    @GetMapping("/san-pham/duoi-2-trieu")
    public String getProductByPrice1(Model model,
                                     @RequestParam(required = false, defaultValue = "1") int page,
                                     @RequestParam(required = false, defaultValue = "12") int size) {
        List<Brand> brands = brandService.getListBrand();
        model.addAttribute("brands", brands);

        List<Category> categories = categoryService.getListCategory();

        model.addAttribute("currentPath", "/san-pham");

        model.addAttribute("categories", categories);

        model.addAttribute("data", productService.getProductsList1(page, size));

        return "shop/product";

    }

    @GetMapping("/san-pham/tu-2-trieu-den-6-trieu")
    public String getProductByPrice2(Model model,
                                     @RequestParam(required = false, defaultValue = "1") int page,
                                     @RequestParam(required = false, defaultValue = "12") int size) {
        List<Brand> brands = brandService.getListBrand();
        model.addAttribute("brands", brands);

        List<Category> categories = categoryService.getListCategory();

        model.addAttribute("currentPath", "/san-pham");

        model.addAttribute("categories", categories);

        model.addAttribute("data", productService.getProductsList2(page, size));

        return "shop/product";
    }

    @GetMapping("/san-pham/tu-6-trieu-den-10-trieu")
    public String getProductByPrice3(Model model,
                                     @RequestParam(required = false, defaultValue = "1") int page,
                                     @RequestParam(required = false, defaultValue = "12") int size) {

        List<Brand> brands = brandService.getListBrand();
        model.addAttribute("brands", brands);

        List<Category> categories = categoryService.getListCategory();

        model.addAttribute("currentPath", "/san-pham");

        model.addAttribute("categories", categories);

        model.addAttribute("data", productService.getProductsList3(page, size));

        return "shop/product";
    }

    @GetMapping("/san-pham/tren-10-trieu")
    public String getProductByPrice4(Model model,
                                     @RequestParam(required = false, defaultValue = "1") int page,
                                     @RequestParam(required = false, defaultValue = "12") int size) {

        List<Brand> brands = brandService.getListBrand();
        model.addAttribute("brands", brands);

        List<Category> categories = categoryService.getListCategory();

        model.addAttribute("currentPath", "/san-pham");

        model.addAttribute("categories", categories);

        model.addAttribute("data", productService.getProductsList4(page, size));

        return "shop/product";
    }
}
