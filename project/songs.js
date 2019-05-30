module.exports = function(){
    var express = require('express');
    var router = express.Router();
    
    function getStudentName(res, mysql, context, complete){
        mysql.pool.query("SELECT `s_ID`,`fname`, lname FROM `students`", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.students_drop=results;
             complete();
            });
                                                                                                   
        
    }
    function getStudentSongs(res, mysql, context, complete){
        mysql.pool.query("Select s.s_ID as s_ID, s.fname as fname, s.lname as lname, ps.song_ID, so.name as song_name FROM students s LEFT JOIN people_song ps ON ps.student=s.s_ID LEFT JOIN songs so ON ps.song_id =so.song_ID", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.student_songs=results;
             complete();
            });
                   
    }
    function getSongs(res, mysql, context, complete){
        mysql.pool.query("Select s.song_ID as song_ID, s.name as song_name, s.original_artist as artist, GROUP_CONCAT(c.name) as chords FROM songs s INNER JOIN songs_chords sc ON s.song_ID= sc.song_id INNER JOIN chords c ON sc.c_id=c.c_ID Group by s.name", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.songs=results;
             complete();
            });
                                                                                                   
        
    }
    
      function getChordsDropdown(res, mysql, context, complete){
        mysql.pool.query("SELECT `c_ID`,`name` FROM `chords`", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.chords_drop=results;
             complete();
            });
                                                                                                   
        
    }
    
    
    function getSongDropdown(res, mysql, context, complete){
        mysql.pool.query("SELECT `song_ID` as song_ID,`name`as name FROM `songs`", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.songs_drop=results;
             complete();
            });
                                                                                                   
        
    }
    
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletesong.js"];
        var mysql = req.app.get('mysql');
        getSongs(res, mysql, context, complete);
        getChordsDropdown(res, mysql, context, complete);
        getSongDropdown(res, mysql, context, complete);
       getStudentName(res, mysql, context, complete);
         getStudentSongs(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 5){
                res.render('songs', context);
            }

        }
});
    
    
      //To add a song
    
       router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO songs (`name`,`original_artist`) VALUES (?,?)";
        var inserts = [req.body.song_name, req.body.artist_name];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/songs');
            }
        });
});   
    
    
 router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM songs WHERE song_ID = ?";
        var inserts = [req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
})    
    
    //deletes from song database
  router.delete('/r/:id:sid', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM people_song WHERE song_ID = ? and student = ?";
        var inserts = [req.params.id, req.params.sid];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
})
    
 return router;
}();