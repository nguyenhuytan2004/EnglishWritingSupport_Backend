package com.example.EnglishWritingSupport_Backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.EnglishWritingSupport_Backend.entity.Paragraph;

public interface ParagraphRepository extends JpaRepository<Paragraph, Integer> {

}
