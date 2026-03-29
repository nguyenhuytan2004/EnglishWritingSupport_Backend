package com.example.EnglishWritingSupport_Backend.service;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.converter.BeanOutputConverter;
import org.springframework.stereotype.Service;

import com.example.EnglishWritingSupport_Backend.dto.TranslationCheckResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AITranslationService {
  private final ChatClient chatClient;

  public AITranslationService(ChatClient.Builder chatClientBuilder) {
    this.chatClient = chatClientBuilder.build();
  }

  @SuppressWarnings("null")
  public TranslationCheckResponse checkTranslation(String segment, String translation, String context) {
    try {
      if (translation == null || translation.trim().isEmpty()) {
        return createErrorResponse("Translation cannot be empty", 0);
      }

      // Định nghĩa bộ chuyển đổi để ánh xạ phản hồi JSON từ AI sang đối tượng Java
      BeanOutputConverter<TranslationCheckResponse> outputConverter = new BeanOutputConverter<>(
          TranslationCheckResponse.class);

      // Prompt hệ thống để hướng dẫn AI đánh giá bản dịch
      String systemPrompt = """
          You are an expert TOEIC Writing Examiner.
          Your mission is to evaluate a student's English translation of a Vietnamese sentence within a specific paragraph context.

          Evaluation Criteria:
          1. Accuracy: Does it match the original meaning and context?
          2. Grammar: Are there any syntax, tense, or article errors?
          3. Naturalness: Does it sound like a native professional or follow TOEIC business standards?

          Scoring Guide:
          - 100: Perfect.
          - 80-95: Correct meaning but could be more natural.
          - 50-79: Understandable but has grammar or word choice errors.
          - < 50: Major errors or wrong meaning.

          STRICT RULE: Return ONLY a valid JSON object. No markdown, no extra text.
          """;

      // Gọi AI và nhận kết quả trực tiếp thành Object
      return chatClient.prompt()
          .system(systemPrompt)
          .user(u -> u.text("""
              ### CONTEXT (For reference):
              "{context}"

              ### TARGET VIETNAMESE SENTENCE:
              "{segment}"

              ### STUDENT'S TRANSLATION:
              "{translation}"

              ### REQUIRED OUTPUT FORMAT:
              {format}
              """)
              .param("context", context)
              .param("segment", segment)
              .param("translation", translation)
              .param("format", outputConverter.getFormat())) // Đảm bảo AI biết định dạng JSON cần trả về
          .call()
          .entity(outputConverter);
    } catch (RuntimeException e) {
      log.error("Translation check runtime error: {}", e.getMessage(), e);
      return createErrorResponse(e.getMessage(), 0);
    } catch (Exception e) {
      log.error("Error checking translation: {}", e.getMessage(), e);
      return createErrorResponse("AI service is temporarily unavailable. Please try again later.", 0);
    }
  }

  private TranslationCheckResponse createErrorResponse(String message, int score) {
    TranslationCheckResponse response = new TranslationCheckResponse();
    response.setCorrect(false);
    response.setFeedback(message);
    response.setScore(score);
    return response;
  }
}
