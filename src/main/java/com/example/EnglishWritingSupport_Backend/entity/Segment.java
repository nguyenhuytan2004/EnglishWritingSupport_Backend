package com.example.EnglishWritingSupport_Backend.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "segments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Segment {
  @Id
  private Integer id;
  private Integer paragraphId;
  private String content;
  private Integer displayOrder;
}
