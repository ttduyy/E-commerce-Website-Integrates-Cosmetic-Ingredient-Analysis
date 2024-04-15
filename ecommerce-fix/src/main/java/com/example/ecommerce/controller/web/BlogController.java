package com.example.ecommerce.controller.web;

import com.example.ecommerce.dto.CategoryInfo;
import com.example.ecommerce.entity.CommentPost;
import com.example.ecommerce.entity.Post;
import com.example.ecommerce.entity.User;
import com.example.ecommerce.exception.NotFoundException;
import com.example.ecommerce.repository.CommentPostRepository;
import com.example.ecommerce.security.CustomUserDetails;
import com.example.ecommerce.service.CommentPostService;
import com.example.ecommerce.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BlogController {
    @Autowired
    private PostService blogService;
    @Autowired
    private CommentPostRepository commentPostRepository;
    @Autowired
    private  CommentPostService commentPostService;

    @GetMapping("/tin-tuc")
    public String getBlogPage(Model model,
                              @RequestParam(required = false, defaultValue = "1") int page,
                              @RequestParam(required = false, defaultValue = "3") int size) {
        try {
            model.addAttribute("data", blogService.getAll(page, size));
            return "blog/blog";
        } catch (NotFoundException ex) {
            return "error/404";
        }
    }

    @GetMapping("/tin-tuc/{slug}/{id}")
    public String getPostDetailPage(Model model, @PathVariable long id,
                                    @RequestParam(required = false, defaultValue = "1") int page,
                                    @RequestParam(required = false, defaultValue = "8") int size) {
        Post post = blogService.getPostById(id);
        List<Post> latestPosts = blogService.getLatestPost();
        List<CommentPost> comments = commentPostRepository.findByPost(post);
//        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();

        model.addAttribute("post", post);
        model.addAttribute("latestPosts", latestPosts);
        model.addAttribute("comments", comments);
        model.addAttribute("data", commentPostService.getAll(page, size));

        return "blog/detail";
    }


//    @GetMapping("/admin/categories")
//    public String getCategoryManagePage(Model model) {
//        List<CategoryInfo> categories = categoryService.getListCategoryAndProductCount();
//        model.addAttribute("categories", categories);
//
//        return "admin/category/list";
//    }


    @GetMapping("/chinh-sach")
    public String getPolicyPage() {
        return "blog/policy";
    }

    @GetMapping("/dieu-khoan")
    public String getRulesPage() {
        return "blog/rules";
    }

    @GetMapping("/hoi-dap")
    public String getQAPage() {
        return "blog/faqs";
    }
}
