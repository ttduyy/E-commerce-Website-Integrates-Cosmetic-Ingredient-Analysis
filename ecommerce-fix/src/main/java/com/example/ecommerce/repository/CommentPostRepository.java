package com.example.ecommerce.repository;

import com.example.ecommerce.entity.Comment;
import com.example.ecommerce.entity.CommentPost;
import com.example.ecommerce.entity.Post;
import com.example.ecommerce.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentPostRepository extends JpaRepository<CommentPost, Long> {
//    @Query(nativeQuery = true, value = "SELECT * FROM comment_post WHERE uploaded_by = ?1")

    @Query("SELECT c FROM CommentPost c WHERE c.post = :post")
    List<CommentPost> findByPost(Post post);
    @Query("SELECT DISTINCT c.user FROM CommentPost c")
    List<User> findDistinctUsers();
}