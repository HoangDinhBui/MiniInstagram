package com.example.MiniInstagram.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "posts")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int postId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column
    private String caption;

    @Column
    private String mediaUrl;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createdAt;
}
