package com.example.MiniInstagram.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "follows")
public class Follow {
    @Id
    @ManyToOne
    @JoinColumn(name = "follwer_id")
    private User followerId;

    @Id
    @ManyToOne
    @JoinColumn(name = "follwed_id")
    private User followedId;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createdAt;
}
