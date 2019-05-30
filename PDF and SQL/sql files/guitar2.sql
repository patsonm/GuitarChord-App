/*This is the table structure for the guitar database for CS340
Work by Michael Patson

THERE IS AN ATTACHED CSV FILE.  PLEASE LOAD IT DIRECTLY INTO THE chords table
*/


DROP TABLE IF EXISTS `students`;

CREATE TABLE `students`(
`s_ID` int(11) NOT NULL AUTO_INCREMENT,
`fname` varchar(255) NOT NULL,
`lname` varchar(255) DEFAULT NULL,
`vocals` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`s_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

LOCK TABLES `students` WRITE;
INSERT INTO `students` VALUES (1, 'Michael', 'Patson',1), (2, 'Courtney', 'Chupka', 0), (3, 'Eddie', 'Vedder', 0);
UNLOCK TABLES;

DROP TABLE IF EXISTS `guitars`;
CREATE TABLE `guitars`(
`g_ID` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`type` varchar(8) NOT NULL,
`student` int(11),
PRIMARY KEY (`g_ID`),
KEY `student` (`student`),
CONSTRAINT `student_FK` FOREIGN KEY (`student`) REFERENCES `students` (`s_ID`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `guitars` WRITE;
INSERT INTO `guitars` VALUES (1, "Les Paul", "Electric", 1), (2, "Taylor Koa", "Acoustic", 1), (3, "Yamaha", "Acoustic", 2), (4, "Ukulele", "Acoustic", 3);
UNLOCK TABLES;


DROP TABLE IF EXISTS `chords`;
CREATE TABLE `chords`(
`c_ID` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(10) NOT NULL,
`major_sound` varchar(2) NOT NULL,
`fingering`varchar(6) NOT NULL,
`fret` int(2),
PRIMARY KEY (`c_ID`),
UNIQUE KEY `name` (`name`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs`(
`song_ID` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`original_artist`varchar(255) DEFAULT NULL,
PRIMARY KEY (`song_ID`), 
UNIQUE KEY `name` (`name`)  
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `songs_chords`;
CREATE TABLE `songs_chords`(
`c_id` int(11),
`song_id` int(11),
KEY `song_id` (`song_id`),
PRIMARY KEY (`c_id`,`song_id`),
CONSTRAINT `song_FK` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `chord_FK` FOREIGN KEY (`c_id`) REFERENCES `chords` (`c_ID`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `vocals`;
CREATE TABLE `vocals`(
`vocals` tinyint(1),
`result` varchar(3)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `vocals` (`vocals`, result) VALUES (1, "Yes"), (0,"No");


INSERT INTO `chords` (`c_ID`, `name`, `major_sound`, `fingering`, `fret`) VALUES
(0, 'NC','NA','NA','NA'),
(1, 'A', 'A', 'x02220', 1),
(2, 'A#', 'A#', 'x13331', 1),
(3, 'A#4', 'A#', 'xx3341', 1),
(4, 'A#7', 'A#', 'xx1112', 3),
(5, 'A#dim', 'A#', 'xx2323', 1),
(6, 'A#m', 'A#', 'x13321', 1),
(7, 'A#m7', 'A#', 'x13121', 1),
(8, 'A#maj7', 'A#', 'x1323x', 1),
(9, 'A+', 'A', 'x03221', 1),
(10, 'A/D', 'A', 'xx0022', 1),
(11, 'A/F#', 'A', '202220', 1),
(12, 'A/G#', 'A', '402220', 1),
(13, 'A11', 'A', 'x42433', 1),
(14, 'A13', 'A', 'x01231', 5),
(15, 'A4', 'A', '2200', 1),
(16, 'A6', 'A', 'xx2222', 1),
(17, 'A7', 'A', 'x02020', 1),
(18, 'A7(9+)', 'A', '203023', 1),
(19, 'A7+', 'A', 'xx3221', 1),
(20, 'A7sus4', 'A', '2030', 1),
(21, 'A9', 'A', 'x02100', 1),
(22, 'Ab', 'Ab', '133211', 4),
(23, 'Ab+', 'Ab', 'xx2110', 1),
(24, 'Ab11', 'Ab', '131311', 4),
(25, 'Ab4', 'Ab', 'xx1124', 1),
(26, 'Ab7', 'Ab', 'xx1112', 1),
(27, 'Abdim', 'Ab', 'xx0101', 1),
(28, 'Abm', 'Ab', '133111', 4),
(29, 'Abm7', 'Ab', 'xx1111', 4),
(30, 'Abmaj7', 'Ab', 'xx1113', 1),
(31, 'Adim', 'A', 'xx1212', 1),
(32, 'Am', 'Am', 'x02210', 1),
(33, 'Am(7#)', 'Am', 'x03213', 1),
(34, 'Am(add9)', 'Am', '22210', 1),
(35, 'Am/G', 'Am', '302210', 1),
(36, 'Am6', 'Am', 'x02212', 1),
(37, 'Am7', 'Am', 'x02213', 1),
(38, 'Am7sus4', 'Am', '30', 1),
(39, 'Am9', 'Am', 'x01113', 5),
(40, 'Amaj7', 'Am', 'x02120', 1),
(41, 'Asus', 'A', 'xx2230', 1),
(42, 'B', 'B', 'x24442', 1),
(43, 'B(addE)', 'B', 'x24400', 1),
(44, 'B+', 'B', 'xx1004', 1),
(45, 'B/F#', 'B', '22200', 2),
(46, 'B11', 'B', '133200', 7),
(47, 'B11/13', 'B', '4444', 1),
(48, 'B13', 'B', 'x21204', 1),
(49, 'B4', 'B', 'xx3341', 2),
(50, 'B7', 'B', '21202', 1),
(51, 'B7#9', 'B', 'x2123x', 1),
(52, 'B7+', 'B', 'x21203', 1),
(53, 'B9', 'B', '131213', 7),
(54, 'BaddE/F#', 'B', '224442', 1),
(55, 'Bb+', 'Bb', 'xx0332', 1),
(56, 'Bb11', 'Bb', '131341', 6),
(57, 'Bb6', 'Bb', 'xx3333', 1),
(58, 'Bb9', 'Bb', '131213', 6),
(59, 'Bbm9', 'Bb', 'xxx113', 6),
(60, 'Bm', 'Bm', 'x24432', 1),
(61, 'Bm(maj7)', 'Bm', 'x20332', 1),
(62, 'Bm6', 'Bm', 'xx4434', 1),
(63, 'Bm7', 'Bm', 'x13121', 2),
(64, 'Bm7b5', 'Bm', '124231', 1),
(65, 'Bmaj', 'Bm', 'x2434x', 1),
(66, 'Bmsus9', 'Bm', 'x34402', 1),
(67, 'C', 'C', 'x32010', 1),
(68, 'C#', 'C#', 'xx3121', 1),
(69, 'C#(add9)', 'C#', 'x13311', 4),
(70, 'C#4', 'C#', 'xx3341', 4),
(71, 'C#7', 'C#', 'xx3424', 1),
(72, 'C#m', 'C#', 'xx2120', 1),
(73, 'C#m7', 'C#', 'xx2424', 1),
(74, 'C#maj', 'C#', 'x43111', 1),
(75, 'C(add9)', 'C', 'x32030', 1),
(76, 'C/B', 'C', 'x22010', 1),
(77, 'C11', 'C', 'x13141', 3),
(78, 'C4', 'C', 'xx3013', 1),
(79, 'C7', 'C', '32310', 1),
(80, 'C9', 'C', '131213', 8),
(81, 'C9(11)', 'C', '113131', 3),
(82, 'Cadd2/B', 'C', 'x20010', 1),
(83, 'Cm', 'Cm', 'x13321', 3),
(84, 'Cm11', 'Cm', 'x1314x', 3),
(85, 'Cm7', 'Cm', 'x13121', 3),
(86, 'Cmaj', 'Cm', '32010', 1),
(87, 'Cmaj7', 'Cm', 'x32000', 1),
(88, 'Csus2', 'C', 'x3001x', 1),
(89, 'Csus9', 'C', 'xx4124', 7),
(90, 'D', 'D', 'xx0232', 1),
(91, 'D#', 'D#', 'xx3121', 3),
(92, 'D#4', 'D#', 'xx1344', 1),
(93, 'D#7', 'D#', 'xx1323', 1),
(94, 'D#m', 'D#', 'xx4342', 1),
(95, 'D#m7', 'D#', 'xx1322', 1),
(96, 'D#maj7', 'D#', 'xx1333', 1),
(97, 'D(add9)', 'D', '232', 1),
(98, 'D/A', 'D', 'x04232', 1),
(99, 'D/B', 'D', 'x20232', 1),
(100, 'D/C', 'D', 'x30232', 1),
(101, 'D/C#', 'D', 'x40232', 1),
(102, 'D/E', 'D', 'x1111x', 7),
(103, 'D/G', 'D', '3x0232', 1),
(104, 'D11', 'D', '300210', 1),
(105, 'D4', 'D', 'xx0233', 1),
(106, 'D5/E', 'D', '0111xx', 7),
(107, 'D6', 'D', 'x00202', 1),
(108, 'D7', 'D', 'xx0212', 1),
(109, 'D7#9', 'D', 'x21233', 4),
(110, 'D7sus2', 'D', 'x00210', 1),
(111, 'D7sus4', 'D', 'x00213', 1),
(112, 'D9', 'D', '11112', 7),
(113, 'D9add6', 'D', '20212', 1),
(114, 'Dm', 'Dm', 'xx0231', 1),
(115, 'Dm#7', 'Dm', 'xx0221', 1),
(116, 'Dm/A', 'Dm', 'x00231', 1),
(117, 'Dm/B', 'Dm', 'x20231', 1),
(118, 'Dm/C', 'Dm', 'x30231', 1),
(119, 'Dm/C#', 'Dm', 'x40231', 1),
(120, 'Dm7', 'Dm', 'xx0211', 1),
(121, 'Dm9', 'Dm', 'xx3210', 1),
(122, 'Dmaj7', 'D', 'xx0222', 1),
(123, 'Dsus2', 'D', '230', 1),
(124, 'E', 'E', '22100', 1),
(125, 'E11', 'E', '111122', 1),
(126, 'E5', 'E', '0133xx', 7),
(127, 'E6', 'E', 'xx3333', 9),
(128, 'E7', 'E', '22130', 1),
(129, 'E7#9', 'E', '22133', 1),
(130, 'E7(5b)', 'E', '10132', 1),
(131, 'E7(b9)', 'E', '20132', 1),
(132, 'E9', 'E', '131213', 1),
(133, 'Eb(add9)', 'E', 'x11341', 1),
(134, 'Em', 'Em', '22000', 1),
(135, 'Em(add9)', 'Em', '24000', 1),
(136, 'Em(sus4)', 'Em', '2000', 1),
(137, 'Em/B', 'Em', 'x22000', 1),
(138, 'Em/D', 'Em', 'xx0000', 1),
(139, 'Em6', 'Em', '22020', 1),
(140, 'Em7', 'Em', '22030', 1),
(141, 'Emaj7', 'E', '02110x', 1),
(142, 'Esus', 'E', '22200', 1),
(143, 'Esus4', 'E', '22200', 0),
(144, 'F', 'F', '133211', 1),
(145, 'F#', 'F#', '244322', 1),
(146, 'F#+', 'F#', 'xx4332', 1),
(147, 'F#/E', 'F#', '44322', 1),
(148, 'F#11', 'F#', '242422', 1),
(149, 'F#4', 'F#', 'xx4422', 1),
(150, 'F#7', 'F#', 'xx4320', 1),
(151, 'F#9', 'F#', 'x12122', 1),
(152, 'F#m', 'F#', '244222', 1),
(153, 'F#m6', 'F#', 'xx1222', 1),
(154, 'F#m7-5', 'F#', '102333', 2),
(155, 'F#maj', 'F#', '244322', 0),
(156, 'F#maj7', 'F#', 'xx4321', 1),
(157, 'F(add9)', 'F', '303211', 1),
(158, 'F/A', 'F', 'x03211', 1),
(159, 'F/C', 'F', 'xx3211', 1),
(160, 'F/G', 'F', '333211', 1),
(161, 'F11', 'F', '131311', 1),
(162, 'F4', 'F', 'xx3311', 1),
(163, 'F6', 'F', 'x3323x', 1),
(164, 'F7', 'F', '131211', 1),
(165, 'F7/A', 'F', 'x01211', 1),
(166, 'F9', 'F', '242324', 1),
(167, 'FaddG', 'F', '1x3213', 1),
(168, 'Fm', 'Fm', '133111', 1),
(169, 'Fm6', 'Fm', 'xx0111', 1),
(170, 'Fm7', 'Fm', '131111', 1),
(171, 'Fmaj7', 'Fm', 'x33210', 1),
(172, 'Fmaj7(+5)', 'Fm', '3220', 1),
(173, 'Fmaj7/A', 'Fm', 'x03210', 1),
(174, 'Fmmaj7', 'Fm', 'x33110', 1),
(175, 'G', 'G', '320003', 1),
(176, 'G#m6', 'G', 'xx1101', 1),
(177, 'G(add9)', 'G', '13x213', 3),
(178, 'G/A', 'G', '300003', 1),
(179, 'G/B', 'G', 'x20003', 1),
(180, 'G/D', 'G', 'x22100', 4),
(181, 'G/F#', 'G', '220003', 1),
(182, 'G11', 'G', '3x0211', 1),
(183, 'G4', 'G', 'xx0013', 1),
(184, 'G6', 'G', '3x0000', 1),
(185, 'G6(sus4)', 'G', '20010', 1),
(186, 'G7', 'G', '320001', 1),
(187, 'G7#9', 'G', '13x244', 3),
(188, 'G7(sus4)', 'G', '330011', 1),
(189, 'G9', 'G', '3x0201', 1),
(190, 'G9(11)', 'G', '120001', 1),
(191, 'Gm', 'Gm', '133111', 3),
(192, 'Gm/Bb', 'Gm', '3221xx', 4),
(193, 'Gm6', 'Gm', 'xx2333', 1),
(194, 'Gm7', 'Gm', '131111', 3),
(195, 'Gmaj7', 'G', 'xx4321', 2),
(196, 'Gmaj7sus4', 'G', '330012', 1),
(197, 'Gmaj9', 'G', '114121', 2),
(198, 'Gsus4', 'G', 'xx0011', 1);

/*The below commands are just an example and do not work in this set up, the chord table is completed with a CSV file for all the fingers, adaped from "The Chord Wheel, the ultimated guide for musicians by Hal Leonard*/

LOCK TABLE `songs` WRITE;
INSERT INTO `songs` (song_ID, name, original_artist) VALUES (1, "All along the watch tower", "Bob Dylan"), (2, "Knocking on Heaven's Door", "Bob Dylan");
UNLOCK TABLES;


LOCK Table `songs_chords` WRITE;
INsert INTO `songs_chords`(song_ID, c_ID) VALUES (1,32),(1,175),(1,144),(1,67),(2,175),(2,90),(2,32),(2,67);
UNLOCK TABLES;

DROP TABLE IF EXISTS `people_song`;
CREATE TABLE `people_song`(
`song_id` int(11),
`student` int(11),
KEY `student` (`student`),
KEY `song_id` (song_id),
UNIQUE (`song_id`,`student`),   
CONSTRAINT `student_FK1` FOREIGN KEY (`student`) REFERENCES `students` (`s_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `song_FK1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_ID`) ON DELETE SET NULL ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;




LOCK TABLES `people_song` WRITE;
INSERT INTO `people_song`(`song_id`, `student`) VALUES (1, 2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `people_chords`;
CREATE TABLE `people_chords`(
`chord_id` int(11),
`student` int(11),
KEY `student` (`student`),
KEY `chord_id` (chord_id),
CONSTRAINT `student_F` FOREIGN KEY (`student`) REFERENCES `students` (`s_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `chord_idFK` FOREIGN KEY (`chord_id`) REFERENCES `chords` (`c_ID`) ON DELETE SET NULL ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

