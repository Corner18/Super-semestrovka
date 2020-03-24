package ru.itis.springbootdemo.service;

import com.sun.javafx.collections.ChangeHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.springbootdemo.dto.CommentDto;
import ru.itis.springbootdemo.dto.LikeDto;
import ru.itis.springbootdemo.models.Comment;
import ru.itis.springbootdemo.models.Likes;
import ru.itis.springbootdemo.models.Post;
import ru.itis.springbootdemo.models.User;
import ru.itis.springbootdemo.repositories.CommentRepository;
import ru.itis.springbootdemo.repositories.LikeRepository;
import ru.itis.springbootdemo.repositories.PostRepository;
import ru.itis.springbootdemo.repositories.UsersRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private LikeRepository likeRepository;


    @Override
    public Map<String, String> userComment(Long post_id) {
        Map<String, String> comments = new HashMap<>();
        List<Comment> commentList = commentRepository.getAllByPost_Id(post_id);
        System.out.println(commentList);
        for (Comment comment : commentList) {
            User user = usersRepository.getOne(comment.getUser().getId());
            comments.put(user.getName(), comment.getText());
        }
        return comments;
    }

    @Override
    public Optional<Post> getOne(Long id) {
        Optional<Post> postOptional = postRepository.findById(id);
        if(postOptional.isPresent()){
            Post post = postOptional.get();
            return Optional.of(post);
        } else {
            return Optional.empty();
        }
    }

    @Override
    public void makeComment(CommentDto form) {
        Comment comment = Comment.builder()
                .post(postRepository.getOne(form.getPost_id()))
                .user(usersRepository.getOne(form.getUser_id()))
                .text(form.getComment())
                .build();

        commentRepository.save(comment);
    }

    @Override
    public void makeLike(LikeDto form) {
        Likes like = Likes.builder()
                .post(postRepository.getOne(form.getPost_id()))
                .user(usersRepository.getOne(form.getUser_id()))
                .build();

        likeRepository.save(like);
    }
}
