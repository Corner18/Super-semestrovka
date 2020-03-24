package ru.itis.springbootdemo.service;

import ru.itis.springbootdemo.dto.CommentDto;
import ru.itis.springbootdemo.dto.LikeDto;
import ru.itis.springbootdemo.models.Post;

import java.util.Map;
import java.util.Optional;

public interface PostService {
    Map<String, String> userComment(Long post_id);
    Optional<Post> getOne(Long id);
    void makeComment(CommentDto form);
    void makeLike(LikeDto form);
}
