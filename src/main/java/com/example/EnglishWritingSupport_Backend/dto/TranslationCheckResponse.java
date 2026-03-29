package com.example.EnglishWritingSupport_Backend.dto;

import com.fasterxml.jackson.annotation.JsonPropertyDescription;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranslationCheckResponse {
  @JsonPropertyDescription("True if the translation is accurate and natural, false otherwise")
  private boolean correct;

  @JsonPropertyDescription("Score from 0 to 100 based on grammar and TOEIC standards")
  private int score;

  @JsonPropertyDescription("General feedback about the translation quality")
  private String feedback;

  @JsonPropertyDescription("The most natural English version of the sentence (null if the original is already perfect)")
  private String suggestion;

  @JsonPropertyDescription("Detailed explanation of grammar errors or why the suggestion is better (null if the original is already perfect)")
  private String explanation;
}
