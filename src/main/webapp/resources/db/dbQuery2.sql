-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- projecta 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `projecta` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `projecta`;

-- 테이블 projecta.account_admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_admin` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` varchar(30) DEFAULT NULL,
  `adminPw` varchar(30) DEFAULT NULL,
  `adminName` varchar(10) DEFAULT NULL,
  `adminEmail` varchar(50) DEFAULT NULL,
  `assigned` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`rowNum`),
  KEY `FK_account_admin_account_member_id` (`adminId`),
  KEY `FK_account_admin_account_member_pw` (`adminPw`),
  KEY `FK_account_admin_account_member_name` (`adminName`),
  KEY `FK_account_admin_account_member_email` (`adminEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_admin:~1 rows (대략적) 내보내기
DELETE FROM `account_admin`;
/*!40000 ALTER TABLE `account_admin` DISABLE KEYS */;
INSERT INTO `account_admin` (`rowNum`, `adminId`, `adminPw`, `adminName`, `adminEmail`, `assigned`) VALUES
	(1, 'admin', 'favadminpass', '관리자', 'honiie@hanmail.net', 'Y'),
	(2, 'admin1', 'favadminpass1', '김관리', '사용가능', 'N'),
	(3, 'admin2', '사용가능', '사용가능', '사용가능', 'N');
/*!40000 ALTER TABLE `account_admin` ENABLE KEYS */;

-- 테이블 projecta.account_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_bbs` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) DEFAULT NULL,
  `bullet` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(10) DEFAULT '답변대기',
  `createdate` date NOT NULL DEFAULT curdate(),
  `isdelete` varchar(50) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`rowNum`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_bbs:~6 rows (대략적) 내보내기
DELETE FROM `account_bbs`;
/*!40000 ALTER TABLE `account_bbs` DISABLE KEYS */;
INSERT INTO `account_bbs` (`rowNum`, `memberId`, `bullet`, `title`, `content`, `status`, `createdate`, `isdelete`) VALUES
	(1, 'userid01', '쿠폰문의', '쿠폰 문의합니다. 수정', '예약 시 사용한 쿠폰은 예약 취소 시에 소멸되는 건가요? 수정수정', '답변대기', '2022-01-14', 'N'),
	(2, 'userid01', '쿠폰문의', '문의 재수정 테스트', '예약 시 사용한 쿠폰은 예약 취소 시에 소멸되는 건가요? \r\n아닌가요? 수정수정 다시수정', '답변대기', '2022-01-14', 'N'),
	(3, 'userid02', '예약문의', '예약문의예약문의예약문의예약문의예약문의', '예약문의예약문의예약문의예약문의예약문의예약문의', '답변대기', '2022-01-14', 'N'),
	(4, 'userid03', '기타문의', '기타문의기타문의기타문의기타문의', '기타문의기타문의기타문의기타문의기타문의기타문의', '답변대기', '2022-01-14', 'N'),
	(6, 'userid01', '기타문의', '기타 문의드립니다. 수정합니다.', '기타를 둥가둥가 ~ 띵가띵가 쳐도 기타 문의인가요?\r\n사과드립니다. 수정수정', '문의삭제', '2022-01-14', 'Y'),
	(10, 'ownerid01', '프로모션', '프로모션 문의 드립니다.', '다음 달 프로모션 참여 가능합니다.\r\n가능하다구요!', '답변대기', '2022-01-14', 'N');
/*!40000 ALTER TABLE `account_bbs` ENABLE KEYS */;

-- 테이블 projecta.account_coupon 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_coupon` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) DEFAULT NULL,
  `couponNum` varchar(50) DEFAULT NULL,
  `couponName` varchar(50) DEFAULT NULL,
  `couponDC` decimal(3,1) DEFAULT NULL,
  `couponMax` int(11) DEFAULT NULL,
  `couponExpire` varchar(10) DEFAULT NULL,
  `isExpire` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`rowNum`),
  KEY `memberId` (`memberId`),
  KEY `FK_account_coupon_coupon_list` (`couponNum`),
  KEY `FK_account_coupon_coupon_list_2` (`couponName`),
  KEY `FK_account_coupon_coupon_list_3` (`couponDC`),
  KEY `FK_account_coupon_coupon_list_4` (`couponMax`),
  KEY `FK_account_coupon_coupon_list_5` (`couponExpire`),
  CONSTRAINT `FK_account_coupon_account_faver` FOREIGN KEY (`memberId`) REFERENCES `account_faver` (`memberId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_coupon_coupon_list` FOREIGN KEY (`couponNum`) REFERENCES `coupon_list` (`couponNum`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_account_coupon_coupon_list_2` FOREIGN KEY (`couponName`) REFERENCES `coupon_list` (`couponName`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_account_coupon_coupon_list_3` FOREIGN KEY (`couponDC`) REFERENCES `coupon_list` (`couponDC`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_account_coupon_coupon_list_4` FOREIGN KEY (`couponMax`) REFERENCES `coupon_list` (`couponMax`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_account_coupon_coupon_list_5` FOREIGN KEY (`couponExpire`) REFERENCES `coupon_list` (`couponExpire`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_coupon:~2 rows (대략적) 내보내기
DELETE FROM `account_coupon`;
/*!40000 ALTER TABLE `account_coupon` DISABLE KEYS */;
INSERT INTO `account_coupon` (`rowNum`, `memberId`, `couponNum`, `couponName`, `couponDC`, `couponMax`, `couponExpire`, `isExpire`) VALUES
	(1, 'userid01', '221201221231105000', '연말10% 할인쿠폰', 0.1, 5000, '2022-12-31', 'Y'),
	(2, 'userid01', '221101221130105000', '레시피등록 10% 쿠폰', 0.1, 5000, '2022-11-30', 'N'),
	(7, 'userid63', '221101221130105000', '레시피등록 10% 쿠폰', 0.1, 5000, '2022-11-30', 'N');
/*!40000 ALTER TABLE `account_coupon` ENABLE KEYS */;

-- 테이블 projecta.account_favee 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_favee` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) DEFAULT NULL,
  `memberPw` varchar(30) DEFAULT NULL,
  `memberName` varchar(10) DEFAULT NULL,
  `memberEmail` varchar(50) DEFAULT NULL,
  `memberContact` varchar(30) DEFAULT NULL,
  `memberAgree` varchar(1) DEFAULT NULL,
  `joinDate` date DEFAULT curdate(),
  `restauName` varchar(30) DEFAULT NULL,
  `restauAddr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rowNum`),
  KEY `FK_favee_account_member_pw` (`memberPw`),
  KEY `restauName` (`restauName`),
  KEY `restauAddr` (`restauAddr`),
  KEY `FK_favee_account_member_agree` (`memberAgree`),
  KEY `FK_favee_account_member_contact` (`memberContact`),
  KEY `FK_favee_account_member_email` (`memberEmail`),
  KEY `FK_favee_account_member_id` (`memberId`),
  KEY `FK_favee_account_member_joindate` (`joinDate`),
  KEY `FK_favee_account_member_name` (`memberName`),
  CONSTRAINT `FK_favee_account_member_agree` FOREIGN KEY (`memberAgree`) REFERENCES `account_member` (`memberAgree`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_favee_account_member_contact` FOREIGN KEY (`memberContact`) REFERENCES `account_member` (`memberContact`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_favee_account_member_email` FOREIGN KEY (`memberEmail`) REFERENCES `account_member` (`memberEmail`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_favee_account_member_id` FOREIGN KEY (`memberId`) REFERENCES `account_member` (`memberId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_favee_account_member_joindate` FOREIGN KEY (`joinDate`) REFERENCES `account_member` (`joinDate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_favee_account_member_name` FOREIGN KEY (`memberName`) REFERENCES `account_member` (`memberName`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_favee_account_member_pw` FOREIGN KEY (`memberPw`) REFERENCES `account_member` (`memberPw`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_favee:~80 rows (대략적) 내보내기
DELETE FROM `account_favee`;
/*!40000 ALTER TABLE `account_favee` DISABLE KEYS */;
INSERT INTO `account_favee` (`rowNum`, `memberId`, `memberPw`, `memberName`, `memberEmail`, `memberContact`, `memberAgree`, `joinDate`, `restauName`, `restauAddr`) VALUES
	(1, 'ownerid01', 'Passwordo1!', '김점주', 'owner1@naver.com', '01022222222', 'N', '2022-01-05', '레니앱', '경기도 분당시 정자동'),
	(2, 'ownerid02', 'Passwordo2!', '박점주', 'owner2@naver.com', '01044444444', 'Y', '2022-01-05', '블랑제리 나정', '경기도 성남시 백현동'),
	(3, 'ownerid03', 'Passwordo3!', '왕점주', 'owner3@naver.com', '01066666666', 'Y', '2022-01-05', '리스토란테 라일락', '경기도 수원시 신풍로23번길'),
	(4, 'ownerid04', 'Passwordo4!', '주점주', 'owner4@naver.com', '01088888888', 'Y', '2022-01-05', '타코피에스타', '경기도 안양시 비산동'),
	(5, 'ownerid05', 'Passwordo5!', '구점주', 'owner5@naver.com', '01010101010', 'Y', '2022-01-08', '마마앤파파', '경기도 안산시 상록구 이동'),
	(6, 'ownerid06', 'Passwordo6!', '외점주', 'owner6@naver.com', '01010101010', 'Y', '2020-01-08', '비건비긴즈', '경기도 수원시 영통구 이의동'),
	(7, 'ownerid07', 'Passwordo7!', '가점주', 'owner7@naver.com', '01010101011', 'Y', '2020-01-09', '두르가', '경기도 의정부시 의정부동 태평로'),
	(8, 'ownerid08', 'Passwordo8!', '나점주', 'owner8@naver.com', '01010101012', 'Y', '2020-01-10', '향촌', '경기도 남양주시 별내면 송산로'),
	(9, 'ownerid09', 'Passwordo9!', '다점주', 'owner9@naver.com', '01010101013', 'N', '2020-01-11', '싸왓디', '경기도 평택시 신장돈 중앙신장로'),
	(10, 'ownerid10', 'Passwordo10!', '라점주', 'owner10@naver.com', '01010101014', 'Y', '2020-01-12', '몽가타', '경기도 군포시 산본동'),
	(11, 'ownerid11', 'Passwordo11!', '마점주', 'owner11@naver.com', '01010101015', 'Y', '2020-01-13', '옥토가', '부산광역시 수영구 광안동'),
	(12, 'ownerid12', 'Passwordo12!', '바점주', 'owner12@naver.com', '01010101016', 'Y', '2020-01-14', '다전', '부산광역시 부산진구 부전2동'),
	(13, 'ownerid13', 'Passwordo13!', '사점주', 'owner13@naver.com', '01010101017', 'Y', '2020-01-15', '노미트버거헬스', '부산광역시 해운대구 좌1동'),
	(14, 'ownerid14', 'Passwordo14!', '아점주', 'owner14@naver.com', '01010101018', 'Y', '2020-01-16', '베지나랑', '부산광역시 수영구'),
	(15, 'ownerid15', 'Passwordo15!', '자점주', 'owner15@naver.com', '01010101019', 'Y', '2020-01-17', '나유타카페', '부산광역시 금정구 장전동'),
	(16, 'ownerid16', 'Passwordo16!', '차점주', 'owner16@naver.com', '01010101020', 'Y', '2020-01-18', '에코토피아', '부산광역시 수영구 남천동'),
	(17, 'ownerid17', 'Passwordo17!', '카점주', 'owner17@naver.com', '01010101021', 'Y', '2020-01-19', '밀한줌', '부산광역시 동래구 안락동'),
	(18, 'ownerid18', 'Passwordo18!', '타점주', 'owner18@naver.com', '01010101022', 'Y', '2020-01-20', '홈비스트로카페', '부산광역시 해운대구 번길'),
	(19, 'ownerid19', 'Passwordo19!', '파점주', 'owner19@naver.com', '01010101023', 'Y', '2020-01-21', '꼬까자', '부산광역시 전포동 전포대로'),
	(20, 'ownerid20', 'Passwordo20!', '하점주', 'owner20@naver.com', '01010101024', 'Y', '2020-01-22', '펀자브', '부산광역시 해운대구 중1동'),
	(21, 'ownerid21', 'Passwordo21!', '일점주', 'owner21@naver.com', '01010101025', 'Y', '2020-01-23', '여울목', '충북 청주시 상당구'),
	(22, 'ownerid22', 'Passwordo22!', '이점주', 'owner22@naver.com', '01010101026', 'Y', '2020-01-24', '오프리', '충북 청주시 흥덕구'),
	(23, 'ownerid23', 'Passwordo23!', '삼점주', 'owner23@naver.com', '01010101027', 'Y', '2020-01-25', '여누', '충북 청주시 흥덕구 북대동'),
	(24, 'ownerid24', 'Passwordo24!', '사점주', 'owner24@naver.com', '01010101028', 'Y', '2020-01-26', '미녀는 숙주를 좋아해', '충북 청주시 흥덕구 운천동'),
	(25, 'ownerid25', 'Passwordo25!', '오점주', 'owner25@naver.com', '01010101029', 'Y', '2020-01-27', '라피자', '충북 청주시 흥덕구 운천동'),
	(26, 'ownerid26', 'Passwordo26!', '육점주', 'owner26@naver.com', '01010101030', 'Y', '2020-01-28', '고향칼국수', '충북 청주시 서원구 개신동'),
	(27, 'ownerid27', 'Passwordo27!', '칠점주', 'owner27@naver.com', '01010101031', 'Y', '2020-01-29', '랭고스버거', '충북 청주시 상당구 북문로'),
	(28, 'ownerid28', 'Passwordo28!', '팔점주', 'owner28@naver.com', '01010101032', 'Y', '2020-01-30', '밸런스', '충북 청주시 청원구 율량동'),
	(29, 'ownerid29', 'Passwordo29!', '구점쥬', 'owner29@naver.com', '01010101033', 'N', '2020-01-31', '행포케 용암점', '충북 청주시 서원구 용암동'),
	(30, 'ownerid30', 'Passwordo30!', '십점주', 'owner30@naver.com', '01010101034', 'N', '2020-02-01', '행포케 충북대점', '충북 청주시 서원구 사창동'),
	(31, 'ownerid31', 'Passwordo31!', '한점주', 'owner31@naver.com', '01010101035', 'Y', '2020-02-02', '러빙헛 송촌점', '대전광역시 대덕구 중리동'),
	(32, 'ownerid32', 'Passwordo32!', '두점주', 'owner32@naver.com', '01010101036', 'Y', '2020-02-03', '비건바닐라', '대전광역시 서구 갈마동'),
	(33, 'ownerid33', 'Passwordo33!', '세점주', 'owner33@naver.com', '01010101037', 'Y', '2020-02-04', '세이비건', '대전광역시 유성구 노은동'),
	(34, 'ownerid34', 'Passwordo34!', '네점주', 'owner34@naver.com', '01010101038', 'Y', '2020-02-05', '선오가닉키친', '대전광역시 유성구 지족동'),
	(35, 'ownerid35', 'Passwordo35!', '다점주', 'owner35@naver.com', '01010101039', 'Y', '2020-02-06', '인디 둔산점', '대전광역시 서구 둔산동'),
	(36, 'ownerid36', 'Passwordo36!', '여점주', 'owner36@naver.com', '01010101040', 'Y', '2020-02-07', '도연제', '대전광역시 유성구 죽동'),
	(37, 'ownerid37', 'Passwordo37!', '곱점주', 'owner37@naver.com', '01010101041', 'Y', '2020-02-08', '풀향기 채식뷔페', '대전광역시 대덕구 중리동'),
	(38, 'ownerid38', 'Passwordo38!', '덟점주', 'owner38@naver.com', '01010101042', 'Y', '2020-02-09', '가남지', '대전광역시 대덕구 중리동'),
	(39, 'ownerid39', 'Passwordo39!', '홉점주', 'owner39@naver.com', '01010101043', 'Y', '2020-02-10', '콩사랑 굴내음', '대전광역시 유성구 어은로'),
	(40, 'ownerid40', 'Passwordo40!', '열점주', 'owner40@naver.com', '01010101044', 'Y', '2020-02-11', '고단백식당', '대전광역시 중구 대종로'),
	(41, 'ownerid41', 'Passwordo41!', '누점주', 'owner41@naver.com', '01010101045', 'Y', '2020-02-12', '카페901', '제주시 노형동'),
	(42, 'ownerid42', 'Passwordo42!', '월점주', 'owner42@naver.com', '01010101046', 'Y', '2020-02-13', '작은부엌', '제주시 조천읍 선흘동2길'),
	(43, 'ownerid43', 'Passwordo43!', '화점주', 'owner43@naver.com', '01010101047', 'Y', '2020-02-14', '비건테이블 바람', '제주시 애월읍 납읍리'),
	(44, 'ownerid44', 'Passwordo44!', '수점주', 'owner44@naver.com', '01010101048', 'Y', '2020-02-15', '일도촌', '제주시 일도2동'),
	(45, 'ownerid45', 'Passwordo45!', '목점주', 'owner45@naver.com', '01010101049', 'Y', '2020-02-16', '고르멍드르멍', '제주시 용담삼동'),
	(46, 'ownerid46', 'Passwordo46!', '금점주', 'owner46@naver.com', '01010101050', 'Y', '2020-02-17', '제라진밥상', '제주시 조천읍 함와로'),
	(47, 'ownerid47', 'Passwordo47!', '토점주', 'owner47@naver.com', '01010101051', 'Y', '2020-02-18', '메밀꽃제주', '제주시 조천읍 와흘리'),
	(48, 'ownerid48', 'Passwordo48!', '요점주', 'owner48@naver.com', '01010101052', 'Y', '2020-02-19', '제주소녀', '제주시 구좌읍 평대리'),
	(49, 'ownerid49', 'Passwordo49!', '에점주', 'owner49@naver.com', '01010101053', 'Y', '2020-02-20', '관덕정분식', '제주시 관덕로8길'),
	(50, 'ownerid50', 'Passwordo50!', '비점주', 'owner50@naver.com', '01010101054', 'Y', '2020-02-21', '앤드유', '제주시 한림읍 한림로'),
	(51, 'ownerid51', 'Passwordo51!', '시점주', 'owner51@naver.com', '01010101055', 'Y', '2020-02-22', '채식주의자의무화과', '전주시 중화산동2가'),
	(52, 'ownerid52', 'Passwordo52!', '디점주', 'owner52@naver.com', '01010101056', 'Y', '2020-02-23', '플랜티카', '전주시 중앙동3가'),
	(53, 'ownerid53', 'Passwordo53!', '프점주', 'owner53@naver.com', '01010101057', 'Y', '2020-02-24', '라므아르', '전주시 금암1동'),
	(54, 'ownerid54', 'Passwordo54!', '지점주', 'owner54@naver.com', '01010101058', 'N', '2020-02-25', '감로헌', '전주시 금암1동'),
	(55, 'ownerid55', 'Passwordo55!', '치점주', 'owner55@naver.com', '01010101059', 'Y', '2020-02-26', '투비', '전주시 완산구 평화동1가'),
	(56, 'ownerid56', 'Passwordo56!', '제점주', 'owner56@naver.com', '01010101060', 'Y', '2020-02-27', '마치래빗 전주점', '전주시 완산구 효자동2가'),
	(57, 'ownerid57', 'Passwordo57!', '케점주', 'owner57@naver.com', '01010101061', 'Y', '2020-02-28', '더 비거닝', '전주시 완산구 솟대1길'),
	(58, 'ownerid58', 'Passwordo58!', '엘점주', 'owner58@naver.com', '01010101062', 'Y', '2020-02-29', '풀꽃세상채식뷔페', '전주시 완산구 중인동'),
	(59, 'ownerid59', 'Passwordo59!', '엠점주', 'owner59@naver.com', '01010101063', 'Y', '2020-03-01', '이너프샐러드', '전주시 덕진구 명륜4길'),
	(60, 'ownerid60', 'Passwordo60!', '엔점주', 'owner60@naver.com', '01010101064', 'Y', '2020-03-02', '진미반점', '전주시 완산구 전라감영3길'),
	(61, 'ownerid61', 'Passwordo61!', '피점주', 'owner61@naver.com', '01010101065', 'Y', '2020-03-03', '송이버섯마을', '양양군 양양읍 월리'),
	(62, 'ownerid62', 'Passwordo62!', '알점주', 'owner62@naver.com', '01010101066', 'Y', '2020-03-04', '동화가든', '강릉시 초당동'),
	(63, 'ownerid63', 'Passwordo63!', '스점주', 'owner63@naver.com', '01010101067', 'Y', '2020-03-05', '큰기와집', '강릉시 강동면 정동진리'),
	(64, 'ownerid64', 'Passwordo64!', '티점주', 'owner64@naver.com', '01010101068', 'Y', '2020-03-06', '선크림젤라또', '속초시 조양동'),
	(65, 'ownerid65', 'Passwordo65!', '우점주', 'owner65@naver.com', '01010101069', 'Y', '2020-03-07', '주천묵집', '영월군 주천면 송학주천로'),
	(66, 'ownerid66', 'Passwordo66!', '브점주', 'owner66@naver.com', '01010101070', 'N', '2020-03-08', '카페루루흐', '속초시 만천1길'),
	(67, 'ownerid67', 'Passwordo67!', '더점주', 'owner67@naver.com', '01010101071', 'Y', '2020-03-09', '점봉산산채식당', '속초시 이목로'),
	(68, 'ownerid68', 'Passwordo68!', '블점주', 'owner68@naver.com', '01010101072', 'Y', '2020-03-10', '엄지네 포장마차', '강릉시 남포동'),
	(69, 'ownerid69', 'Passwordo69!', '엑점주', 'owner69@naver.com', '01010101073', 'Y', '2020-03-11', '감나무집', '양양군 양양읍'),
	(70, 'ownerid70', 'Passwordo70!', '스점주', 'owner70@naver.com', '01010101074', 'Y', '2020-03-12', '영광정 메밀국수', '양양군 강현면 진미로'),
	(71, 'ownerid71', 'Passwordo71!', '와점주', 'owner71@naver.com', '01010101075', 'Y', '2020-03-13', '발우공양', '서울시 종로구 견지동'),
	(72, 'ownerid72', 'Passwordo72!', '트점주', 'owner72@naver.com', '01010101076', 'Y', '2020-03-14', '망넛이네', '서울시 서대문구 연희동'),
	(73, 'ownerid73', 'Passwordo73!', '킨점주', 'owner73@naver.com', '010101001077', 'Y', '2020-03-15', '제로비건', '서울시 송파구 잠실3동'),
	(74, 'ownerid74', 'Passwordo74!', '혜점주', 'owner74@naver.com', '01010101078', 'Y', '2020-03-16', '슬런치 팩토리', '서울시 마포구 서강동'),
	(75, 'ownerid75', 'Passwordo75!', '융점주', 'owner75@naver.com', '01010101079', 'Y', '2020-03-17', '오세계향', '서울시 종로구 관훈동 인사동12길'),
	(76, 'ownerid76', 'Passwordo76!', '학점주', 'owner76@naver.com', '01010101080', 'Y', '2020-03-18', '베제투스', '서울시 용산구 용산2가동'),
	(77, 'ownerid77', 'Passwordo77!', '정점주', 'owner77@naver.com', '01010101081', 'Y', '2020-03-19', '쿡앤북', '서울시 마포구 합정동'),
	(78, 'ownerid78', 'Passwordo78!', '숙점주', 'owner78@naver.com', '01010101082', 'Y', '2020-03-20', '소이로움', '서울시 종로구 누하동'),
	(79, 'ownerid79', 'Passwordo79!', '녀점주', 'owner79@naver.com', '01010101083', 'N', '2020-03-21', '아승지', '서울시 영등포구 신길4동'),
	(80, 'ownerid80', 'Passwordo80!', '그점주', 'owner80@naver.com', '01010101084', 'N', '2020-03-22', '플랜트', '서울시 용산구 이태원1동');
/*!40000 ALTER TABLE `account_favee` ENABLE KEYS */;

-- 테이블 projecta.account_faver 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_faver` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) DEFAULT NULL,
  `memberPw` varchar(30) DEFAULT NULL,
  `memberName` varchar(10) DEFAULT NULL,
  `memberEmail` varchar(50) DEFAULT NULL,
  `memberContact` varchar(30) DEFAULT NULL,
  `memberBirth` varchar(50) DEFAULT NULL,
  `memberAgree` varchar(1) DEFAULT NULL,
  `joinDate` date DEFAULT curdate(),
  PRIMARY KEY (`rowNum`),
  KEY `FK_faver_account_member_pw` (`memberPw`),
  KEY `FK_faver_account_member_id` (`memberId`),
  KEY `FK_faver_account_member_joindate` (`joinDate`),
  KEY `FK_faver_account_member_name` (`memberName`),
  KEY `FK_faver_account_member_agree` (`memberAgree`),
  KEY `FK_faver_account_member_contact` (`memberContact`),
  KEY `FK_faver_account_member_email` (`memberEmail`),
  CONSTRAINT `FK_faver_account_member_agree` FOREIGN KEY (`memberAgree`) REFERENCES `account_member` (`memberAgree`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_faver_account_member_contact` FOREIGN KEY (`memberContact`) REFERENCES `account_member` (`memberContact`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_faver_account_member_email` FOREIGN KEY (`memberEmail`) REFERENCES `account_member` (`memberEmail`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_faver_account_member_id` FOREIGN KEY (`memberId`) REFERENCES `account_member` (`memberId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_faver_account_member_joindate` FOREIGN KEY (`joinDate`) REFERENCES `account_member` (`joinDate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_faver_account_member_name` FOREIGN KEY (`memberName`) REFERENCES `account_member` (`memberName`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_faver_account_member_pw` FOREIGN KEY (`memberPw`) REFERENCES `account_member` (`memberPw`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_faver:~63 rows (대략적) 내보내기
DELETE FROM `account_faver`;
/*!40000 ALTER TABLE `account_faver` DISABLE KEYS */;
INSERT INTO `account_faver` (`rowNum`, `memberId`, `memberPw`, `memberName`, `memberEmail`, `memberContact`, `memberBirth`, `memberAgree`, `joinDate`) VALUES
	(1, 'userid01', 'Passwordu1!', '김회원', 'user1@daum.net', '01011111111', '19910113', 'Y', '2022-01-05'),
	(2, 'userid02', 'Passwordu2!', '박회원', 'user2@daum.net', '01033333333', '19910114', 'Y', '2022-01-05'),
	(3, 'userid03', 'Passwordu3!', '고회원', 'user3@daum.net', '01055555555', '19910115', 'Y', '2022-01-05'),
	(4, 'userid04', 'Passwordu4!', '백회원', 'user4@daum.net', '01077777777', '19910116', 'Y', '2021-01-05'),
	(5, 'userid05', 'Passwordu5!', '민회원', 'user5@daum.net', '01077777777', '19910117', 'Y', '2022-01-08'),
	(6, 'userid06', 'Passwordu6!', '일회원', 'user6@daum.net', '01077777777', '19910118', 'Y', '2020-01-08'),
	(7, 'userid07', 'Passwordu7!', '이회원', 'user7@daum.net', '01077777778', '19910119', 'N', '2020-01-09'),
	(8, 'userid08', 'Passwordu8!', '삼회원', 'user8@daum.net', '01077777779', '19910120', 'Y', '2020-01-10'),
	(9, 'userid09', 'Passwordu9!', '사회원', 'user9@daum.net', '01077777780', '19910121', 'Y', '2020-01-11'),
	(10, 'userid10', 'Passwordu10!', '오회원', 'user10@daum.net', '01077777781', '19910122', 'Y', '2020-01-12'),
	(11, 'userid11', 'Passwordu11!', '육회원', 'user11@daum.net', '01077777782', '19910123', 'N', '2020-01-13'),
	(12, 'userid12', 'Passwordu12!', '칠회원', 'user12@daum.net', '01077777783', '19910124', 'Y', '2020-01-14'),
	(13, 'userid13', 'Passwordu13!', '팔회원', 'user13@daum.net', '01077777784', '19910125', 'Y', '2020-01-15'),
	(14, 'userid14', 'Passwordu14!', '구회원', 'user14@daum.net', '01077777785', '19910126', 'Y', '2020-01-16'),
	(15, 'userid15', 'Passwordu15!', '십회원', 'user15@daum.net', '01077777786', '19910127', 'N', '2020-01-17'),
	(16, 'userid16', 'Passwordu16!', '한회원', 'user16@daum.net', '01077777787', '19910128', 'Y', '2020-01-18'),
	(17, 'userid17', 'Passwordu17!', '두회원', 'user17@daum.net', '01077777788', '19910129', 'Y', '2020-01-19'),
	(18, 'userid18', 'Passwordu18!', '세회원', 'user18@daum.net', '01077777789', '19910130', 'Y', '2020-01-20'),
	(19, 'userid19', 'Passwordu19!', '네회원', 'user19@daum.net', '01077777790', '19910131', 'Y', '2020-01-21'),
	(20, 'userid20', 'Passwordu20!', '다회원', 'user20@daum.net', '01077777791', '1991021', 'Y', '2020-01-22'),
	(21, 'userid21', 'Passwordu21!', '여회원', 'user21@daum.net', '01077777792', '1991022', 'Y', '2020-01-23'),
	(22, 'userid22', 'Passwordu22!', '곱회원', 'user22@daum.net', '01077777793', '1991023', 'Y', '2020-01-24'),
	(23, 'userid23', 'Passwordu23!', '덟회원', 'user23@daum.net', '01077777794', '1991024', 'N', '2020-01-25'),
	(24, 'userid24', 'Passwordu24!', '홉회원', 'user24@daum.net', '01077777795', '1991025', 'Y', '2020-01-26'),
	(25, 'userid25', 'Passwordu25!', '열회원', 'user25@daum.net', '01077777796', '1991026', 'N', '2020-01-27'),
	(26, 'userid26', 'Passwordu26!', '가회원', 'user26@daum.net', '01077777797', '1991027', 'N', '2020-01-28'),
	(27, 'userid27', 'Passwordu27!', '나회원', 'user27@daum.net', '01077777798', '1991028', 'Y', '2020-01-29'),
	(28, 'userid28', 'Passwordu28!', '다회원', 'user28@daum.net', '01077777799', '1991029', 'Y', '2020-01-30'),
	(29, 'userid29', 'Passwordu29!', '라회원', 'user29@daum.net', '01077777800', '19910210', 'Y', '2020-01-31'),
	(30, 'userid30', 'Passwordu30!', '마회원', 'user30@daum.net', '01077777801', '19910211', 'Y', '2020-02-01'),
	(31, 'userid31', 'Passwordu31!', '바회원', 'user31@daum.net', '01077777802', '19910212', 'Y', '2020-02-02'),
	(32, 'userid32', 'Passwordu32!', '사회원', 'user32@daum.net', '01077777803', '19910213', 'N', '2020-02-03'),
	(33, 'userid33', 'Passwordu33!', '아회원', 'user33@daum.net', '01077777804', '19910214', 'N', '2020-02-04'),
	(34, 'userid34', 'Passwordu34!', '자회원', 'user34@daum.net', '01077777805', '19910215', 'Y', '2020-02-05'),
	(35, 'userid35', 'Passwordu35!', '차회원', 'user35@daum.net', '01077777806', '19910216', 'Y', '2020-02-06'),
	(36, 'userid36', 'Passwordu36!', '카회원', 'user36@daum.net', '01077777807', '19910217', 'Y', '2020-02-07'),
	(37, 'userid37', 'Passwordu37!', '타회원', 'user37@daum.net', '01077777808', '19910218', 'Y', '2020-02-08'),
	(38, 'userid38', 'Passwordu38!', '파회원', 'user38@daum.net', '01077777809', '19910219', 'N', '2020-02-09'),
	(39, 'userid39', 'Passwordu39!', '하회원', 'user39@daum.net', '01077777810', '19910220', 'Y', '2020-02-10'),
	(40, 'userid40', 'Passwordu40!', '규회원', 'user40@daum.net', '01077777811', '19910221', 'Y', '2020-02-11'),
	(41, 'userid41', 'Passwordu41!', '뉴회원', 'user41@daum.net', '01077777812', '19910222', 'Y', '2020-02-12'),
	(42, 'userid42', 'Passwordu42!', '듀회원', 'user42@daum.net', '01077777813', '19910223', 'N', '2020-02-13'),
	(43, 'userid43', 'Passwordu43!', '류회원', 'user43@daum.net', '01077777814', '19910224', 'Y', '2020-02-14'),
	(44, 'userid44', 'Passwordu44!', '뮤회원', 'user44@daum.net', '01077777815', '19910225', 'Y', '2020-02-15'),
	(45, 'userid45', 'Passwordu45!', '뷰회원', 'user45@daum.net', '01077777816', '19910226', 'Y', '2020-02-16'),
	(46, 'userid46', 'Passwordu46!', '슈회원', 'user46@daum.net', '01077777817', '19910227', 'Y', '2020-02-17'),
	(47, 'userid47', 'Passwordu47!', '유회원', 'user47@daum.net', '01077777818', '19910228', 'Y', '2020-02-18'),
	(48, 'userid48', 'Passwordu48!', '쥬회원', 'user48@daum.net', '01077777819', '1991031', 'Y', '2020-02-19'),
	(49, 'userid49', 'Passwordu49!', '츄회원', 'user49@daum.net', '01077777820', '1991032', 'N', '2020-02-20'),
	(50, 'userid50', 'Passwordu50!', '큐회원', 'user50@daum.net', '01077777821', '1991033', 'N', '2020-02-21'),
	(51, 'userid51', 'Passwordu51!', '튜회원', 'user51@daum.net', '01077777822', '1991034', 'Y', '2020-02-22'),
	(52, 'userid52', 'Passwordu52!', '퓨회원', 'user52@daum.net', '01077777823', '1991035', 'Y', '2020-02-23'),
	(53, 'userid53', 'Passwordu53!', '휴회원', 'user53@daum.net', '01077777824', '1991036', 'Y', '2020-02-24'),
	(54, 'userid54', 'Passwordu54!', '갸회원', 'user54@daum.net', '01077777825', '1991037', 'Y', '2020-02-25'),
	(55, 'userid55', 'Passwordu55!', '냐회원', 'user55@daum.net', '01077777826', '1991038', 'N', '2020-02-26'),
	(56, 'userid56', 'Passwordu56!', '댜회원', 'user56@daum.net', '01077777827', '1991039', 'Y', '2020-02-27'),
	(57, 'userid57', 'Passwordu57!', '랴회원', 'user57@daum.net', '01077777828', '19910310', 'Y', '2020-02-28'),
	(58, 'userid58', 'Passwordu58!', '먀회원', 'user58@daum.net', '01077777829', '19910311', 'N', '2020-02-29'),
	(59, 'userid59', 'Passwordu59!', '뱌회원', 'user59@daum.net', '01077777830', '19910312', 'Y', '2020-03-01'),
	(60, 'userid60', 'Passwordu60!', '샤회원', 'user60@daum.net', '01077777831', '19910313', 'Y', '2020-03-02'),
	(61, 'userid61', 'Passwordu61!', '야회원', 'user61@daum.net', '01077777832', '19910314', 'Y', '2020-03-03'),
	(62, 'userid62', 'Passwordu62!', '쟈회원', 'user62@daum.net', '01077777833', '19910315', 'Y', '2020-03-04'),
	(63, 'userid63', 'Passwordu63!', '캬회원', 'user63@daum.net', '01077777834', '19910316', 'Y', '2020-03-05');
/*!40000 ALTER TABLE `account_faver` ENABLE KEYS */;

-- 테이블 projecta.account_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_member` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(30) DEFAULT NULL,
  `memberPw` varchar(30) DEFAULT NULL,
  `memberName` varchar(10) DEFAULT NULL,
  `memberEmail` varchar(50) DEFAULT NULL,
  `memberContact` varchar(30) DEFAULT NULL,
  `memberAgree` varchar(1) DEFAULT NULL COMMENT 'Y/N',
  `joinDate` date DEFAULT curdate(),
  PRIMARY KEY (`rowNum`),
  KEY `memberId` (`memberId`),
  KEY `memberPw` (`memberPw`),
  KEY `memberName` (`memberName`),
  KEY `memberEmail` (`memberEmail`),
  KEY `memberContact` (`memberContact`),
  KEY `memberAgree` (`memberAgree`),
  KEY `joinDate` (`joinDate`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_member:~143 rows (대략적) 내보내기
DELETE FROM `account_member`;
/*!40000 ALTER TABLE `account_member` DISABLE KEYS */;
INSERT INTO `account_member` (`rowNum`, `memberId`, `memberPw`, `memberName`, `memberEmail`, `memberContact`, `memberAgree`, `joinDate`) VALUES
	(1, 'ownerid01', 'Passwordo1!', '김점주', 'owner1@naver.com', '01022222222', 'N', '2022-01-05'),
	(2, 'ownerid02', 'Passwordo2!', '박점주', 'owner2@naver.com', '01044444444', 'Y', '2022-01-05'),
	(3, 'ownerid03', 'Passwordo3!', '왕점주', 'owner3@naver.com', '01066666666', 'Y', '2022-01-05'),
	(4, 'ownerid04', 'Passwordo4!', '주점주', 'owner4@naver.com', '01088888888', 'Y', '2022-01-05'),
	(5, 'ownerid05', 'Passwordo5!', '구점주', 'owner5@naver.com', '01010101010', 'Y', '2022-01-08'),
	(6, 'ownerid06', 'Passwordo6!', '외점주', 'owner6@naver.com', '01010101010', 'Y', '2020-01-08'),
	(7, 'ownerid07', 'Passwordo7!', '가점주', 'owner7@naver.com', '01010101011', 'Y', '2020-01-09'),
	(8, 'ownerid08', 'Passwordo8!', '나점주', 'owner8@naver.com', '01010101012', 'Y', '2020-01-10'),
	(9, 'ownerid09', 'Passwordo9!', '다점주', 'owner9@naver.com', '01010101013', 'N', '2020-01-11'),
	(10, 'ownerid10', 'Passwordo10!', '라점주', 'owner10@naver.com', '01010101014', 'Y', '2020-01-12'),
	(11, 'ownerid11', 'Passwordo11!', '마점주', 'owner11@naver.com', '01010101015', 'Y', '2020-01-13'),
	(12, 'ownerid12', 'Passwordo12!', '바점주', 'owner12@naver.com', '01010101016', 'Y', '2020-01-14'),
	(13, 'ownerid13', 'Passwordo13!', '사점주', 'owner13@naver.com', '01010101017', 'Y', '2020-01-15'),
	(14, 'ownerid14', 'Passwordo14!', '아점주', 'owner14@naver.com', '01010101018', 'Y', '2020-01-16'),
	(15, 'ownerid15', 'Passwordo15!', '자점주', 'owner15@naver.com', '01010101019', 'Y', '2020-01-17'),
	(16, 'ownerid16', 'Passwordo16!', '차점주', 'owner16@naver.com', '01010101020', 'Y', '2020-01-18'),
	(17, 'ownerid17', 'Passwordo17!', '카점주', 'owner17@naver.com', '01010101021', 'Y', '2020-01-19'),
	(18, 'ownerid18', 'Passwordo18!', '타점주', 'owner18@naver.com', '01010101022', 'Y', '2020-01-20'),
	(19, 'ownerid19', 'Passwordo19!', '파점주', 'owner19@naver.com', '01010101023', 'Y', '2020-01-21'),
	(20, 'ownerid20', 'Passwordo20!', '하점주', 'owner20@naver.com', '01010101024', 'Y', '2020-01-22'),
	(21, 'ownerid21', 'Passwordo21!', '일점주', 'owner21@naver.com', '01010101025', 'Y', '2020-01-23'),
	(22, 'ownerid22', 'Passwordo22!', '이점주', 'owner22@naver.com', '01010101026', 'Y', '2020-01-24'),
	(23, 'ownerid23', 'Passwordo23!', '삼점주', 'owner23@naver.com', '01010101027', 'Y', '2020-01-25'),
	(24, 'ownerid24', 'Passwordo24!', '사점주', 'owner24@naver.com', '01010101028', 'Y', '2020-01-26'),
	(25, 'ownerid25', 'Passwordo25!', '오점주', 'owner25@naver.com', '01010101029', 'Y', '2020-01-27'),
	(26, 'ownerid26', 'Passwordo26!', '육점주', 'owner26@naver.com', '01010101030', 'Y', '2020-01-28'),
	(27, 'ownerid27', 'Passwordo27!', '칠점주', 'owner27@naver.com', '01010101031', 'Y', '2020-01-29'),
	(28, 'ownerid28', 'Passwordo28!', '팔점주', 'owner28@naver.com', '01010101032', 'Y', '2020-01-30'),
	(29, 'ownerid29', 'Passwordo29!', '구점쥬', 'owner29@naver.com', '01010101033', 'N', '2020-01-31'),
	(30, 'ownerid30', 'Passwordo30!', '십점주', 'owner30@naver.com', '01010101034', 'N', '2020-02-01'),
	(31, 'ownerid31', 'Passwordo31!', '한점주', 'owner31@naver.com', '01010101035', 'Y', '2020-02-02'),
	(32, 'ownerid32', 'Passwordo32!', '두점주', 'owner32@naver.com', '01010101036', 'Y', '2020-02-03'),
	(33, 'ownerid33', 'Passwordo33!', '세점주', 'owner33@naver.com', '01010101037', 'Y', '2020-02-04'),
	(34, 'ownerid34', 'Passwordo34!', '네점주', 'owner34@naver.com', '01010101038', 'Y', '2020-02-05'),
	(35, 'ownerid35', 'Passwordo35!', '다점주', 'owner35@naver.com', '01010101039', 'Y', '2020-02-06'),
	(36, 'ownerid36', 'Passwordo36!', '여점주', 'owner36@naver.com', '01010101040', 'Y', '2020-02-07'),
	(37, 'ownerid37', 'Passwordo37!', '곱점주', 'owner37@naver.com', '01010101041', 'Y', '2020-02-08'),
	(38, 'ownerid38', 'Passwordo38!', '덟점주', 'owner38@naver.com', '01010101042', 'Y', '2020-02-09'),
	(39, 'ownerid39', 'Passwordo39!', '홉점주', 'owner39@naver.com', '01010101043', 'Y', '2020-02-10'),
	(40, 'ownerid40', 'Passwordo40!', '열점주', 'owner40@naver.com', '01010101044', 'Y', '2020-02-11'),
	(41, 'ownerid41', 'Passwordo41!', '누점주', 'owner41@naver.com', '01010101045', 'Y', '2020-02-12'),
	(42, 'ownerid42', 'Passwordo42!', '월점주', 'owner42@naver.com', '01010101046', 'Y', '2020-02-13'),
	(43, 'ownerid43', 'Passwordo43!', '화점주', 'owner43@naver.com', '01010101047', 'Y', '2020-02-14'),
	(44, 'ownerid44', 'Passwordo44!', '수점주', 'owner44@naver.com', '01010101048', 'Y', '2020-02-15'),
	(45, 'ownerid45', 'Passwordo45!', '목점주', 'owner45@naver.com', '01010101049', 'Y', '2020-02-16'),
	(46, 'ownerid46', 'Passwordo46!', '금점주', 'owner46@naver.com', '01010101050', 'Y', '2020-02-17'),
	(47, 'ownerid47', 'Passwordo47!', '토점주', 'owner47@naver.com', '01010101051', 'Y', '2020-02-18'),
	(48, 'ownerid48', 'Passwordo48!', '요점주', 'owner48@naver.com', '01010101052', 'Y', '2020-02-19'),
	(49, 'ownerid49', 'Passwordo49!', '에점주', 'owner49@naver.com', '01010101053', 'Y', '2020-02-20'),
	(50, 'ownerid50', 'Passwordo50!', '비점주', 'owner50@naver.com', '01010101054', 'Y', '2020-02-21'),
	(51, 'ownerid51', 'Passwordo51!', '시점주', 'owner51@naver.com', '01010101055', 'Y', '2020-02-22'),
	(52, 'ownerid52', 'Passwordo52!', '디점주', 'owner52@naver.com', '01010101056', 'Y', '2020-02-23'),
	(53, 'ownerid53', 'Passwordo53!', '프점주', 'owner53@naver.com', '01010101057', 'Y', '2020-02-24'),
	(54, 'ownerid54', 'Passwordo54!', '지점주', 'owner54@naver.com', '01010101058', 'N', '2020-02-25'),
	(55, 'ownerid55', 'Passwordo55!', '치점주', 'owner55@naver.com', '01010101059', 'Y', '2020-02-26'),
	(56, 'ownerid56', 'Passwordo56!', '제점주', 'owner56@naver.com', '01010101060', 'Y', '2020-02-27'),
	(57, 'ownerid57', 'Passwordo57!', '케점주', 'owner57@naver.com', '01010101061', 'Y', '2020-02-28'),
	(58, 'ownerid58', 'Passwordo58!', '엘점주', 'owner58@naver.com', '01010101062', 'Y', '2020-02-29'),
	(59, 'ownerid59', 'Passwordo59!', '엠점주', 'owner59@naver.com', '01010101063', 'Y', '2020-03-01'),
	(60, 'ownerid60', 'Passwordo60!', '엔점주', 'owner60@naver.com', '01010101064', 'Y', '2020-03-02'),
	(61, 'ownerid61', 'Passwordo61!', '피점주', 'owner61@naver.com', '01010101065', 'Y', '2020-03-03'),
	(62, 'ownerid62', 'Passwordo62!', '알점주', 'owner62@naver.com', '01010101066', 'Y', '2020-03-04'),
	(63, 'ownerid63', 'Passwordo63!', '스점주', 'owner63@naver.com', '01010101067', 'Y', '2020-03-05'),
	(64, 'ownerid64', 'Passwordo64!', '티점주', 'owner64@naver.com', '01010101068', 'Y', '2020-03-06'),
	(65, 'ownerid65', 'Passwordo65!', '우점주', 'owner65@naver.com', '01010101069', 'Y', '2020-03-07'),
	(66, 'ownerid66', 'Passwordo66!', '브점주', 'owner66@naver.com', '01010101070', 'N', '2020-03-08'),
	(67, 'ownerid67', 'Passwordo67!', '더점주', 'owner67@naver.com', '01010101071', 'Y', '2020-03-09'),
	(68, 'ownerid68', 'Passwordo68!', '블점주', 'owner68@naver.com', '01010101072', 'Y', '2020-03-10'),
	(69, 'ownerid69', 'Passwordo69!', '엑점주', 'owner69@naver.com', '01010101073', 'Y', '2020-03-11'),
	(70, 'ownerid70', 'Passwordo70!', '스점주', 'owner70@naver.com', '01010101074', 'Y', '2020-03-12'),
	(71, 'ownerid71', 'Passwordo71!', '와점주', 'owner71@naver.com', '01010101075', 'Y', '2020-03-13'),
	(72, 'ownerid72', 'Passwordo72!', '트점주', 'owner72@naver.com', '01010101076', 'Y', '2020-03-14'),
	(73, 'ownerid73', 'Passwordo73!', '킨점주', 'owner73@naver.com', '010101001077', 'Y', '2020-03-15'),
	(74, 'ownerid74', 'Passwordo74!', '혜점주', 'owner74@naver.com', '01010101078', 'Y', '2020-03-16'),
	(75, 'ownerid75', 'Passwordo75!', '융점주', 'owner75@naver.com', '01010101079', 'Y', '2020-03-17'),
	(76, 'ownerid76', 'Passwordo76!', '학점주', 'owner76@naver.com', '01010101080', 'Y', '2020-03-18'),
	(77, 'ownerid77', 'Passwordo77!', '정점주', 'owner77@naver.com', '01010101081', 'Y', '2020-03-19'),
	(78, 'ownerid78', 'Passwordo78!', '숙점주', 'owner78@naver.com', '01010101082', 'Y', '2020-03-20'),
	(79, 'ownerid79', 'Passwordo79!', '녀점주', 'owner79@naver.com', '01010101083', 'N', '2020-03-21'),
	(80, 'ownerid80', 'Passwordo80!', '그점주', 'owner80@naver.com', '01010101084', 'N', '2020-03-22'),
	(81, 'userid01', 'Passwordu1!', '김회원', 'user1@daum.net', '01011111111', 'Y', '2022-01-05'),
	(82, 'userid02', 'Passwordu2!', '박회원', 'user2@daum.net', '01033333333', 'Y', '2022-01-05'),
	(83, 'userid03', 'Passwordu3!', '고회원', 'user3@daum.net', '01055555555', 'Y', '2022-01-05'),
	(84, 'userid04', 'Passwordu4!', '백회원', 'user4@daum.net', '01077777777', 'Y', '2021-01-05'),
	(85, 'userid05', 'Passwordu5!', '민회원', 'user5@daum.net', '01077777777', 'Y', '2022-01-08'),
	(86, 'userid06', 'Passwordu6!', '일회원', 'user6@daum.net', '01077777777', 'Y', '2020-01-08'),
	(87, 'userid07', 'Passwordu7!', '이회원', 'user7@daum.net', '01077777778', 'N', '2020-01-09'),
	(88, 'userid08', 'Passwordu8!', '삼회원', 'user8@daum.net', '01077777779', 'Y', '2020-01-10'),
	(89, 'userid09', 'Passwordu9!', '사회원', 'user9@daum.net', '01077777780', 'Y', '2020-01-11'),
	(90, 'userid10', 'Passwordu10!', '오회원', 'user10@daum.net', '01077777781', 'Y', '2020-01-12'),
	(91, 'userid11', 'Passwordu11!', '육회원', 'user11@daum.net', '01077777782', 'N', '2020-01-13'),
	(92, 'userid12', 'Passwordu12!', '칠회원', 'user12@daum.net', '01077777783', 'Y', '2020-01-14'),
	(93, 'userid13', 'Passwordu13!', '팔회원', 'user13@daum.net', '01077777784', 'Y', '2020-01-15'),
	(94, 'userid14', 'Passwordu14!', '구회원', 'user14@daum.net', '01077777785', 'Y', '2020-01-16'),
	(95, 'userid15', 'Passwordu15!', '십회원', 'user15@daum.net', '01077777786', 'N', '2020-01-17'),
	(96, 'userid16', 'Passwordu16!', '한회원', 'user16@daum.net', '01077777787', 'Y', '2020-01-18'),
	(97, 'userid17', 'Passwordu17!', '두회원', 'user17@daum.net', '01077777788', 'Y', '2020-01-19'),
	(98, 'userid18', 'Passwordu18!', '세회원', 'user18@daum.net', '01077777789', 'Y', '2020-01-20'),
	(99, 'userid19', 'Passwordu19!', '네회원', 'user19@daum.net', '01077777790', 'Y', '2020-01-21'),
	(100, 'userid20', 'Passwordu20!', '다회원', 'user20@daum.net', '01077777791', 'Y', '2020-01-22'),
	(101, 'userid21', 'Passwordu21!', '여회원', 'user21@daum.net', '01077777792', 'Y', '2020-01-23'),
	(102, 'userid22', 'Passwordu22!', '곱회원', 'user22@daum.net', '01077777793', 'Y', '2020-01-24'),
	(103, 'userid23', 'Passwordu23!', '덟회원', 'user23@daum.net', '01077777794', 'N', '2020-01-25'),
	(104, 'userid24', 'Passwordu24!', '홉회원', 'user24@daum.net', '01077777795', 'Y', '2020-01-26'),
	(105, 'userid25', 'Passwordu25!', '열회원', 'user25@daum.net', '01077777796', 'N', '2020-01-27'),
	(106, 'userid26', 'Passwordu26!', '가회원', 'user26@daum.net', '01077777797', 'N', '2020-01-28'),
	(107, 'userid27', 'Passwordu27!', '나회원', 'user27@daum.net', '01077777798', 'Y', '2020-01-29'),
	(108, 'userid28', 'Passwordu28!', '다회원', 'user28@daum.net', '01077777799', 'Y', '2020-01-30'),
	(109, 'userid29', 'Passwordu29!', '라회원', 'user29@daum.net', '01077777800', 'Y', '2020-01-31'),
	(110, 'userid30', 'Passwordu30!', '마회원', 'user30@daum.net', '01077777801', 'Y', '2020-02-01'),
	(111, 'userid31', 'Passwordu31!', '바회원', 'user31@daum.net', '01077777802', 'Y', '2020-02-02'),
	(112, 'userid32', 'Passwordu32!', '사회원', 'user32@daum.net', '01077777803', 'N', '2020-02-03'),
	(113, 'userid33', 'Passwordu33!', '아회원', 'user33@daum.net', '01077777804', 'N', '2020-02-04'),
	(114, 'userid34', 'Passwordu34!', '자회원', 'user34@daum.net', '01077777805', 'Y', '2020-02-05'),
	(115, 'userid35', 'Passwordu35!', '차회원', 'user35@daum.net', '01077777806', 'Y', '2020-02-06'),
	(116, 'userid36', 'Passwordu36!', '카회원', 'user36@daum.net', '01077777807', 'Y', '2020-02-07'),
	(117, 'userid37', 'Passwordu37!', '타회원', 'user37@daum.net', '01077777808', 'Y', '2020-02-08'),
	(118, 'userid38', 'Passwordu38!', '파회원', 'user38@daum.net', '01077777809', 'N', '2020-02-09'),
	(119, 'userid39', 'Passwordu39!', '하회원', 'user39@daum.net', '01077777810', 'Y', '2020-02-10'),
	(120, 'userid40', 'Passwordu40!', '규회원', 'user40@daum.net', '01077777811', 'Y', '2020-02-11'),
	(121, 'userid41', 'Passwordu41!', '뉴회원', 'user41@daum.net', '01077777812', 'Y', '2020-02-12'),
	(122, 'userid42', 'Passwordu42!', '듀회원', 'user42@daum.net', '01077777813', 'N', '2020-02-13'),
	(123, 'userid43', 'Passwordu43!', '류회원', 'user43@daum.net', '01077777814', 'Y', '2020-02-14'),
	(124, 'userid44', 'Passwordu44!', '뮤회원', 'user44@daum.net', '01077777815', 'Y', '2020-02-15'),
	(125, 'userid45', 'Passwordu45!', '뷰회원', 'user45@daum.net', '01077777816', 'Y', '2020-02-16'),
	(126, 'userid46', 'Passwordu46!', '슈회원', 'user46@daum.net', '01077777817', 'Y', '2020-02-17'),
	(127, 'userid47', 'Passwordu47!', '유회원', 'user47@daum.net', '01077777818', 'Y', '2020-02-18'),
	(128, 'userid48', 'Passwordu48!', '쥬회원', 'user48@daum.net', '01077777819', 'Y', '2020-02-19'),
	(129, 'userid49', 'Passwordu49!', '츄회원', 'user49@daum.net', '01077777820', 'N', '2020-02-20'),
	(130, 'userid50', 'Passwordu50!', '큐회원', 'user50@daum.net', '01077777821', 'N', '2020-02-21'),
	(131, 'userid51', 'Passwordu51!', '튜회원', 'user51@daum.net', '01077777822', 'Y', '2020-02-22'),
	(132, 'userid52', 'Passwordu52!', '퓨회원', 'user52@daum.net', '01077777823', 'Y', '2020-02-23'),
	(133, 'userid53', 'Passwordu53!', '휴회원', 'user53@daum.net', '01077777824', 'Y', '2020-02-24'),
	(134, 'userid54', 'Passwordu54!', '갸회원', 'user54@daum.net', '01077777825', 'Y', '2020-02-25'),
	(135, 'userid55', 'Passwordu55!', '냐회원', 'user55@daum.net', '01077777826', 'N', '2020-02-26'),
	(136, 'userid56', 'Passwordu56!', '댜회원', 'user56@daum.net', '01077777827', 'Y', '2020-02-27'),
	(137, 'userid57', 'Passwordu57!', '랴회원', 'user57@daum.net', '01077777828', 'Y', '2020-02-28'),
	(138, 'userid58', 'Passwordu58!', '먀회원', 'user58@daum.net', '01077777829', 'N', '2020-02-29'),
	(139, 'userid59', 'Passwordu59!', '뱌회원', 'user59@daum.net', '01077777830', 'Y', '2020-03-01'),
	(140, 'userid60', 'Passwordu60!', '샤회원', 'user60@daum.net', '01077777831', 'Y', '2020-03-02'),
	(141, 'userid61', 'Passwordu61!', '야회원', 'user61@daum.net', '01077777832', 'Y', '2020-03-03'),
	(142, 'userid62', 'Passwordu62!', '쟈회원', 'user62@daum.net', '01077777833', 'Y', '2020-03-04'),
	(143, 'userid63', 'Passwordu63!', '캬회원', 'user63@daum.net', '01077777834', 'Y', '2020-03-05');
/*!40000 ALTER TABLE `account_member` ENABLE KEYS */;

-- 테이블 projecta.account_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `account_reservation` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `memberBid` varchar(30) DEFAULT NULL,
  `memberName` varchar(30) DEFAULT NULL,
  `restauName` varchar(30) DEFAULT NULL,
  `restauAddr` varchar(100) DEFAULT NULL,
  `reservationDate` date DEFAULT NULL,
  `memberContact` varchar(30) DEFAULT NULL,
  `personnel` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT '결제대기',
  `memberOid` varchar(30) DEFAULT NULL,
  `charge` int(11) DEFAULT 20000,
  `reservationNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowNum`) USING BTREE,
  KEY `FK_account_reservation_restaurent_list_resname` (`restauName`),
  KEY `FK_account_reservation_restaurent_list_resaddr` (`restauAddr`),
  KEY `memberId` (`memberBid`) USING BTREE,
  KEY `FK_account_reservation_restaurent_list_owner` (`memberOid`) USING BTREE,
  KEY `FK_account_reservation_account_faver_name` (`memberName`),
  KEY `FK_account_reservation_account_faver` (`memberContact`),
  CONSTRAINT `FK_account_reservation_account_faver` FOREIGN KEY (`memberContact`) REFERENCES `account_faver` (`memberContact`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_reservation_account_faver_booker` FOREIGN KEY (`memberBid`) REFERENCES `account_faver` (`memberId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_reservation_account_faver_name` FOREIGN KEY (`memberName`) REFERENCES `account_faver` (`memberName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_reservation_restaurent_list_owner` FOREIGN KEY (`memberOid`) REFERENCES `restaurent_list` (`memberId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_reservation_restaurent_list_resaddr` FOREIGN KEY (`restauAddr`) REFERENCES `restaurent_list` (`restauAddr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_account_reservation_restaurent_list_resname` FOREIGN KEY (`restauName`) REFERENCES `restaurent_list` (`restauName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.account_reservation:~4 rows (대략적) 내보내기
DELETE FROM `account_reservation`;
/*!40000 ALTER TABLE `account_reservation` DISABLE KEYS */;
INSERT INTO `account_reservation` (`rowNum`, `memberBid`, `memberName`, `restauName`, `restauAddr`, `reservationDate`, `memberContact`, `personnel`, `status`, `memberOid`, `charge`, `reservationNum`) VALUES
	(5, 'userid01', '김회원', '레니앱', '경기도 분당시 정자동', '2022-01-10', '01011111111', 2, '결제완료', 'ownerid01', 18000, '20220110010111111110046'),
	(6, 'userid01', '김회원', '블랑제리 나정', '경기도 성남시 백현동', '2022-01-12', '01011111111', 3, '결제완료', 'ownerid02', 20000, '20220110010111111110047'),
	(7, 'userid01', '김회원', '리스토란테 라일락', '경기도 수원시 신풍로23번길', '2022-01-10', '01011111111', 1, '결제완료', 'ownerid03', 20000, '20220110010111111110145'),
	(8, 'userid02', '박회원', '타코피에스타', '경기도 안양시 비산동', '2022-01-06', '01033333333', 2, '결제완료', 'ownerid04', 20000, '20220110010333333330206');
/*!40000 ALTER TABLE `account_reservation` ENABLE KEYS */;

-- 테이블 projecta.coupon_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupon_bbs` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `memberId` varchar(30) DEFAULT NULL,
  `createdate` date DEFAULT curdate(),
  `isdelete` varchar(1) DEFAULT 'N' COMMENT 'N/Y',
  `bulletPoint` varchar(50) DEFAULT '레시피' COMMENT '레시피/후기',
  PRIMARY KEY (`num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.coupon_bbs:~135 rows (대략적) 내보내기
DELETE FROM `coupon_bbs`;
/*!40000 ALTER TABLE `coupon_bbs` DISABLE KEYS */;
INSERT INTO `coupon_bbs` (`num`, `title`, `content`, `memberId`, `createdate`, `isdelete`, `bulletPoint`) VALUES
	(1, '에어프라이로 간단한게 만드는 버섯채소구이입니다', '집에 있는 좋아하는<br> 채소 전~부 모아서<br> 먹기 좋게 썰고<br> 에어프라이어에 15분만 돌려주세요<br>비밀 레시피까지는 아니지만<br> 냉털하기 좋아요!<br> 소금, 후추로만 간해도 맛있네요', 'userid01', '2022-01-12', 'N', '레시피'),
	(2, '채식을 위한 고기뺀 "잡채" 당면이 불지 않는 비법', ' 잡채가 생각나면 막상 재료가 없어서 포기하곤 했는데,<br> 어느 날 고기 없이 있는 재료로만 시도해봤어요<br> 생각보다 고기 빈 자리가 안느껴져서 없으면 굳이 안넣어도 되겠구나 싶더라구요<br>  페이버님들도 한 번 만들어보세요<br>', 'userid2', '2022-01-12', 'N', '레시피'),
	(3, '떡꼬치 맛나는 팽이버섯 양념구이', ' 된장찌개에만 넣지말고 팽이 한 번 구워드셔보세여~~~~~~~<br>  떡꼬치 양념 비율로 고추장 1.5 : 물엿 1 : 물 1로 해서 더덕구이처럼 구우면서 바르면 대존맛이에요!!!!!!!!!!!!!!!', 'userid3', '2022-01-12', 'N', '레시피'),
	(4, '시금치를 갈아 넣어 아침식사 대용 빵으로 좋은 시금치롤빵입니다.', '<li>시금치는 끓는물에 30초 정도 데쳐 물기를 꼬옥 짜주세요. </li> <li>데친시금치 100g과 물 60g을 넣어 갈아주세요.</li><li>손바닥을 이용해서 올챙이 모양으로 만들어 주세요.</li><li>밀대로 밀어 삼각형 모양을 만들어 주세요. 돌돌 말아주시면 완성입니다.</li><li>오븐팬에 버터롤을 넣고 2차발효 30~40분 발효해 주세요. 반죽의 2배가 될 때까지 발효해 주세요.</li><li>오븐 180도 12분 정도 구워주세요.</li>', 'userid4', '2022-01-12', 'N', '레시피'),
	(5, '매콤하고 담백한 애호박만두 만드는법 (비건만두, 채식만두, 애호박요리)', '안뇽하세여 페이비님들 만두 레시피 하나 알려드릴게요<br> 만두를 넘 좋아하는데 먹고나면 알 수 없는 더부룩함과 만두 트림이 짜증나더라구요.......ㅠㅠㅠㅠ<br> 고기 대신 고소한 맛나도록 애호박을 잘게 다져서 볶아가지구 넣어봤더니 증말 오집니다<br> 소주가 글라스로 들어가네요 깔깔<br>', 'userid5', '2022-01-12', 'N', '레시피'),
	(6, '지어내기 괴롭다', '레시피다', 'userid6', '2022-01-12', 'N', '레시피'),
	(7, '후기1', '후기입니다', 'userid7', '2022-01-12', 'N', '후기'),
	(8, '후기2', '후기2입니다.', 'userid8', '2022-01-12', 'N', '후기'),
	(9, '레시피1', '레시피1입니다.', 'userid9', '2022-01-12', 'N', '레시피'),
	(10, '레시피2', '레시피2입니다', 'userid10', '2022-01-12', 'N', '레시피'),
	(11, '후기3', '후기3입니다', 'userid11', '2022-01-12', 'N', '후기'),
	(15, '후기3', '후기3입니다', 'userid12', '2022-01-12', 'N', '레시피'),
	(16, '후기4', '후기4입니다', 'userid13', '2022-01-12', 'N', '레시피'),
	(17, '레시피7', '레시피7입니다', 'userid14', '2022-01-12', 'N', '레시피'),
	(18, '레시피8', '레시피8입니다', 'userid15', '2022-01-12', 'N', '레시피'),
	(19, '후기5', '후기5입니다', 'userid16', '2022-01-12', 'N', '레시피'),
	(20, '후기6', '후기6입니다', 'userid17', '2022-01-12', 'N', '레시피'),
	(21, '레시피4', '레시피4입니다', 'userid18', '2022-01-12', 'N', '레시피'),
	(22, '레시피5', '레시피5입니다', 'userid19', '2022-01-12', 'N', '레시피'),
	(23, '레시피6', '레시피6입니다', 'userid20', '2022-01-12', 'N', '레시피'),
	(24, '후기7', '후기7입니다', 'userid21', '2022-01-12', 'N', '레시피'),
	(25, '후기8', '후기8입니다', 'userid22', '2022-01-12', 'N', '레시피'),
	(26, '레시피7', '레시피7입니다', 'userid23', '2022-01-12', 'N', '레시피'),
	(27, '레시피8', '레시피8입니다', 'userid24', '2022-01-12', 'N', '레시피'),
	(28, '레시피9', '레시피9입니다', 'userid25', '2022-01-12', 'N', '레시피'),
	(29, '레시피10', '레시피10입니다', 'userid26', '2022-01-12', 'N', '레시피'),
	(30, '레시피11', '레시피11입니다', 'userid27', '2022-01-12', 'N', '레시피'),
	(31, '레시피12', '레시피12입니다', 'userid28', '2022-01-12', 'N', '레시피'),
	(32, '후기9', '후기9입니다', 'userid29', '2022-01-12', 'N', '레시피'),
	(33, '후기10', '후기10입니다', 'userid30', '2022-01-12', 'N', '레시피'),
	(34, '후기11', '후기11입니다', 'userid31', '2022-01-12', 'N', '레시피'),
	(35, '레시피13', '레시피13입니다', 'userid32', '2022-01-12', 'N', '레시피'),
	(36, '후기12', '후기12입니다', 'userid33', '2022-01-12', 'N', '레시피'),
	(37, '후기13', '후기13입니다', 'userid34', '2022-01-12', 'N', '레시피'),
	(38, '후기14', '후기14입니다', 'userid35', '2022-01-12', 'N', '레시피'),
	(39, '후기15', '후기15입니다', 'userid36', '2022-01-12', 'N', '레시피'),
	(40, '후기16', '후기16입니다', 'userid37', '2022-01-12', 'N', '레시피'),
	(41, '레시피13', '레시피13입니다', 'userid38', '2022-01-12', 'N', '레시피'),
	(42, '레시피14', '레시피14입니다', 'userid39', '2022-01-12', 'N', '레시피'),
	(43, '레시피15', '레시피15입니다', 'userid40', '2022-01-12', 'N', '레시피'),
	(44, '레시피16', '레시피16입니다', 'userid01', '2022-01-12', 'N', '레시피'),
	(45, '레시피17', '레시피17입니다', 'userid2', '2022-01-12', 'N', '레시피'),
	(46, '레시피18', '레시피18입니다', 'userid3', '2022-01-12', 'N', '레시피'),
	(47, '레시피19', '레시피19입니다', 'userid4', '2022-01-12', 'N', '레시피'),
	(48, '레시피20', '레시피20입니다', 'userid5', '2022-01-12', 'N', '레시피'),
	(49, '레시피21', '레시피21입니다', 'userid6', '2022-01-12', 'N', '레시피'),
	(50, '레시피22', '레시피22입니다', 'userid7', '2022-01-12', 'N', '레시피'),
	(51, '레시피23', '레시피23입니다', 'userid8', '2022-01-12', 'N', '레시피'),
	(52, '레시피24', '레시피24입니다', 'userid9', '2022-01-12', 'N', '레시피'),
	(53, '레시피25', '레시피25입니다', 'userid10', '2022-01-12', 'N', '레시피'),
	(54, '레시피26', '레시피26입니다', 'userid11', '2022-01-12', 'N', '레시피'),
	(55, '레시피27', '레시피27입니다', 'userid12', '2022-01-12', 'N', '레시피'),
	(56, '레시피28', '레시피28입니다', 'userid13', '2022-01-12', 'N', '레시피'),
	(57, '레시피29', '레시피29입니다', 'userid14', '2022-01-12', 'N', '레시피'),
	(58, '레시피30', '레시피30입니다', 'userid15', '2022-01-12', 'N', '레시피'),
	(59, '레시피31', '레시피31입니다', 'userid16', '2022-01-12', 'N', '레시피'),
	(60, '레시피32', '레시피32입니다', 'userid17', '2022-01-12', 'N', '레시피'),
	(61, '레시피33', '레시피33입니다', 'userid18', '2022-01-12', 'N', '레시피'),
	(62, '레시피34', '레시피34입니다', 'userid19', '2022-01-12', 'N', '레시피'),
	(63, '레시피35', '레시피35입니다', 'userid20', '2022-01-12', 'N', '레시피'),
	(64, '레시피36', '레시피36입니다', 'userid21', '2022-01-12', 'N', '레시피'),
	(65, '레시피37', '레시피37입니다', 'userid22', '2022-01-12', 'N', '레시피'),
	(66, '레시피38', '레시피38입니다', 'userid23', '2022-01-12', 'N', '레시피'),
	(67, '레시피39', '레시피39입니다', 'userid24', '2022-01-12', 'N', '레시피'),
	(68, '레시피40', '레시피40입니다', 'userid25', '2022-01-12', 'N', '레시피'),
	(69, '레시피41', '레시피41입니다', 'userid26', '2022-01-12', 'N', '레시피'),
	(70, '레시피42', '레시피42입니다', 'userid27', '2022-01-12', 'N', '레시피'),
	(71, '레시피43', '레시피43입니다', 'userid28', '2022-01-12', 'N', '레시피'),
	(72, '레시피44', '레시피44입니다', 'userid29', '2022-01-12', 'N', '레시피'),
	(73, '레시피45', '레시피45입니다', 'userid30', '2022-01-12', 'N', '레시피'),
	(74, '레시피46', '레시피46입니다', 'userid31', '2022-01-12', 'N', '레시피'),
	(75, '레시피47', '레시피47입니다', 'userid32', '2022-01-12', 'N', '레시피'),
	(76, '레시피48', '레시피48입니다', 'userid33', '2022-01-12', 'N', '레시피'),
	(77, '레시피49', '레시피49입니다', 'userid34', '2022-01-12', 'N', '레시피'),
	(78, '레시피50', '레시피50입니다', 'userid35', '2022-01-12', 'N', '레시피'),
	(79, '레시피51', '레시피51입니다', 'userid36', '2022-01-12', 'N', '레시피'),
	(80, '레시피52', '레시피52입니다', 'userid37', '2022-01-12', 'N', '레시피'),
	(81, '레시피53', '레시피53입니다', 'userid38', '2022-01-12', 'N', '레시피'),
	(82, '레시피54', '레시피54입니다', 'userid39', '2022-01-12', 'N', '레시피'),
	(83, '레시피55', '레시피55입니다', 'userid40', '2022-01-12', 'N', '레시피'),
	(84, '레시피56', '레시피56입니다', 'userid1', '2022-01-12', 'N', '레시피'),
	(85, '레시피57', '레시피57입니다', 'userid2', '2022-01-12', 'N', '레시피'),
	(86, '레시피58', '레시피58입니다', 'userid3', '2022-01-12', 'N', '레시피'),
	(87, '레시피59', '레시피59입니다', 'userid4', '2022-01-12', 'N', '레시피'),
	(88, '레시피60', '레시피60입니다', 'userid5', '2022-01-12', 'N', '레시피'),
	(89, '레시피61', '레시피61입니다', 'userid6', '2022-01-12', 'N', '레시피'),
	(90, '레시피62', '레시피62입니다', 'userid7', '2022-01-12', 'N', '레시피'),
	(91, '레시피63', '레시피63입니다', 'userid8', '2022-01-12', 'N', '레시피'),
	(92, '레시피64', '레시피64입니다', 'userid9', '2022-01-12', 'N', '레시피'),
	(93, '레시피65', '레시피65입니다', 'userid10', '2022-01-12', 'N', '레시피'),
	(94, '레시피66', '레시피66입니다', 'userid11', '2022-01-12', 'N', '레시피'),
	(95, '레시피67', '레시피67입니다', 'userid12', '2022-01-12', 'N', '레시피'),
	(96, '레시피68', '레시피68입니다', 'userid13', '2022-01-12', 'N', '레시피'),
	(97, '레시피69', '레시피69입니다', 'userid14', '2022-01-12', 'N', '레시피'),
	(98, '레시피70', '레시피70입니다', 'userid15', '2022-01-12', 'N', '레시피'),
	(99, '레시피71', '레시피71입니다', 'userid16', '2022-01-12', 'N', '레시피'),
	(100, '레시피72', '레시피72입니다', 'userid17', '2022-01-12', 'N', '레시피'),
	(101, '레시피73', '레시피73입니다', 'userid18', '2022-01-12', 'N', '레시피'),
	(102, '레시피74', '레시피74입니다', 'userid19', '2022-01-12', 'N', '레시피'),
	(103, '레시피75', '레시피75입니다', 'userid20', '2022-01-12', 'N', '레시피'),
	(104, '레시피76', '레시피76입니다', 'userid21', '2022-01-12', 'N', '레시피'),
	(105, '레시피77', '레시피77입니다', 'userid22', '2022-01-12', 'N', '레시피'),
	(106, '레시피78', '레시피78입니다', 'userid23', '2022-01-12', 'N', '레시피'),
	(107, '레시피79', '레시피79입니다', 'userid24', '2022-01-12', 'N', '레시피'),
	(108, '레시피80', '레시피80입니다', 'userid25', '2022-01-12', 'N', '레시피'),
	(109, '레시피81', '레시피81입니다', 'userid26', '2022-01-12', 'N', '레시피'),
	(110, '레시피82', '레시피82입니다', 'userid27', '2022-01-12', 'N', '레시피'),
	(111, '레시피83', '레시피83입니다', 'userid28', '2022-01-12', 'N', '레시피'),
	(112, '레시피84', '레시피84입니다', 'userid29', '2022-01-12', 'N', '레시피'),
	(113, '레시피85', '레시피85입니다', 'userid30', '2022-01-12', 'N', '레시피'),
	(114, '레시피86', '레시피86입니다', 'userid31', '2022-01-12', 'N', '레시피'),
	(115, '레시피87', '레시피87입니다', 'userid32', '2022-01-12', 'N', '레시피'),
	(116, '레시피88', '레시피88입니다', 'userid33', '2022-01-12', 'N', '레시피'),
	(117, '레시피89', '레시피89입니다', 'userid34', '2022-01-12', 'N', '레시피'),
	(118, '레시피90', '레시피90입니다', 'userid35', '2022-01-12', 'N', '레시피'),
	(119, '레시피91', '레시피91입니다', 'userid36', '2022-01-12', 'N', '레시피'),
	(120, '레시피92', '레시피92입니다', 'userid37', '2022-01-12', 'N', '레시피'),
	(121, '레시피93', '레시피93입니다', 'userid38', '2022-01-12', 'N', '레시피'),
	(122, '레시피94', '레시피94입니다', 'userid39', '2022-01-12', 'N', '레시피'),
	(123, '레시피95', '레시피95입니다', 'userid40', '2022-01-12', 'N', '레시피'),
	(124, '레시피96', '레시피96입니다', 'userid1', '2022-01-12', 'N', '레시피'),
	(125, '레시피97', '레시피97입니다', 'userid2', '2022-01-12', 'N', '레시피'),
	(126, '레시피98', '레시피98입니다', 'userid3', '2022-01-12', 'N', '레시피'),
	(127, '레시피99', '레시피99입니다', 'userid4', '2022-01-12', 'N', '레시피'),
	(128, '레시피100', '레시피100입니다', 'userid5', '2022-01-12', 'N', '레시피'),
	(129, '레시피101', '레시피101입니다', 'userid6', '2022-01-12', 'N', '레시피'),
	(130, '레시피102', '레시피102입니다', 'userid7', '2022-01-12', 'N', '레시피'),
	(131, '레시피103', '레시피103입니다', 'userid8', '2022-01-12', 'N', '레시피'),
	(132, '레시피104', '레시피104입니다', 'userid9', '2022-01-12', 'N', '레시피'),
	(133, '레시피105', '레시피105입니다', 'userid10', '2022-01-12', 'N', '레시피'),
	(134, '레시피106', '레시피106입니다', 'userid11', '2022-01-12', 'N', '레시피'),
	(135, '레시피107', '레시피107입니다', 'userid12', '2022-01-12', 'N', '레시피'),
	(136, '레시피108', '레시피108입니다', 'userid13', '2022-01-12', 'N', '레시피'),
	(137, '레시피109', '레시피109입니다', 'userid14', '2022-01-12', 'N', '레시피'),
	(138, '레시피110', '레시피110입니다', 'userid01', '2022-01-12', 'N', '후기'),
	(139, '새글 포스트 테스트1', '새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1\r\n새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1\r\n새글 포스트 테스트1새글 포스트 테스트1새글 포스트 테스트1', 'userid01', '2022-01-13', 'N', '후기');
/*!40000 ALTER TABLE `coupon_bbs` ENABLE KEYS */;

-- 테이블 projecta.coupon_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupon_list` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `couponNum` varchar(50) NOT NULL,
  `couponName` varchar(50) NOT NULL,
  `couponDC` decimal(3,1) NOT NULL,
  `couponMax` int(11) NOT NULL,
  `couponExpire` varchar(10) NOT NULL,
  PRIMARY KEY (`rowNum`),
  KEY `couponNum` (`couponNum`),
  KEY `couponName` (`couponName`),
  KEY `couponMax` (`couponMax`),
  KEY `couponExpire` (`couponExpire`),
  KEY `couponDc` (`couponDC`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.coupon_list:~5 rows (대략적) 내보내기
DELETE FROM `coupon_list`;
/*!40000 ALTER TABLE `coupon_list` DISABLE KEYS */;
INSERT INTO `coupon_list` (`rowNum`, `couponNum`, `couponName`, `couponDC`, `couponMax`, `couponExpire`) VALUES
	(1, '221201221231105000', '연말10% 할인쿠폰', 0.1, 5000, '2022-12-31'),
	(2, '2201012212312010000', '신규가입 20% 할인쿠폰', 0.2, 10000, '2022-12-31'),
	(3, '2212012212315020000', '투표참여 50% 할인쿠폰', 0.5, 20000, '2022-12-31'),
	(4, '221101221130105000', '레시피등록 10% 쿠폰', 0.1, 5000, '2022-11-30'),
	(5, '221130221231105000', '뉴페이비 대상 10% 할인쿠폰', 0.1, 5000, '2022-12-31');
/*!40000 ALTER TABLE `coupon_list` ENABLE KEYS */;

-- 테이블 projecta.festival_domestic 구조 내보내기
CREATE TABLE IF NOT EXISTS `festival_domestic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(10) NOT NULL,
  `site` varchar(70) NOT NULL,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.festival_domestic:~3 rows (대략적) 내보내기
DELETE FROM `festival_domestic`;
/*!40000 ALTER TABLE `festival_domestic` DISABLE KEYS */;
INSERT INTO `festival_domestic` (`id`, `city`, `site`, `title`) VALUES
	(1, '광주', 'https://kimchi.gwangju.go.kr/', '세계김치축제'),
	(2, '서울', 'http://www.salonduchocolat.kr/', '샬롱 뒤 쇼콜라 '),
	(3, '논산', 'http://www.nonsan.go.kr/ensfestival/', '딸기 축제');
/*!40000 ALTER TABLE `festival_domestic` ENABLE KEYS */;

-- 테이블 projecta.festival_foreign 구조 내보내기
CREATE TABLE IF NOT EXISTS `festival_foreign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(10) NOT NULL,
  `site` varchar(70) NOT NULL,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.festival_foreign:~3 rows (대략적) 내보내기
DELETE FROM `festival_foreign`;
/*!40000 ALTER TABLE `festival_foreign` DISABLE KEYS */;
INSERT INTO `festival_foreign` (`id`, `city`, `site`, `title`) VALUES
	(1, '스페인', 'https://www.tomatina.es/en/', '라 토마티나'),
	(2, '프랑스', 'https://www.fete-du-citron.com/', '망통 레몬 축제'),
	(3, '태국', 'https://www.phuketvegetarian.com/', '푸켓 채식주의자 축제');
/*!40000 ALTER TABLE `festival_foreign` ENABLE KEYS */;

-- 테이블 projecta.restaurent_candidate 구조 내보내기
CREATE TABLE IF NOT EXISTS `restaurent_candidate` (
  `candiNum` int(11) NOT NULL AUTO_INCREMENT,
  `candidate` varchar(30) NOT NULL,
  `candiCnt` int(11) NOT NULL,
  `candiImg` varchar(50) NOT NULL,
  `candiIntro` varchar(60) NOT NULL,
  `candiAddr` varchar(60) NOT NULL,
  `candiMenu` varchar(100) NOT NULL,
  PRIMARY KEY (`candiNum`),
  KEY `candidate` (`candidate`),
  KEY `candiCnt` (`candiCnt`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.restaurent_candidate:~6 rows (대략적) 내보내기
DELETE FROM `restaurent_candidate`;
/*!40000 ALTER TABLE `restaurent_candidate` DISABLE KEYS */;
INSERT INTO `restaurent_candidate` (`candiNum`, `candidate`, `candiCnt`, `candiImg`, `candiIntro`, `candiAddr`, `candiMenu`) VALUES
	(1, '다이너재키', 0, 'choice1.png', '페스코도 즐길 수 있는 식단', '서울 마포구', '#해산물볶음국수 #갈릭새우덮밥 #토마토새우커리'),
	(2, '페스코비건즈', 0, 'choice2.png', '비리지 않은 페스코 햄버거', '서울 강남구', '#아보카도클래식버거 #연어라이스보울 #오징어튀김'),
	(3, '달맞이', 0, 'choice3.png', '숙성 참돔 & 화이트 와인', '서울시 강남구', '#숙성회 #참돔 #연어'),
	(4, '회현식당', 0, 'choice4.png', '생선으로만 한 상 먹기', '서울 중구', '#생선요리한상 #장어구이 #고등어절임'),
	(5, '마라도 회식당', 1, 'choice5.png', '생활의 달인 물회!', '경북 포항시', '#최강달인물회 #모듬회'),
	(6, '로컬릿', 0, 'choice6.png', '페스코 스타일 파인다이닝', '서울 성동구', '#가지라자냐 #시금치뇨끼 #호박까넬로니');
/*!40000 ALTER TABLE `restaurent_candidate` ENABLE KEYS */;

-- 테이블 projecta.restaurent_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `restaurent_list` (
  `rowNum` int(11) NOT NULL AUTO_INCREMENT,
  `restauName` varchar(30) DEFAULT NULL,
  `restauAddr` varchar(50) DEFAULT NULL,
  `restauLat` decimal(9,7) DEFAULT NULL,
  `restauLng` decimal(10,7) DEFAULT NULL,
  `restauCity` varchar(5) DEFAULT NULL,
  `restauImg1` varchar(20) DEFAULT NULL,
  `restauImg2` varchar(20) DEFAULT NULL,
  `restauImg3` varchar(20) DEFAULT NULL,
  `restauStyle` varchar(10) DEFAULT NULL,
  `restauMenu` varchar(30) DEFAULT NULL,
  `memberId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rowNum`) USING BTREE,
  KEY `restauName` (`restauName`),
  KEY `restauAddr` (`restauAddr`),
  KEY `restauImg1` (`restauImg1`),
  KEY `restauImg2` (`restauImg2`),
  KEY `restauImg3` (`restauImg3`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `FK_restaurent_list_account_favee` FOREIGN KEY (`memberId`) REFERENCES `account_favee` (`memberId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_restaurent_list_account_favee_restauaddr` FOREIGN KEY (`restauAddr`) REFERENCES `account_favee` (`restauAddr`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_restaurent_list_account_favee_restauname` FOREIGN KEY (`restauName`) REFERENCES `account_favee` (`restauName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.restaurent_list:~80 rows (대략적) 내보내기
DELETE FROM `restaurent_list`;
/*!40000 ALTER TABLE `restaurent_list` DISABLE KEYS */;
INSERT INTO `restaurent_list` (`rowNum`, `restauName`, `restauAddr`, `restauLat`, `restauLng`, `restauCity`, `restauImg1`, `restauImg2`, `restauImg3`, `restauStyle`, `restauMenu`, `memberId`) VALUES
	(1, '레니앱', '경기도 분당시 정자동', 37.3602395, 127.1046884, '경기', 'kk1-1', 'kk1-2', 'kk1-3', '플렉시', '#채식부리또 #비건크런치 #치미창가', 'ownerid01'),
	(2, '블랑제리 나정', '경기도 성남시 백현동', 37.3867870, 127.1153260, '경기', 'kk2-1', 'kk2-2', 'kk2-3', '비건', '#올리브치아바타 #통옥수수식빵', 'ownerid02'),
	(3, '리스토란테 라일락', '경기도 수원시 신풍로23번길', 37.2841902, 127.0127749, '경기', 'kk3-1', 'kk3-2', 'kk3-3', '플렉시', '#오레끼에떼 #어란파스타 #가지구이', 'ownerid03'),
	(4, '타코피에스타', '경기도 안양시 비산동', 37.3927110, 126.9541589, '경기', 'kk4-1', 'kk4-2', 'kk4-3', '플렉시', '#새우타코 #치킨부리또 #치미창가', 'ownerid04'),
	(5, '마마앤파파', '경기도 안산시 상록구 이동', 37.3056540, 126.8587443, '경기', 'kk5-1', 'kk5-2', 'kk5-3', '락토오보', '#버섯크림리조또 #보리커피 #현미떡국', 'ownerid05'),
	(6, '비건비긴즈', '경기도 수원시 영통구 이의동', 37.2925565, 127.0498630, '경기', 'kk6-1', 'kk6-2', 'kk6-3', '플렉시', '#크래미펌킨샐러드 #카프레제', 'ownerid06'),
	(7, '두르가', '경기도 의정부시 의정부동 태평로', 37.7386799, 127.0486109, '경기', 'kk7-1', 'kk7-2', 'kk7-3', '폴로', '#버터라이스 #갈릭 난 #시금치커리', 'ownerid07'),
	(8, '향촌', '경기도 남양주시 별내면 송산로', 37.6977595, 127.1255398, '경기', 'kk8-1', 'kk8-2', 'kk8-3', '플렉시', '#만두전골 #수수부꾸미 #팥죽', 'ownerid08'),
	(9, '싸왓디', '경기도 평택시 신장돈 중앙신장로', 37.0793830, 127.0500226, '경기', 'kk9-1', 'kk9-2', 'kk9-3', '폴로', '#똠얌꿍 #팟타이 #팟퐁커리', 'ownerid09'),
	(10, '몽가타', '경기도 군포시 산본동', 37.3588485, 126.9322281, '경기', 'kk10-1', 'kk10-2', 'kk10-3', '비건', '#샐러리국수 #버섯콜리플라워', 'ownerid10'),
	(11, '옥토가', '부산광역시 수영구 광안동', 35.1604733, 129.1092655, '부산', 'busan1-1', 'busan1-2', 'busan1-3', '비건', '#우리밀스콘 #베리크럼블 #현미호감', 'ownerid11'),
	(12, '다전', '부산광역시 부산진구 부전2동', 35.1535620, 129.0583060, '부산', 'busan2-1', 'busan2-2', 'busan2-3', '락토오보', '#콩스테이크 #밀불구이 #콩개장', 'ownerid12'),
	(13, '노미트버거헬스', '부산광역시 해운대구 좌1동', 35.1633374, 129.0830356, '부산', 'busan3-1', 'busan3-2', 'busan3-3', '페스코', '#노미트라멘 #콩불고기버거', 'ownerid13'),
	(14, '베지나랑', '부산광역시 수영구', 35.1566330, 129.1321233, '부산', 'busan4-1', 'busan4-2', 'busan4-3', '락토', '#無오신채 #버섯콩나물찜 #누룽지탕', 'ownerid14'),
	(15, '나유타카페', '부산광역시 금정구 장전동', 35.2374078, 129.0834787, '부산', 'busan5-1', 'busan5-2', 'busan5-3', '락토', '#톳밥 #토마토커리 #뿌리채소감바스', 'ownerid15'),
	(16, '에코토피아', '부산광역시 수영구 남천동', 35.1414881, 129.1073501, '부산', 'busan6-1', 'busan6-2', 'busan6-3', '오보', '#라따뚜이 #채소그라탕 #감자라면', 'ownerid16'),
	(17, '밀한줌', '부산광역시 동래구 안락동', 35.1915843, 129.1024699, '부산', 'busan7-1', 'busan7-2', 'busan7-3', '락토오보', '#쑥콩버무리 #호두깜빠뉴 #호밀스틱', 'ownerid17'),
	(18, '홈비스트로카페', '부산광역시 해운대구 번길', 35.1429027, 129.1069386, '부산', 'busan8-1', 'busan8-2', 'busan8-3', '락토', '#민트맥주 #쑥샌드위치 #타코', 'ownerid18'),
	(19, '꼬까자', '부산광역시 전포동 전포대로', 35.1531569, 129.0669363, '부산', 'busan9-1', 'busan9-2', 'busan9-3', '폴로', '#화과자 #꽃잎차', 'ownerid19'),
	(20, '펀자브', '부산광역시 해운대구 중1동', 35.1613821, 129.1588429, '부산', 'busan10-1', 'busan10-2', 'busan10-3', '플렉시', '#버터치킨커리 #치킨마살라 #라씨', 'ownerid20'),
	(21, '여울목', '충북 청주시 상당구', 36.6278645, 127.5124982, '청주', 'cj1-1', 'cj1-2', 'cj1-3', '플렉시', '#한정식 #양념게장 #간장게장', 'ownerid21'),
	(22, '오프리', '충북 청주시 흥덕구', 36.6202716, 127.4276199, '청주', 'cj2-1', 'cj2-2', 'cj2-3', '비건', '#당근케익 #단호박쿠키 #사과크럼블', 'ownerid22'),
	(23, '여누', '충북 청주시 흥덕구 북대동', 36.6310067, 127.4371099, '청주', 'cj3-1', 'cj3-2', 'cj3-3', '비건', '#노미트라멘 #콩불고기버거', 'ownerid23'),
	(24, '미녀는 숙주를 좋아해', '충북 청주시 흥덕구 운천동', 36.6475025, 127.4752169, '청주', 'cj4-1', 'cj4-2', 'cj4-3', '플렉시', '#꼬막초무침 #고사리고등어조림', 'ownerid24'),
	(25, '라피자', '충북 청주시 흥덕구 운천동', 36.6434993, 127.4826540, '청주', 'cj5-1', 'cj5-2', 'cj5-3', '페스코', '#뿌리채소피자 #크림파스타 #새우파스타', 'ownerid25'),
	(26, '고향칼국수', '충북 청주시 서원구 개신동', 36.6228342, 127.4377920, '청주', 'cj6-1', 'cj6-2', 'cj6-3', '플렉시', '#칼국수 #칼만두 #찐만두', 'ownerid26'),
	(27, '랭고스버거', '충북 청주시 상당구 북문로', 36.6372823, 127.4854664, '청주', 'cj7-1', 'cj7-2', 'cj7-3', '플렉시', '#가지버거 #마일드치즈버거 #에이플치킨버거', 'ownerid27'),
	(28, '밸런스', '충북 청주시 청원구 율량동', 36.6555400, 127.4433507, '청주', 'cj8-1', 'cj8-2', 'cj8-3', '페스코', '#두부샐러드 #마늘버섯샐러드 #버터새우', 'ownerid28'),
	(29, '행포케 용암점', '충북 청주시 서원구 용암동', 36.6082685, 127.4980339, '청주', 'cj9-1', 'cj9-2', 'cj9-3', '페스코', '#연어포케 #연두부샐러드', 'ownerid29'),
	(30, '행포케 충북대점', '충북 청주시 서원구 사창동', 36.6283874, 127.4815395, '청주', 'cj10-1', 'cj10-2', 'cj10-3', '페스코', '#아보카도에그 #간장연어포케', 'ownerid30'),
	(31, '러빙헛 송촌점', '대전광역시 대덕구 중리동', 36.3645182, 127.4363881, '대전', 'dj1-1', 'dj1-2', 'dj1-3', '비건', '#콩불고기 #콩나물비빔밥 #팥칼국수', 'ownerid31'),
	(32, '비건바닐라', '대전광역시 서구 갈마동', 36.3562582, 127.3713402, '대전', 'dj2-1', 'dj2-2', 'dj2-3', '비건', '#당근케익 #단호박쿠키 #사과크럼블', 'ownerid32'),
	(33, '세이비건', '대전광역시 유성구 노은동', 36.3745630, 127.3038469, '대전', 'dj3-1', 'dj3-2', 'dj3-3', '비건', '#당근케익 #깻잎키쉬 #뽕잎빵', 'ownerid33'),
	(34, '선오가닉키친', '대전광역시 유성구 지족동', 36.3700858, 127.3145016, '대전', 'dj4-1', 'dj4-2', 'dj4-3', '플렉시', '#콩나물비빔밥 #돌솥비빔밥', 'ownerid34'),
	(35, '인디 둔산점', '대전광역시 서구 둔산동', 36.3548560, 127.3799640, '대전', 'dj5-1', 'dj5-2', 'dj5-3', '폴로', '#커리 #탄두리프로운', 'ownerid35'),
	(36, '도연제', '대전광역시 유성구 죽동', 36.3793556, 127.3227028, '대전', 'dj6-1', 'dj6-2', 'dj6-3', '프루테리언', '#쑥흑임자타르트 #딸기유자타르트', 'ownerid36'),
	(37, '풀향기 채식뷔페', '대전광역시 대덕구 중리동', 36.3413294, 127.3878203, '대전', 'dj7-1', 'dj7-2', 'dj7-3', '플렉시', '#버섯탕수 #가지튀김', 'ownerid37'),
	(38, '가남지', '대전광역시 대덕구 중리동', 36.3857402, 127.3784976, '대전', 'dj8-1', 'dj8-2', 'dj8-3', '플렉시', '#파인애플볶음밥 #해물쌀국수', 'ownerid38'),
	(39, '콩사랑 굴내음', '대전광역시 유성구 어은로', 36.3621259, 127.3541300, '대전', 'dj9-1', 'dj9-2', 'dj9-3', '폴로', '#굴순두부 #바지락순두부 #굴해장국', 'ownerid39'),
	(40, '고단백식당', '대전광역시 중구 대종로', 36.3285061, 127.4205012, '대전', 'dj10-1', 'dj10-2', 'dj10-3', '비건', '#노란콩국수 #검은콩국수', 'ownerid40'),
	(41, '카페901', '제주시 노형동', 33.4526692, 126.4860170, '제주', 'jj1-1', 'jj1-2', 'jj1-3', '비건', '#에너지비건스프 #하티스프', 'ownerid41'),
	(42, '작은부엌', '제주시 조천읍 선흘동2길', 33.5115155, 126.7061319, '제주', 'jj2-1', 'jj2-2', 'jj2-3', '비건', '#들꽃현미비빔밥 #현미떡볶이', 'ownerid42'),
	(43, '비건테이블 바람', '제주시 애월읍 납읍리', 33.4422078, 126.3281165, '제주', 'jj3-1', 'jj3-2', 'jj3-3', '비건', '#현미야채비빔밥 #오일스파게티', 'ownerid43'),
	(44, '일도촌', '제주시 일도2동', 33.5026673, 126.5432078, '제주', 'jj4-1', 'jj4-2', 'jj4-3', '페스코', '#삼치회', 'ownerid44'),
	(45, '고르멍드르멍', '제주시 용담삼동', 33.5152008, 126.5015759, '제주', 'jj5-1', 'jj5-2', 'jj5-3', '페스코', '#깅이죽 #성게미역국', 'ownerid45'),
	(46, '제라진밥상', '제주시 조천읍 함와로', 33.5395920, 126.6740612, '제주', 'jj6-1', 'jj6-2', 'jj6-3', '폴로', '#가정식뷔페', 'ownerid46'),
	(47, '메밀꽃제주', '제주시 조천읍 와흘리', 33.5015902, 126.6376635, '제주', 'jj7-1', 'jj7-2', 'jj7-3', '폴로', '#메밀막국수 #메밀만두국', 'ownerid47'),
	(48, '제주소녀', '제주시 구좌읍 평대리', 33.4946852, 126.8104836, '제주', 'jj8-1', 'jj8-2', 'jj8-3', '비건', '#감자치아바타 #두부크림케익', 'ownerid48'),
	(49, '관덕정분식', '제주시 관덕로8길', 33.5125962, 126.5242954, '제주', 'jj9-1', 'jj9-2', 'jj9-3', '페스코', '#모닥치기 #한치튀김 #유부주먹밥', 'ownerid49'),
	(50, '앤드유', '제주시 한림읍 한림로', 33.4045589, 126.2538478, '제주', 'jj10-1', 'jj10-2', 'jj10-3', '페스코', '#콩버거함박 #새우앤웨지 #비건불고기', 'ownerid50'),
	(51, '채식주의자의무화과', '전주시 중화산동2가', 35.8157394, 127.1282949, '전주', 'jnj1-1', 'jnj1-2', 'jnj1-3', '락토', '#보리커피 #쑥카스테라 #까눌레', 'ownerid51'),
	(52, '플랜티카', '전주시 중앙동3가', 35.8176249, 127.1439168, '전주', 'jnj2-1', 'jnj2-2', 'jnj2-3', '락토오보', '#토마토크림스프 #시나몬롤', 'ownerid52'),
	(53, '라므아르', '전주시 금암1동', 35.8376621, 127.1332562, '전주', 'jnj3-1', 'jnj3-2', 'jnj3-3', '비건', '#산딸기레드벨벳 #호구마케이크', 'ownerid53'),
	(54, '감로헌', '전주시 금암1동', 35.8393882, 127.1318236, '전주', 'jnj4-1', 'jnj4-2', 'jnj4-3', '폴로', '#더덕구이 #표고탕수 #콩찹스테이크', 'ownerid54'),
	(55, '투비', '전주시 완산구 평화동1가', 35.7931803, 127.1374720, '전주', 'jnj5-1', 'jnj5-2', 'jnj5-3', '락토오보', '#브루키 #올리브빵 #흑미식빵', 'ownerid55'),
	(56, '마치래빗 전주점', '전주시 완산구 효자동2가', 35.8153598, 127.1047832, '전주', 'jnj6-1', 'jnj6-2', 'jnj6-3', '폴로', '#연어샌드위치 #볼로네제 #치도', 'ownerid56'),
	(57, '더 비거닝', '전주시 완산구 솟대1길', 35.7928421, 127.1197371, '전주', 'jnj7-1', 'jnj7-2', 'jnj7-3', '비건', '#감자치아바타 #바질모닝빵', 'ownerid57'),
	(58, '풀꽃세상채식뷔페', '전주시 완산구 중인동', 35.7793562, 127.1065184, '전주', 'jnj8-1', 'jnj8-2', 'jnj8-3', '비건', '#당근식빵 #시금치식빵 #참깨식빵', 'ownerid58'),
	(59, '이너프샐러드', '전주시 덕진구 명륜4길', 35.8437470, 127.1265410, '전주', 'jnj9-1', 'jnj9-2', 'jnj9-3', '폴로', '#버섯가지샐러드 #닭가슴살샐러드', 'ownerid59'),
	(60, '진미반점', '전주시 완산구 전라감영3길', 35.8165794, 127.1431393, '전주', 'jnj10-1', 'jnj10-2', 'jnj10-3', '비건', '#물짜장 #가지튀김 #마파두부', 'ownerid60'),
	(61, '송이버섯마을', '양양군 양양읍 월리', 38.0650413, 128.6204981, '강원', 'kw1-1', 'kw1-2', 'kw1-3', '플렉시', '#송이전골 #송이샤브 #송이불고기', 'ownerid61'),
	(62, '동화가든', '강릉시 초당동', 37.7911139, 128.9146619, '강원', 'kw2-1', 'kw2-2', 'kw2-3', '비건', '#짬뽕순두부 #초두부 #모두부', 'ownerid62'),
	(63, '큰기와집', '강릉시 강동면 정동진리', 37.7023477, 129.0153242, '강원', 'kw3-1', 'kw3-2', 'kw3-3', '페스코', '#전복순두부전골 #해물수제비', 'ownerid63'),
	(64, '선크림젤라또', '속초시 조양동', 38.1862379, 128.6020386, '강원', 'kw4-1', 'kw4-2', 'kw4-3', '락토오보', '#팥젤라또 #쌀젤라또 #쑥젤라또', 'ownerid64'),
	(65, '주천묵집', '영월군 주천면 송학주천로', 37.2604505, 128.2610242, '강원', 'kw5-1', 'kw5-2', 'kw5-3', '비건', '#채묵비빔밥 #도토리탕수육 #묵무침', 'ownerid65'),
	(66, '카페루루흐', '속초시 만천1길', 38.2008894, 128.5766249, '강원', 'kw6-1', 'kw6-2', 'kw6-3', '비건', '#두유요거트 #유자머핀 #라임스콘', 'ownerid66'),
	(67, '점봉산산채식당', '속초시 이목로', 38.1994605, 128.5498945, '강원', 'kw7-1', 'kw7-2', 'kw7-3', '페스코', '#산채정식 #황태해장국', 'ownerid67'),
	(68, '엄지네 포장마차', '강릉시 남포동', 37.7664988, 128.9045481, '강원', 'kw8-1', 'kw8-2', 'kw8-3', '페스코', '#꼬막무침 #생굴무침 #꽃게탕', 'ownerid68'),
	(69, '감나무집', '양양군 양양읍', 38.0702965, 128.6277002, '강원', 'kw9-1', 'kw9-2', 'kw9-3', '페스코', '#황태해장국 #가자미구이 #해물뚝배기', 'ownerid69'),
	(70, '영광정 메밀국수', '양양군 강현면 진미로', 38.1225898, 128.5759000, '강원', 'kw10-1', 'kw10-2', 'kw10-3', '페스코', '#메밀국수 #감자전 #메밀전병', 'ownerid70'),
	(71, '발우공양', '서울시 종로구 견지동', 37.5739027, 126.9830339, '서울', 'su1-1', 'su1-2', 'su1-3', '비건', '#모듬버섯강정 #우엉양념구이 #흑임자더덕', 'ownerid71'),
	(72, '망넛이네', '서울시 서대문구 연희동', 37.5650743, 126.9278120, '서울', 'su2-1', 'su2-2', 'su2-3', '비건', '#찹싸루니 #미소링', 'ownerid72'),
	(73, '제로비건', '서울시 송파구 잠실3동', 37.5115662, 127.0963236, '서울', 'su3-1', 'su3-2', 'su3-3', '비건', '#비건감자탕 #비건냉면', 'ownerid73'),
	(74, '슬런치 팩토리', '서울시 마포구 서강동', 37.5458380, 126.9207059, '서울', 'su4-1', 'su4-2', 'su4-3', '페스코', '#사과피자 #버섯오트밀스프 #가지시금치파스타', 'ownerid74'),
	(75, '오세계향', '서울시 종로구 관훈동 인사동12길', 37.5745832, 126.9851166, '서울', 'su5-1', 'su5-2', 'su5-3', '비건', '#곤드레비빔밥 #강된장비빔밥 #버섯전골', 'ownerid75'),
	(76, '베제투스', '서울시 용산구 용산2가동', 37.5434494, 126.9869405, '서울', 'su6-1', 'su6-2', 'su6-3', '락토오보', '#라자냐 #글루텐프리맥앤치즈 #비건버거', 'ownerid76'),
	(77, '쿡앤북', '서울시 마포구 합정동', 37.5461519, 126.9162840, '서울', 'su7-1', 'su7-2', 'su7-3', '락토오보', '#매콤채소마요 #오무라이스 #비트허무스', 'ownerid77'),
	(78, '소이로움', '서울시 종로구 누하동', 37.5791870, 126.9684778, '서울', 'su8-1', 'su8-2', 'su8-3', '비건', '#타코라이스 #두유리조또 #곡물패티버거', 'ownerid78'),
	(79, '아승지', '서울시 영등포구 신길4동', 37.5068066, 126.9099514, '서울', 'su9-1', 'su9-2', 'su9-3', '비건', '#쌀빵 #쑥전 #콩나물잡채', 'ownerid79'),
	(80, '플랜트', '서울시 용산구 이태원1동', 37.5330114, 126.9941269, '서울', 'su10-1', 'su10-2', 'su10-3', '비건', '#땅콩모밀 #템퍼아보카도샐러드 #카레', 'ownerid80');
/*!40000 ALTER TABLE `restaurent_list` ENABLE KEYS */;

-- 테이블 projecta.restaurent_vote 구조 내보내기
CREATE TABLE IF NOT EXISTS `restaurent_vote` (
  `candiNum` int(11) DEFAULT NULL,
  `candidate` varchar(30) DEFAULT NULL,
  `memberId` varchar(30) DEFAULT NULL,
  KEY `FK_restaurent_vote_account_faver_memberId` (`memberId`) USING BTREE,
  KEY `FK_restaurent_vote_restaurent_candidate_candiNum` (`candiNum`),
  KEY `FK_restaurent_vote_restaurent_candidate_candidate` (`candidate`),
  CONSTRAINT `FK_restaurent_vote_account_faver_memberId` FOREIGN KEY (`memberId`) REFERENCES `account_faver` (`memberId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_restaurent_vote_restaurent_candidate_candidate` FOREIGN KEY (`candidate`) REFERENCES `restaurent_candidate` (`candidate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 projecta.restaurent_vote:~0 rows (대략적) 내보내기
DELETE FROM `restaurent_vote`;
/*!40000 ALTER TABLE `restaurent_vote` DISABLE KEYS */;
INSERT INTO `restaurent_vote` (`candiNum`, `candidate`, `memberId`) VALUES
	(1, '다이너재키', 'userid47'),
	(4, '회현식당', 'userid02'),
	(2, '페스코비건즈', 'userid06'),
	(3, '달맞이', 'userid07'),
	(3, '달맞이', 'userid15'),
	(4, '회현식당', 'userid17'),
	(5, '마라도 회식당', 'userid01');
/*!40000 ALTER TABLE `restaurent_vote` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
