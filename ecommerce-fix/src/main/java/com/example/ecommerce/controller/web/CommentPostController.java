package com.example.ecommerce.controller.web;

import com.example.ecommerce.dto.CategoryInfo;
import com.example.ecommerce.entity.*;
import com.example.ecommerce.security.CustomUserDetails;
import com.example.ecommerce.service.CommentPostService;
import com.example.ecommerce.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@RestController
public class CommentPostController {

    @Autowired
    private CommentPostService commentPostService;

    @PostMapping(value = "/api/add-comment-post/{postId}")
    public ResponseEntity<CommentPost> addComment(@Valid @RequestBody CommentPost commentPost, @PathVariable long postId) {
        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        commentPostService.createComment(commentPost, postId, user.getId());
        return new ResponseEntity<>(HttpStatus.CREATED);
    }


}
