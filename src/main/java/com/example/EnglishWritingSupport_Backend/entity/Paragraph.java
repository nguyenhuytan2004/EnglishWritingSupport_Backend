package com.example.EnglishWritingSupport_Backend.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "paragraphs")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Paragraph {
  @Id
  private Integer id;
  private String title;

  @Column(columnDefinition = "TEXT")
  private String paragraph;

  @OneToMany(mappedBy = "paragraphId")
  private List<Vocabulary> vocabularies;

  @OneToMany(mappedBy = "paragraphId")
  private List<Segment> segments;
}
