create database gamevui2
use gamevui2

DROP TABLE IF EXISTS game;
CREATE TABLE game (
  id_game INT IDENTITY(1,1) PRIMARY KEY,
  tengame NVARCHAR(100) COLLATE Vietnamese_CI_AS NULL,
  hinhgame NVARCHAR(100) NULL,
  taptingame NVARCHAR(100) NULL,
  noidunggame NVARCHAR(MAX) NULL,
  luotchoi BIGINT NULL,
  luotyeuthich BIGINT NULL,
  hot TINYINT NULL,
  ngaycapnhat DATETIME NULL,
  kiemduyet TINYINT NULL,
  id_theloai INT NULL
);
ALTER TABLE game ALTER COLUMN tengame NVARCHAR(100) COLLATE Vietnamese_CI_AS;




INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai)
VALUES 
(N'Trượt Pa-tanh', N'vinaphoneextremeskate_secure.jpg', N'vinaphoneextremeskate_secure.swf', N'<div class="textview instruction">...</div>', 5775, 422, 0, '2018-09-01 19:54:17', 1, 6), 
(N'Xe tải vượt địa hình', N'xe-tai-vuot-dia-hinh.jpg', N'xe-tai-vuot-dia-hinh.swf', N'<div class="textview instruction">...</div>', 6891, 345, 0, '2018-09-01 19:54:16', 1, 5), 
(N'Tranh tài World Cup', N'tranh-tai-wc.jpg', N'tranh-tai-wc.swf', N'<div class="textview instruction">...</div>', 4811, 345, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Tennis 2', N'tennis2.jpg', N'tennis2.swf', N'<div class="textview instruction">...</div>', 9341, 432, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Đá bóng đôi', N'one-on-one-soccer.jpg', N'one-on-one-soccer.swf', N'<div class="textview instruction">...</div>', 4521, 456, 0, '2018-09-01 19:54:16', 1, 6), 
(N'Ác mộng 4', N'nightmares4.jpg', N'nightmares4.swf', N'<div class="textview instruction">...</div>', 7641, 521, 0, '2018-09-01 19:54:16', 1, 10);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Thánh chiến huyền ảo 3', N'epic-battle-fantasy-3.jpg', N'epibic-battle-fantasy-3.swf', N'<div class="textview instruction">...</div>', 13425121, 12322, 1, '2018-09-01 19:52:52', 1, 2), 
(N'Sử thi chiến tranh 5', N'su-thi-chien-tranh-5.jpg', N'su-thi-chien-tranh-5.swf', N'<div class="textview instruction">...</div>', 1234511, 124322, 1, '2018-09-01 19:52:52', 1, 2), 
(N'Đại chiến Dragon Ball', N'Dai-chien-Dragon-Ball-Z.jpg', N'Dai-chien-Dragon-Ball-Z.swf', N'<div class="textview instruction">...</div>', 4124511, 1423322, 1, '2018-09-01 19:52:52', 1, 3), 
(N'Vương quốc lâm nguy 2', N'Vuong-quoc-lam-nguy-2.jpg', N'Vuong-quoc-lam-nguy-2.swf', N'<div class="textview instruction">...</div>', 125111, 2343322, 0, '2018-09-01 19:52:52', 1, 5), 
(N'Đế chế hùng mạnh', N'siegius.jpg', N'siegius.swf', N'<div class="textview instruction">...</div>', 97563411, 1241322, 1, '2018-09-01 19:52:52', 1, 2);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Cuộc chiến không gian', N'cuoc-chien-khong-gian.jpg', N'cuoc-chien-khong-gian.swf', N'<div class="textview instruction">...</div>', 5432123, 654321, 1, '2025-03-15 10:30:00', 1, 3),
(N'Chiến binh bóng tối', N'chien-binh-bong-toi.jpg', N'chien-binh-bong-toi.swf', N'<div class="textview instruction">...</div>', 3214567, 765432, 1, '2025-03-15 10:30:00', 1, 4),
(N'Bí ẩn hầm ngục', N'bi-an-ham-nguc.jpg', N'bi-an-ham-nguc.swf', N'<div class="textview instruction">...</div>', 7896541, 987654, 1, '2025-03-15 10:30:00', 1, 5),
(N'Cuộc chiến sinh tồn', N'cuoc-chien-sinh-ton.jpg', N'cuoc-chien-sinh-ton.swf', N'<div class="textview instruction">...</div>', 4561238, 852963, 0, '2025-03-15 10:30:00', 1, 3),
(N'Huyền thoại thần kiếm', N'huyen-thoai-than-kiem.jpg', N'huyen-thoai-than-kiem.swf', N'<div class="textview instruction">...</div>', 9638527, 741258, 1, '2025-03-15 10:30:00', 1, 5);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Xây tháp', N'xay-thap.jpg', N'xay-thap.swf', N'<div class="textview instruction">...</div>', 54612, 2352, 0, '2018-09-01 19:53:26', 1, 7),
(N'Tiểu Kim Quy', N'tieukimquy_secure.jpg', N'tieukimquy_secure.swf', N'<div class="textview instruction">...</div>', 61212, 6522, 0, '2018-09-01 19:53:26', 1, 7),
(N'Flash man', N'flashmanwm.jpg', N'flashmanwm.swf', N'<div class="textview instruction">...</div>', 63212, 6522, 0, '2018-09-01 19:53:26', 1, 7),
(N'Nhiệm vụ Ville', N'weirdville.jpg', N'weirdville.swf', N'<div class="textview instruction">...</div>', 43512, 4322, 0, '2018-09-01 19:53:26', 1, 7),
(N'Ben 10 vs Alien', N'Ben-10-vs-Alien.jpg', N'Ben-10-vs-Alien.swf', N'<div class="textview instruction">...</div>', 3411, 2562, 0, '2018-09-01 19:53:26', 1, 7),
(N'Đột kích 6', N'Dot-kich-6.jpg', N'Dot-kich-6.swf', N'<div class="textview instruction">...</div>', 3511, 2222, 0, '2018-09-01 19:53:26', 1, 7),
(N'SWAT đột kích', N'SWAT-dot-kich_Secure.jpg', N'SWAT-dot-kich_Secure.swf', N'<div class="textview instruction">...</div>', 663, 2222, 0, '2018-09-01 19:53:26', 1, 7);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES 
(N'Ác mộng 4', N'nightmares4.jpg', N'nightmares4.swf', N'<div class="textview instruction">...</div>', 4411, 212, 0, '2018-09-01 19:53:05', 1, 3),
(N'Người que vượt ngục', N'Nguoi-que-vuot-nguc.jpg', N'Nguoi-que-vuot-nguc.swf', N'<div class="textview instruction">...</div>', 1311, 933, 0, '2018-09-01 19:53:05', 1, 3),
(N'Người sói chạy trốn', N'Nguoi-Soi-chay-tron.jpg', N'Nguoi-Soi-chay-tron.swf', N'<div class="textview instruction">...</div>', 2344, 242, 0, '2018-09-01 19:53:05', 1, 3),
(N'Gumball thoát khỏi ác mộng', N'Gumball-thoat-khoi-ac-mong.jpg', N'Gumball-thoat-khoi-ac-mong.swf', N'<div class="textview instruction">...</div>', 7681, 345, 0, '2018-09-01 19:53:05', 1, 3),
(N'Pokemon phiêu lưu', N'pokemon-adventure.jpg', N'pokemon-adventure.swf', N'<div class="textview instruction">...</div>', 8411, 523, 0, '2018-09-01 19:53:05', 1, 3),
(N'Scooby lâu đài ghê rợn', N'scocreepycastle.jpg', N'scocreepycastle.swf', N'<div class="textview instruction">...</div>', 5775, 422, 0, '2018-09-01 19:53:05', 1, 3);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai)
VALUES 
(N'Vườn hoa', N'vuonhoa.jpg', N'vuonhoa.swf', N'<div class="textview instruction">...</div>', 56612, 6522, 0, '2018-09-01 19:52:48', 1, 1),
(N'Cuộc chiến chó mèo', N'cuoc-chien-cho-meo.jpg', N'cuoc-chien-cho-meo.swf', N'<div class="textview instruction">...</div>', 76612, 6422, 0, '2018-09-01 19:52:48', 1, 1),
(N'Kiss trong phòng', N'gym-love.jpg', N'gym-love.swf', N'<div class="textview instruction">...</div>', 2414, 252, 0, '2018-09-01 19:52:49', 1, 1),
(N'Đánh bóng bàn', N'31.jpg', N'31.swf', N'<div class="textview instruction">...</div>', 6523, 346, 0, '2018-09-01 19:52:51', 1, 1);
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Gunny mini', N'gunny-mini.jpg', N'gunny-mini.swf', N'<div class="textview instruction">...</div>', 32045, 3654, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Đột kích 2', N'dot-kich-2_Secure1.jpg', N'dot-kich-2_Secure1.swf', N'<div class="textview instruction">...</div>', 26435, 4567, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Hành tinh zoombie 2', N'Hanh-tinh-Zombie-2.jpg', N'Hanh-tinh-Zombie-2.swf', N'<div class="textview instruction">...</div>', 54678, 1250, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Ben 10 psyphone cứu thế giới', N'ben-10-psyphon-cuu-the-gioi.jpg', N'ben-10-psyphon-cuu-the-gioi.swf', N'<div class="textview instruction">...</div>', 45201, 2752, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Tăng chiến 5', N'tang-chien-5_secure.jpg', N'tang-chien-5_secure.swf', N'<div class="textview instruction">...</div>', 15611, 2568, 1, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Hành trình zoombie 3', N'Hanh-tinh-Zombie-3.jpg', N'Hanh-tinh-Zombie-3.swf', N'<div class="textview instruction">...</div>', 12311, 2242, 0, '2018-09-01 19:52:45', 1, 1)
INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES (N'Xâm nhập 2', N'Xam-nhap-2.jpg', N'Xam-nhap-2.swf', N'<div class="textview instruction">...</div>', 59943, 4922, 0, '2018-09-01 19:52:45', 1, 1)

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) VALUES 
(N'Thế giới minecraft', N'the-gioi-minecraft.jpg', N'the-gioi-minecraft.swf', N'<div class="textview instruction">...</div>', 78294612, 653422, 1, '2018-09-01 19:53:33', 1, 8),
(N'Nông trại chăn nuôi', N'nong-trai-chan-nuoi.jpg', N'nong-trai-chan-nuoi.swf', N'<div class="textview instruction">...</div>', 23982, 4422, 0, '2018-09-01 19:53:33', 1, 8),
(N'Bể bơi vui nhộn', N'beboivuinhon.jpg', N'beboivuinhon.swf', N'<div class="textview instruction">...</div>', 68917, 6322, 0, '2018-09-01 19:53:33', 1, 8),
(N'Những chú cừu thông minh', N'nhung-chu-cuu-thong-minh.jpg', N'nhung-chu-cuu-thong-minh.swf', N'<div class="textview instruction">...</div>', 64512, 6422, 1, '2018-09-01 19:53:33', 1, 8),
(N'Oggy bắt trộm', N'Oggy-bat-trom.jpg', N'Oggy-bat-trom.swf', N'<div class="textview instruction">...</div>', 76345, 5321, 0, '2018-09-01 19:53:33', 1, 8);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai)
VALUES 
(N'Hugo nhặt kim cương', N'hugo_dimon.jpg', N'hugo_dimon.swf', N'<div class="textview instruction">...</div>', 67348641, 789322, 1, '2018-09-01 19:53:32', 1, 8),
(N'Võ sĩ giác đấu', N'swords_sandals.jpg', N'swords_sandals.swf', N'<div class="textview instruction">...</div>', 2811, 322, 0, '2018-09-01 19:53:36', 1, 8),
(N'Chí phèo thời nay', N'hobo.jpg', N'hobo.swf', N'<div class="textview instruction">...</div>', 4515, 322, 0, '2018-09-01 19:53:36', 1, 8),
(N'Nijia rùa 2', N'ninja-rua-2.jpg', N'ninja-rua-2.swf', N'<div class="textview instruction">...</div>', 5411, 214, 0, '2018-09-01 19:53:37', 1, 8),
(N'Cung thủ 4', N'Cung-thu-4_Secure.jpg', N'Cung-thu-4_Secure.swf', N'<div class="textview instruction">...</div>', 6451, 862, 0, '2018-09-01 19:54:09', 1, 12),
(N'Đạp xe leo núi', N'mountainbike.jpg', N'mountainbike.swf', N'<div class="textview instruction">...</div>', 5123, 763, 0, '2018-09-01 19:54:20', 1, 12);

INSERT INTO game (tengame, hinhgame, taptingame, noidunggame, luotchoi, luotyeuthich, hot, ngaycapnhat, kiemduyet, id_theloai) 
VALUES 
(N'Nhiệm vụ Ville', N'weirdville.jpg', N'weirdville.swf', N'<div class="textview instruction"><img class="screenshot" src="https://st.gamevui.com/images/Image/Kinhdien/weirdville80.gif" title="Nhiệm vụ Ville" alt="Nhiệm vụ Ville"><p align="justify">Bạn sẽ đóng vai nhân vật Ville, có nhiệm vụ di chuyển làm sao tìm đến được mũi tên chỉ lối ra, trên đường đi hãy kiếm thật nhiều những đồng tiền vàng. Trong trò chơi có nhiều thứ thú vị khác, ví dụ như có thể nhảy xuyên qua đám mây... bạn hãy tự khám phá nhé.</p><p align="justify"><font face="Courier New" color="#333333" size="2"><em><u><strong>Điều khiển</strong></u></em>:<br><img class="" alt="" src="https://st.gamevui.com/images/Image/icon_leftright.gif">&nbsp;Di chuyển trái / phải.<br><img class="" alt="" src="https://st.gamevui.com/images/Image/icon_up.gif">&nbsp;Nhảy<br><img class="" alt="" src="https://st.gamevui.com/images/Image/icon_down.gif">&nbsp;Đi xuống</font></p></div>', 43512, 4322, 0, '2018-09-01 19:53:41', 1, 9),
(N'Siêu nhân biến hình', N'sieu-nhan-bien-hinh.jpg', N'sieu-nhan-bien-hinh.swf', N'<div class="textview instruction">5 anh em siêu nhân được giao nhiệm vụ tiêu diệt tất cả những con quái vật. Bạn sẽ giúp họ hoàn thành sứ mệnh của mình chứ.</div>', 0, 0, 1, '2025-03-25 10:18:47', 1, 1),
(N'NinjaGo trong rừng quái vật', N'ninjago-trong-rung-quai-vat.jpg', N'ninjago-trong-rung-quai-vat.swf', N'<div class="textview instruction">Chiến binh Ninjago đang trên đường chinh phục vùng đất mới, con đường Ninjago đi có rất nhiều trở ngại. Và lần này, khu rừng quái vật sẽ là trở ngại tiếp theo của chiến binh này. Bạn hãy giúp Ninjago giành chiến thắng trước những con quái vật này nha.</div>', 0, 0, 1, '2025-03-25 10:18:47', 1, 2),
(N'Contra', N'contra.jpg', N'contra.swf', N'<div class="textview instruction">Contra là một trò chơi video của hệ máy Nintendo Entertainment System (NES). Game được phát triển bởi hãng Konami vào năm 1988.</div>', 0, 0, 1, '2025-03-25 10:18:47', 1, 3),
(N'Đại chiến sao Anime 3', N'dai-chien-sao-anime-3.jpg', N'dai-chien-sao-anime-3.swf', N'<div class="textview instruction">Trò chơi Đại chiến sao Anime 3 này tiếp tục là đấu trường tụ họp của những nhân tài xuất chúng từ các bộ truyện tranh nổi tiếng như Bảy viên ngọc rồng, Naruto, One Piece... Họ sẽ so tài cùng nhau để phân cao thấp! Người cuối cùng đứng vững sẽ là bá chủ, vậy đó là ai? Bạn hãy chơi game Đại chiến sao Anime 3 và tìm ra bá chủ nhé!</div>', 0, 0, 1, '2025-03-25 10:18:47', 1, 4),
(N'Hiệp sĩ hùng mạnh', N'hiep-si-hung-manh.jpg', N'hiep-si-hung-manh.swf', N'<div class="textview instruction">Cùng nhập vai vào nhân vật đấu sĩ đầy sức mạnh và lòng dũng cảm trong thử thách mới nhất cùng GameVui. Nhiệm vụ chính của người chơi là tiêu diệt hết quân địch, thu thập thật nhiều tiền xu vàng và về đích mà không bị tiêu diệt giữa đường.</div>', 0, 0, 1, '2025-03-25 10:18:47', 1, 5);


-- ----------------------------
-- Table structure for [group]
-- ----------------------------
IF OBJECT_ID('[group]', 'U') IS NOT NULL
    DROP TABLE [group];
GO
CREATE TABLE [group] (
    [id_group] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    [status] TINYINT NULL,
    [ordering] INT NULL
);
GO

-- ----------------------------
-- Records of [group]
-- ----------------------------
INSERT INTO [group] ([name], [status], [ordering]) VALUES
('Admin', 1, 1),
('Manager', 2, 2),
('Member', 3, 3);
GO

-- ----------------------------
-- Table structure for [quangcao]
-- ----------------------------
IF OBJECT_ID('[quangcao]', 'U') IS NOT NULL
    DROP TABLE [quangcao];
GO
CREATE TABLE [quangcao] (
    [id_quangcao] INT IDENTITY(1,1) PRIMARY KEY,
    [tieude] NVARCHAR(100) NULL,
    [taptin] NVARCHAR(255) NULL,
    [url] NVARCHAR(100) NULL,
    [target] NVARCHAR(20) NULL,
    [ordering] INT NULL,
    [visiable] TINYINT NULL,
    [fileflash] TINYINT NULL
);
GO

-- ----------------------------
-- Records of [quangcao]
-- ----------------------------
-- 1. Xóa toàn bộ dữ liệu trong bảng
DELETE FROM quangcao;

-- 2. Reset lại giá trị IDENTITY về 1
DBCC CHECKIDENT ('quangcao', RESEED, 0);

-- 3. Chèn lại dữ liệu
INSERT INTO quangcao (tieude, taptin, url, target, ordering, visiable, fileflash) 
VALUES 
(N'Quảng cáo 1', 'quangcao_1.gif', 'http://indogamersonline.blogspot.com/2011/05/game-untuk-nokia-2700-classic-cricket.html', '_blank', 1, 1, 0),
(N'Quảng cáo 2', 'quangcao_2.gif', 'http://www.gogglebob.com/tag/anime/page/2/', '_blank', 2, 1, 0),
(N'Quảng cáo 3', 'quangcao_3.gif', 'http://keowin.com/soi-keo/soi-keo-heidenheimer-vs-arminia-bielefeld-20h30-ngay-5-08-hang-2-duc/', '_blank', 3, 1, 0),
(N'Quảng cáo 4', 'quangcao_4.gif', 'https://quangcaoxebuytblog.wordpress.com/tag/quang-cao-tren-xe-buyt-tai-da-nang/', '_blank', 4, 1, 0),
(N'Quảng cáo 5', 'quangcao_5.gif', 'https://www.pinterest.at/pin/363102788679611802/', '_blank', 5, 1, 0),
(N'Quảng cáo 6', 'quangcao_6.gif', 'https://dulichsongson.com.vn/', '_blank', 6, 1, 0),
(N'Quảng cáo 7', 'quangcao_7.gif', 'https://sites.google.com/site/batdongsanminhminh/chung-cu-hot/chung-cu-vp5-linh-dham', '_blank', 7, 1, 0);

GO

-- ----------------------------
-- Table structure for [theloaigame]
-- ----------------------------
IF OBJECT_ID('[theloaigame]', 'U') IS NOT NULL
    DROP TABLE [theloaigame];
GO
CREATE TABLE [theloaigame] (
    [id_theloai] INT IDENTITY(1,1) PRIMARY KEY,
    [tentheloai] NVARCHAR(50) NULL,
    [visiable_menu] TINYINT NULL,
    [ordering] INT NULL,
    [visiable] TINYINT NULL
);
GO

-- ----------------------------
-- Records of [theloaigame]
-- ----------------------------
INSERT INTO [theloaigame] ([tentheloai], [visiable_menu], [ordering], [visiable]) VALUES
(N'Bắn súng', 1, 1, 1),
(N'Chiến thuật', 1, 2, 1),
(N'Hành động', 1, 3, 1),
(N'Bạn gái', 1, 4, 1),
(N'Phiêu lưu', 1, 5, 1),
(N'Thể thao', 1, 6, 1),
(N'Hoạt hình', 1, 7, 1),
(N'Kinh điển', 1, 8, 1),
(N'Trí tuệ', 0, 9, 1),
(N'Kinh dị', 0, 10, 1);
GO

-- ----------------------------
-- Table structure for [user]
-- ----------------------------
IF OBJECT_ID('[user]', 'U') IS NOT NULL
    DROP TABLE [user];
GO
CREATE TABLE [user] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [username] NVARCHAR(255) NULL,
    [password] NVARCHAR(255) NULL,
    [email] NVARCHAR(255) NULL,
    [fullname] NVARCHAR(255) NULL,
    [sex] NVARCHAR(10) NULL,
    [birthday] DATE NULL,
    [address] NVARCHAR(MAX) NULL,
    [randomkey] NVARCHAR(100) NULL,
    [active] TINYINT NULL,
    [id_group] INT NULL,
    FOREIGN KEY ([id_group]) REFERENCES [group]([id_group])
);
GO

UPDATE game SET tengame = N'Đột kích 2' WHERE tengame = 'Đ?t kích 2';
UPDATE game SET tengame = N'Bắn vợt 4' WHERE tengame = 'B?n v?t 4';
UPDATE game SET tengame = N'Ben 10 psyphone cứu thế giới' WHERE tengame = 'Ben 10 psyphone c?u th? gi?i';
UPDATE game SET tengame = N'Tăng chiến 5' WHERE tengame = 'Tăng chi?n 5';
UPDATE game SET tengame = N'Hành trình zoombie 3' WHERE tengame = 'Hành tr?nh zoombie 3';
UPDATE game SET tengame = N'Xâm nhập 2' WHERE tengame = 'Xâm nh?p 2';
UPDATE game SET tengame = N'Vườn hoa' WHERE tengame = 'Vư?n hoa';
UPDATE game SET tengame = N'Cuộc chiến chó mèo' WHERE tengame = 'Cu?c chi?n chó mèo';
UPDATE game SET tengame = N'Kiss trong phòng' WHERE tengame = 'Kiss trong ph?ng';
UPDATE game SET tengame = N'Trượt Pa-tanh' WHERE tengame = 'Trư?t Pa-tanh';
UPDATE game SET tengame = N'Xe tải vượt địa hình' WHERE tengame = 'Xe t?i vư?t đ?a h?nh';
UPDATE game SET tengame = N'Thánh chiến huyền ảo 3' WHERE tengame = 'Thánh chi?n huy?n ?o 3';
UPDATE game SET tengame = N'Sử thi chiến tranh 5' WHERE tengame = 'S? thi chi?n tranh 5';
UPDATE game SET tengame = N'Đại chiến Dragon Ball' WHERE tengame = 'Đ?i chi?n Dragon Ball';
UPDATE game SET tengame = N'Vương quốc lâm nguy 2' WHERE tengame = 'Vương qu?c lâm nguy 2';
UPDATE game SET tengame = N'Địa chủ hùng mạnh' WHERE tengame = 'Đ? ch? hùng m?nh';
UPDATE game SET tengame = N'Cuộc chiến không gian' WHERE tengame = 'Cu?c chi?n không gian';
UPDATE game SET tengame = N'Chiến binh bóng tối' WHERE tengame = 'Chi?n binh bóng t?i';
UPDATE game SET tengame = N'Bí ẩn hầm ngục' WHERE tengame = 'Bí ?n h?m ng?c';
UPDATE game SET tengame = N'Cuộc chiến sinh tồn' WHERE tengame = 'Cu?c chi?n sinh t?n';
UPDATE game SET tengame = N'Huyền thoại thần kiếm' WHERE tengame = 'Huy?n tho?i th?n ki?m';
UPDATE game SET tengame = N'Tiểu Kim Quy' WHERE tengame = 'Ti?u Kim Quy';
UPDATE game SET tengame = N'Nhiệm vụ Ville' WHERE tengame = 'Nhi?m v? Ville';
UPDATE game SET tengame = N'Đột kích 6' WHERE tengame = 'Đ?t kích 6';
UPDATE game SET tengame = N'SWAT đột kích' WHERE tengame = 'SWAT đ?t kích';
UPDATE game SET tengame = N'Ác mộng 4' WHERE tengame = 'Ác m?ng 4';
UPDATE game SET tengame = N'Người que vượt ngục' WHERE tengame = 'Ngư?i que vư?t ng?c';
UPDATE game SET tengame = N'Người sói chạy trốn' WHERE tengame = 'Ngư?i sói ch?y tr?n';
UPDATE game SET tengame = N'Gumball thoát khỏi ác mộng' WHERE tengame = 'Gumball thoát kh?i ác m?ng';
UPDATE game SET tengame = N'Scooby lâu đài ghê rợn' WHERE tengame = 'Scooby lâu đài ghê r?n';
UPDATE game SET tengame = N'Thế giới minecraft' WHERE tengame = 'Th? gi?i minecraft';
UPDATE game SET tengame = N'Nông trại chăn nuôi' WHERE tengame = 'Nông tr?i chăn nuôi';
UPDATE game SET tengame = N'Bể bơi vui nhộn' WHERE tengame = 'B? bơi vui nh?n';
UPDATE game SET tengame = N'Những chú cẩu thông minh' WHERE tengame = 'Nh?ng chú c?u thông minh';
UPDATE game SET tengame = N'Oggy bắt trộm' WHERE tengame = 'Oggy b?t tr?m';
UPDATE game SET tengame = N'Hugo nhặt kim cương' WHERE tengame = 'Hugo nh?t kim cương';
UPDATE game SET tengame = N'Võ sĩ giác đấu' WHERE tengame = 'V? s? giác đ?u';
UPDATE game SET tengame = N'Chí phèo thời nay' WHERE tengame = 'Chí phèo th?i nay';
UPDATE game SET tengame = N'Cung thủ 4' WHERE tengame = 'Cung th? 4';
UPDATE game SET tengame = N'Đạp xe leo núi' WHERE tengame = 'Đ?p xe leo núi';
UPDATE game SET tengame = N'Nhiệm vụ Ville' WHERE tengame = 'Nhi?m v? Ville';
UPDATE game SET tengame = N'Siêu nhân biến hình' WHERE tengame = 'Siêu nhân bi?n h?nh';
UPDATE game SET tengame = N'NinjaGo trong rừng quái vật' WHERE tengame = 'NinjaGo trong r?ng quái v?t';
UPDATE game SET tengame = N'Đại chiến sao Anime 3' WHERE tengame = 'Đ?i chi?n sao Anime 3';
UPDATE game SET tengame = N'Hiệp sĩ hùng mạnh' WHERE tengame = 'Hi?p s? hùng m?nh';

SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DatabaseCollation;

UPDATE game SET tengame = N'Đột kích 2' WHERE tengame LIKE N'Đ_t kích 2';
UPDATE game SET tengame = N'Tăng chiến 5' WHERE tengame LIKE N'Tăng chi_n 5';
UPDATE game SET tengame = N'Vườn hoa' WHERE tengame LIKE N'Vư_n hoa';
UPDATE game SET tengame = N'Trượt Pa-tanh' WHERE tengame LIKE N'Trư_t Pa-tanh';
UPDATE game SET tengame = N'Xe tải vượt địa hình' WHERE tengame LIKE N'Xe t_i vư_t đ_a h_nh';
UPDATE game SET tengame = N'Đại chiến Dragon Ball' WHERE tengame LIKE N'Đ_i chi_n Dragon Ball';
UPDATE game SET tengame = N'Vương quốc lâm nguy 2' WHERE tengame LIKE N'Vương qu_c lâm nguy 2';
UPDATE game SET tengame = N'Đá chủ hùng mạnh' WHERE tengame LIKE N'Đ_ ch_ hùng m_nh';
UPDATE game SET tengame = N'Người que vượt ngục' WHERE tengame LIKE N'Ngư_i que vư_t ng_c';
UPDATE game SET tengame = N'Người sói chạy trốn' WHERE tengame LIKE N'Ngư_i sói ch_y tr_n';
UPDATE game SET tengame = N'Scooby lâu đài ghê rợn' WHERE tengame LIKE N'Scooby lâu đài ghê r_n';
UPDATE game SET tengame = N'Nông trại chăn nuôi' WHERE tengame LIKE N'Nông tr_i chăn nuôi';
UPDATE game SET tengame = N'Bể bơi vui nhộn' WHERE tengame LIKE N'B_ bơi vui nh_n';
UPDATE game SET tengame = N'Hugo nhặt kim cương' WHERE tengame LIKE N'Hugo nh_t kim cương';
UPDATE game SET tengame = N'Vệ sĩ giác đấu' WHERE tengame LIKE N'V_ s_ giác đ_u';

UPDATE game SET tengame = N'Đột kích 6' WHERE tengame LIKE N'Đ?t kích 6';
UPDATE game SET tengame = N'SWAT đột kích' WHERE tengame LIKE N'SWAT đ?t kích';
UPDATE game SET tengame = N'Đạp xe leo núi' WHERE tengame LIKE N'Đ?p xe leo núi';
UPDATE game SET tengame = N'Đại chiến sao Anime 3' WHERE tengame LIKE N'Đ?i chi?n sao Anime 3';

CREATE TABLE cart (
    id_cart INT IDENTITY(1,1) PRIMARY KEY,
    id_user INT NOT NULL, -- Người dùng thêm sản phẩm vào giỏ
    id_game INT NOT NULL, -- Sản phẩm (game) được thêm
    quantity INT DEFAULT 1, -- Số lượng game (nếu cần)
    added_at DATETIME DEFAULT GETDATE(), -- Thời gian thêm vào giỏ
    FOREIGN KEY (id_user) REFERENCES [user](id),
    FOREIGN KEY (id_game) REFERENCES game(id_game)
);
