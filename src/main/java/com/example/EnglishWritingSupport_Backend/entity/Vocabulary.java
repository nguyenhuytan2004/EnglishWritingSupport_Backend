package com.example.EnglishWritingSupport_Backend.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "vocabularies")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vocabulary {
  @Id
  private Integer id;
  private Integer paragraphId;
  private String keyword;
  private String type;
  private String meaning;
  private String pronunciation;
  private String example;
}
