package com.example.EnglishWritingSupport_Backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranslationCheckRequest {
  private Integer paragraphId;
  private String segment; // Câu tiếng Việt cần dịch
  private String translation; // Bản dịch của người dùng
  private String context; // Đoạn hội thoại gốc để xác định ngữ cảnh
}
