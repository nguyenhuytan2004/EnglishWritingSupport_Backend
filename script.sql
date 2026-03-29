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
(247, "Let\'s Talk About Our Favorite Foods!", "Xin chào Sarah,\n\nTôi hy vọng bạn khỏe! Tôi muốn chia sẻ món ăn yêu thích của mình với bạn. Đó là pizza. Tôi thích pizza vì nó ngon và thú vị khi ăn. Bạn có thể có nhiều loại topping. Topping yêu thích của tôi là pepperoni và nấm. Còn bạn thì sao? Bạn có loại topping pizza yêu thích nào không?\n\nĐôi khi, tôi làm pizza ở nhà. Nó dễ làm và ngon. Tôi thích mời bạn bè đến chia sẻ. Bạn có thích nấu ăn cùng bạn bè không? Điều đó làm cho món ăn ngon hơn nữa!\n\nLần tới chúng ta gặp nhau, chúng ta nên cùng nhau ăn pizza. Chúng ta có thể thử một nhà hàng mới. Bạn nghĩ sao? Tôi mong muốn được nghe suy nghĩ của bạn!\n\nTrân trọng,\nMichael");

-- Insert Vocabularies
INSERT INTO vocabularies (id, paragraph_id, keyword, type, meaning, pronunciation, example) VALUES 
(8266, 247, 'pizza', 'Word', 'Bánh nướng tròn, thường có phô mai và các loại nguyên liệu khác.', '/ˈpiːt͡sə/', 'I would like a slice of `pizza`.'),
(8268, 247, 'toppings', 'Word', 'Các thành phần bổ sung trên món ăn.', 'ˈtɒpɪŋz', 'I love adding extra `toppings` to my pizza.'),
(8273, 247, 'pepperoni', 'Word', 'Một loại xúc xích cay thường dùng trên pizza.', '/ˌpɛp.əˈroʊ.ni/', 'I ordered a large pizza with extra `pepperoni`.'),
(767, 247, 'mushrooms', 'Word', 'Nấm là một loại thực phẩm hoặc sinh vật không có lá, hoa, hoặc hạt.', 'ˈmʌʃˌrumz', 'I added some `mushrooms` to the pasta for extra flavor.'),
(1514, 247, 'friends', 'Word', 'Bạn bè, những người có quan hệ thân thiết.', '/frɛndz/', 'I have known my best friend since childhood.'),
(1367, 247, 'restaurant', 'Word', 'Nhà hàng, nơi phục vụ thực phẩm và đồ uống.', '/ˈrɛstəˌrɒnt/', 'We decided to eat at a new `restaurant` downtown.'),
(8278, 247, 'favorite food', 'Noun phrase', 'Món ăn yêu thích.', '/ˈfeɪ.vər.ɪt fuːd/', 'Pizza is my `favorite food`.'),
(304965, 247, 'favorite toppings', 'Noun phrase', 'toppings yêu thích', 'ˈfeɪvərɪt ˈtɑpɪŋz', 'My `favorite toppings` on pizza are pepperoni and mushrooms.'),
(8284, 247, 'favorite pizza topping', 'Noun phrase', 'Topping pizza yêu thích.', 'ˈfeɪvərɪt ˈpitsə ˈtɑpɪŋ', 'My favorite pizza topping is pepperoni.'),
(8289, 247, 'new restaurant', 'Noun phrase', 'Nhà hàng mới.', 'njuː ˈrɛstəˌrɒnt', 'I just discovered a great `new restaurant` downtown.'),
(26461, 247, 'best regards', 'Noun phrase', 'Lời chào thể hiện sự kính trọng hoặc thân thiện trong thư từ.', 'bɛst rɪˈgɑrdz', 'I look forward to hearing from you. `Best regards`, John.'),
(26442, 247, 'hope you are', 'Verb phrase', 'Hy vọng bạn đang (tình trạng, cảm xúc nào đó)', 'hoʊp ju ɑr', '`Hope you are` feeling better after your illness.'),
(52331, 247, 'want to share', 'Verb phrase', 'muốn chia sẻ', 'wɑnt tu ʃɛr', 'I `want to share` my ideas with the team.'),
(144632, 247, 'love pizza', 'Verb phrase', 'yêu thích pizza', 'lʌv ˈpiːtsə', 'I really `love pizza` and eat it every weekend.'),
(304966, 247, 'like to invite', 'Verb phrase', 'thích mời', 'laɪk tə ɪnˈvaɪt', 'I would `like to invite` you to my birthday party.'),
(8309, 247, 'enjoy cooking', 'Verb phrase', 'thích nấu ăn', 'ɪnˈdʒɔɪ ˈkʊkɪŋ', '`enjoy` cooking with friends can make the experience more fun.'),
(1480, 247, 'look forward', 'Verb phrase', 'mong đợi', 'lʊk ˈfɔːrwərd', 'I `look forward` to your response.'),
(17808, 247, 'doing well', 'Adjective phrase', 'Thực hiện tốt.', '/ˈduː.ɪŋ wɛl/', 'Despite the challenges, she is `doing well` in her studies.'),
(304963, 247, 'easy and delicious', 'Adjective phrase', 'dễ dàng và ngon miệng', NULL, 'This `easy and delicious` recipe is perfect for beginners.'),
(304964, 247, 'tasty and fun', 'Adjective phrase', 'Ngon miệng và vui vẻ', NULL, 'The pizza was really `tasty` and satisfying.'),
(2274, 247, 'at home', 'Adverbial phrase', 'Ở nhà.', '/æt hoʊm/', 'I prefer to work `at home` than in an office.'),
(8326, 247, 'even better', 'Adverbial phrase', 'còn tốt hơn', 'ˈiːvən ˈbɛtər', 'This method is `even better` than the previous one.'),
(2058, 247, 'next time', 'Adverbial phrase', 'Lần tới', 'nɛkst taɪm', 'I will do it `next time`.'),
(1184, 247, 'together', 'Adverbial phrase', 'cùng nhau', '/təˈɡɛðər/', 'We can achieve more when working `together`.'),
(1477, 247, 'with you', 'Prepositional phrase', 'với bạn', 'wɪð juː', '`with you` makes everything feel better.'),
(8331, 247, 'over to share', 'Prepositional phrase', 'chia sẻ', NULL, 'I decided to `over to share` my notes with classmates who missed the lecture.'),
(11981, 247, 'with friends', 'Prepositional phrase', 'Cùng với bạn bè.', 'wɪð frɛnds', 'I love to spend my weekends `with friends`.'),
(304962, 247, 'invite over', 'Phrasal verb', 'mời ai đó đến chơi hoặc đến nhà', 'ɪnˈvaɪt ˈoʊvər', 'I want to `invite over` some friends for dinner this weekend.'),
(1731, 247, 'think about', 'Phrasal verb', 'suy nghĩ về', '/θɪŋk əˈbaʊt/', 'I need to `think about` the proposal before making a decision.');

-- Insert Segments
INSERT INTO segments (paragraph_id, content, display_order) VALUES 
(247, 'Xin chào Sarah,', 1),
(247, 'Tôi hy vọng bạn khỏe!', 2),
(247, 'Tôi muốn chia sẻ món ăn yêu thích của mình với bạn.', 3),
(247, 'Đó là pizza.', 4),
(247, 'Tôi thích pizza vì nó ngon và thú vị khi ăn.', 5),
(247, 'Bạn có thể có nhiều loại topping.', 6),
(247, 'Topping yêu thích của tôi là pepperoni và nấm.', 7),
(247, 'Còn bạn thì sao?', 8),
(247, 'Bạn có loại topping pizza yêu thích nào không?', 9),
(247, 'Đôi khi, tôi làm pizza ở nhà.', 10),
(247, 'Nó dễ làm và ngon.', 11),
(247, 'Tôi thích mời bạn bè đến chia sẻ.', 12),
(247, 'Bạn có thích nấu ăn cùng bạn bè không?', 13),
(247, 'Điều đó làm cho món ăn ngon hơn nữa!', 14),
(247, 'Lần tới chúng ta gặp nhau, chúng ta nên cùng nhau ăn pizza.', 15),
(247, 'Chúng ta có thể thử một nhà hàng mới.', 16),
(247, 'Bạn nghĩ sao?', 17),
(247, 'Tôi mong muốn được nghe suy nghĩ của bạn!', 18),
(247, 'Trân trọng,', 19),
(247, 'Michael', 20);