

/*
For Student updating, deleting, and selection
Which student are you, select from drop down list*/
SELECT  fname, lname FROM students

/*New Student? insert a new student*/

INSERT INTO `students`(`fname`, `lname`, `vocals`) VALUES ([fname],[lname],[vocal])


/*update a student name*/
UPDATE student SET fname=[fnameInput], lname=[lnameInput], vocals=[1]WHERE id=[studentID from form]

/*student deletion, by name*/

DELETE FROM `students` WHERE `fname`=[Name selected from list]AND `lname`= [Name selected from list]

/*Guitar Info

Insert a new guitar, guitars are tied to one student*/

INSERT INTO `guitars`(`name`, `type`, `student`) VALUES ([name from text input],[From toggle (electric or acoustic)],[selected student ID]


                                                         
                                                         
/* show a student's guitar*/
SELECT g.g_ID, g.name, g.type, g.student, s.fname, s.lname, s.s_ID FROM guitars g, students s WHERE s.s_ID = [selected from dropdown sID] AND g.student=[selected from dropdown sID]
                                                         
/*delete a guitar by selection*/
DELETE FROM `guitars` WHERE `g_ID` = [selected guitar]
                                                         
/*chords*/
/*show all chords*/
                                                         
SELECT * FROM `chords` 

/*chord list is locked, students cannot change chords, this is like a dictionary, students can add chords*/                                                         
INSERT INTO `chords`(`name`, `major_sound`, `fingering`, `fret`) VALUES (name_input],[major_sound_input],[fingering_input],[fret_input])                                                         

/*chords a student knows*/                                                        
SELECT SC.c_id, SC.student, s.s_ID, c.c_ID, c.name, c.major_sound, c.fingering, c.fret FROM people_chords SC, students S, chords C WHERE (s.s_ID = 1 AND SC.student = 1) AND (SC.c_id=c.c_ID)                                                      
                                                         
/*Songs*/
                                                         
/*Display all songs*/  
SELECT `name`, `original_artist` FROM `songs`                                                        
                                                
/*Display songs by artist or song name*/                                                      
SELECT * FROM `songs` WHERE `name` = [input_name] OR `original_artist` =[input_artist]                                                         
/*Diplay all chords in the song*/
SELECT `name`, `original_artist`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7` FROM `songs` WHERE `name`=[input_name] OR `original_artist` = [input_artist]
                                                         
/*Display what songs a student knows.*/                               
SELECT PS.song_ID, PS.student, S.s_ID, SO.song_ID, SO.name FROM people_song PS, students S, songs SO WHERE (PS.student=1) AND (S.s_ID=1)
                                                         
/*insert new song*/
INSERT INTO `songs`(`name`, `original_artist`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`) VALUES ([name_input],[artist_input],[c1],[c2],[c3],[c4],[c5],[c6],[c7])                                                         
                                                         
