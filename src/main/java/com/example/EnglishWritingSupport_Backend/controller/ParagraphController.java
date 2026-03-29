package com.example.EnglishWritingSupport_Backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.EnglishWritingSupport_Backend.dto.TranslationCheckRequest;
import com.example.EnglishWritingSupport_Backend.dto.TranslationCheckResponse;
import com.example.EnglishWritingSupport_Backend.entity.Paragraph;
import com.example.EnglishWritingSupport_Backend.service.AITranslationService;
import com.example.EnglishWritingSupport_Backend.service.ParagraphService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/paragraphs")
public class ParagraphController {
  @Autowired
  private ParagraphService paragraphService;

  @Autowired
  private AITranslationService aiTranslationService;

  @GetMapping
  public ResponseEntity<?> getAllParagraphs() {
    try {
      List<Paragraph> paragraphs = paragraphService.getAllParagraphs();
      return new ResponseEntity<>(paragraphs, HttpStatus.OK);
    } catch (Exception e) {
      log.error("[CONTROLLER][GET][PARAGRAPH] /api/paragraphs - Error occurred: {}",
          e.getMessage(), e);

      return new ResponseEntity<>("[CONTROLLER][GET][PARAGRAPH] /api/paragraphs - Error occurred: {}" +
          e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }

  @GetMapping("/{id}")
  public ResponseEntity<?> getParagraphById(@PathVariable Integer id) {
    try {
      Paragraph paragraph = paragraphService.getParagraphById(id);
      if (paragraph == null) {
        return new ResponseEntity<>("Paragraph not found", HttpStatus.NOT_FOUND);
      }
      return new ResponseEntity<>(paragraph, HttpStatus.OK);
    } catch (Exception e) {
      log.error("[CONTROLLER][GET][PARAGRAPH] /api/paragraphs/{} - Error occurred: {}",
          id, e.getMessage(), e);

      return new ResponseEntity<>(
          "[CONTROLLER][GET][PARAGRAPH] /api/paragraphs/{} - Error occurred: {}" + e.getMessage(),
          HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }

  @PostMapping(value = "/check-translation", consumes = "application/json", produces = "application/json")
  public ResponseEntity<?> checkTranslation(@RequestBody TranslationCheckRequest request) {
    try {
      if (request.getSegment() == null || request.getTranslation() == null) {
        return new ResponseEntity<>("Segment and translation are required",
            HttpStatus.BAD_REQUEST);
      }

      TranslationCheckResponse response = aiTranslationService.checkTranslation(
          request.getSegment(),
          request.getTranslation(),
          request.getContext());

      log.info("[CONTROLLER][POST][CHECK_TRANSLATION] Checked translation for paragraph: {}",
          request.getParagraphId());

      return new ResponseEntity<>(response, HttpStatus.OK);
    } catch (Exception e) {
      log.error("[CONTROLLER][POST][CHECK_TRANSLATION] Error occurred: {}",
          e.getMessage(), e);

      return new ResponseEntity<>(
          "Error checking translation: " + e.getMessage(),
          HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }
}
