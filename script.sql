DROP DATABASE IF EXISTS english_writing_support;
CREATE DATABASE english_writing_support;

USE english_writing_support;

-- 1. Tạo bảng Paragraphs
CREATE TABLE IF NOT EXISTS paragraphs (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  paragraph TEXT
);

-- 2. Tạo bảng Vocabularies
CREATE TABLE IF NOT EXISTS vocabularies (
  id INT PRIMARY KEY,
  paragraph_id INT,
  keyword VARCHAR(100),
  type VARCHAR(50),
  meaning TEXT,
  pronunciation VARCHAR(100),
  example TEXT,
  FOREIGN KEY (paragraph_id) REFERENCES paragraphs(id)
);

-- 3. Tạo bảng Segments (Các câu trong đoạn văn)
CREATE TABLE IF NOT EXISTS segments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paragraph_id INT,
  content TEXT,
  display_order INT,
  FOREIGN KEY (paragraph_id) REFERENCES paragraphs(id)
);

-- ---------------------------------------------------------
-- CHÈN DỮ LIỆU
-- ---------------------------------------------------------

-- Insert Paragraphs
INSERT INTO paragraphs (id, title, paragraph) VALUES 
(247, 'Just Checking In!', 'Xin chào! Tôi hy vọng bạn khỏe. \n\nTôi muốn biết bạn thế nào. Cuối tuần của bạn thế nào? Bạn có làm gì đặc biệt không? Tôi đã có một chuyến đi bộ đường dài thú vị vào thứ Bảy. Thật sảng khoái! \n\nNgoài ra, tôi tò mò về dự án bạn đã đề cập tuần trước. Mọi việc thế nào rồi? Nếu bạn cần bất kỳ sự trợ giúp nào, vui lòng cho tôi biết. Tôi rất muốn hỗ trợ. \n\nHãy cẩn thận và tôi mong nhận được hồi âm từ bạn! \n\nTrân trọng,\nEmily');

-- Insert Vocabularies
INSERT INTO vocabularies (id, paragraph_id, keyword, type, meaning, pronunciation, example) VALUES 
(570, 247, 'hello', 'Word', 'Xin chào.', '/həˈloʊ/', '`hello` there! How are you?'),
(1335, 247, 'weekend', 'Word', 'Cuối tuần.', 'ˈwiːkˌɛnd', 'I love spending my `weekend` hiking in the mountains.'),
(580, 247, 'hike', 'Word', 'Đi bộ đường dài.', '/haɪk/', 'We plan to `hike` in the mountains this weekend.'),
(37210, 247, 'refreshing', 'Word', 'làm tỉnh táo, làm sảng khoái', 'rɪˈfrɛʃɪŋ', 'A cold drink on a hot day is very `refreshing`.'),
(295, 247, 'curious', 'Word', 'Tò mò', '/ˈkjʊriəs/', 'I am `curious` about your project.'),
(1305, 247, 'project', 'Word', 'dự án', '/ˈprɒdʒɛkt/', 'The company''s new `project` aims to improve sustainability.'),
(571, 247, 'help', 'Word', 'Giúp đỡ, hỗ trợ.', 'hɛlp', 'Can you `help` me with this task?'),
(8254, 247, 'assist', 'Word', 'Hỗ trợ', '/əˈsɪst/', 'I am happy to `assist` you.'),
(960, 247, 'regards', 'Word', 'Kính', '/rɪˈɡɑrdz/', 'Best `regards`,'),
(8259, 247, 'nice hike', 'Noun phrase', 'Chuyến đi bộ thú vị', 'naɪs haɪk', 'We had a `nice hike` on Saturday.'),
(9867, 247, 'last week', 'Noun phrase', 'Tuần trước', 'læst wiːk', 'You mentioned this `last week`.'),
(8267, 247, 'any help', 'Noun phrase', 'bất kỳ sự trợ giúp', 'ˈɛni hɛlp', 'If you need `any help`, let me know.'),
(26461, 247, 'best regards', 'Noun phrase', 'Trân trọng', 'bɛst rɪˈɡɑrdz', '`Best regards`, Emily'),
(17808, 247, 'doing well', 'Verb phrase', 'Khỏe mạnh', 'ˈduːɪŋ wɛl', 'Hope you''re `doing well`.'),
(57554, 247, 'wanted to see', 'Verb phrase', 'Muốn biết', 'ˈwɑntɪd tu si', 'I `wanted to see` how you are.'),
(1480, 247, 'look forward', 'Verb phrase', 'Mong chờ', 'lʊk ˈfɔrwərd', 'I `look forward` to hearing from you.'),
(57887, 247, 'hear from you', 'Verb phrase', 'Nhận tin từ bạn', 'hɪr frəm ju', 'I hope to `hear from you` soon.'),
(1333, 247, 'let me know', 'Verb phrase', 'Hãy cho tôi biết', '/lɛt mi noʊ/', 'Please `let me know` if you need any help.'),
(304813, 247, 'special weekend', 'Adjective phrase', 'Cuối tuần đặc biệt', 'ˈspɛʃəl ˈwiːkˌɛnd', 'Did you have a `special weekend`?'),
(30365, 247, 'on Saturday', 'Prepositional phrase', 'Vào thứ Bảy', 'ɑn ˈsætərdeɪ', 'I had a long hike `on Saturday`.'),
(8290, 247, 'about the project', 'Prepositional phrase', 'Về dự án', 'əˈbaʊt ðə ˈprɒdʒɛkt', 'I''m curious `about the project`.'),
(8296, 247, 'from you', 'Prepositional phrase', 'Từ bạn', 'frəm ju', 'I look forward to hearing `from you`.');

-- Insert Segments
INSERT INTO segments (paragraph_id, content, display_order) VALUES 
(247, 'Xin chào!', 1),
(247, 'Tôi hy vọng bạn khỏe.', 2),
(247, 'Tôi muốn biết bạn thế nào.', 3),
(247, 'Cuối tuần của bạn thế nào?', 4),
(247, 'Bạn có làm gì đặc biệt không?', 5),
(247, 'Tôi đã có một chuyến đi bộ đường dài thú vị vào thứ Bảy.', 6),
(247, 'Thật sảng khoái!', 7),
(247, 'Ngoài ra, tôi tò mò về dự án bạn đã đề cập tuần trước.', 8),
(247, 'Mọi việc thế nào rồi?', 9),
(247, 'Nếu bạn cần bất kỳ sự trợ giúp nào, vui lòng cho tôi biết.', 10),
(247, 'Tôi rất muốn hỗ trợ.', 11),
(247, 'Hãy cẩn thận và tôi mong nhận được hồi âm từ bạn!', 12),
(247, 'Trân trọng,', 13),
(247, 'Emily', 14);