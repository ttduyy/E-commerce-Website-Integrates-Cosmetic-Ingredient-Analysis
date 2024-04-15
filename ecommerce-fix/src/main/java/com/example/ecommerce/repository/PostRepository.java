package com.example.ecommerce.repository;

import com.example.ecommerce.entity.Post;
import com.example.ecommerce.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    @Query(nativeQuery = true, value = "SELECT * FROM post WHERE status = ?1 ORDER BY created_at DESC LIMIT ?2")
    List<Post> getLatestPosts(int publicStatus, int limit);
    @Query("SELECT p FROM Post p WHERE p.createdBy = :user")
    List<Post> findByCreatedBy(@Param("user") User user);


}