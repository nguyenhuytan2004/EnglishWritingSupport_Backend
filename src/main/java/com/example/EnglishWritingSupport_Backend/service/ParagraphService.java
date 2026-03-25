package com.example.EnglishWritingSupport_Backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.EnglishWritingSupport_Backend.entity.Paragraph;
import com.example.EnglishWritingSupport_Backend.repository.ParagraphRepository;

@Service
public class ParagraphService {
  @Autowired
  private ParagraphRepository paragraphRepository;

  public List<Paragraph> getAllParagraphs() {
    return paragraphRepository.findAll();
  }

  public Paragraph getParagraphById(Integer id) {
    return paragraphRepository.findById(id).orElse(null);
  }
}
