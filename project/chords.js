module.exports = function(){
    var express = require('express');
    var router = express.Router();
    //gets the chords for the drop down
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
    //gets the students name
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
    //gets the chords and the nae
    function getChordsWithName(req, res, mysql, context, complete) {
      //sanitize the input as well as include the % character
       var query = "SELECT c.c_ID, c.name, c.major_sound, c.fingering, c.fret FROM chords c WHERE c.major_sound LIKE " + mysql.pool.escape(req.params.s + '%');
      console.log(query)

      mysql.pool.query(query, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.chords = results;
            complete();
        });
}
    //gets a list of the chords
    function getChords(res, mysql, context, complete){
        mysql.pool.query("SELECT `name`,`major_sound`,`fingering`,`fret` FROM `chords`", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.chords=results;
             complete();
            });
                                                                                                   
        
    }
    //gets the chords the student know
    function getStudentChords(res, mysql, context, complete){
        mysql.pool.query("Select s.s_ID as s_ID, c.c_ID as chord_Id, s.fname as fname, s.lname as lname, c.name as chord_name from students s LEFT JOIN people_chords pc ON pc.student=s.s_ID LEFT JOIN chords c ON pc.chord_id=c.c_ID", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.studentchords=results;
             complete();
            });
                        
    }
    
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletechord.js", "searchchords.js"];
        var mysql = req.app.get('mysql');
        getChords(res, mysql, context, complete);
        getStudentName(res, mysql, context, complete);
        getChordsDropdown(res, mysql, context, complete);
        getStudentChords(res, mysql, context, complete);
        
       
        function complete(){
            callbackCount++;
            if(callbackCount >= 4){
                res.render('chords', context);
            }

        }
});
    //to search the chord database
      router.get('/search/:s', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletechord.js", "searchchords.js"];
        var mysql = req.app.get('mysql');
      getChordsWithName(req, res, mysql, context, complete)
        getStudentName(res, mysql, context, complete);
        getChordsDropdown(res, mysql, context, complete);
        getStudentChords(res, mysql, context, complete);
       
        function complete(){
            callbackCount++;
            if(callbackCount >= 4){
                res.render('chords', context);
            }

        }
});
    
    
    //To add a chord to database
    
       router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO chords (`name`, `major_sound`, `fingering`, `fret`) VALUES (?,?,?,?)";
        var inserts = [req.body.chord_name, req.body.major_sound, req.body.fingering, req.body.fret];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/chords');
            }
        });
}); 
    
    //this is the delete function
 router.delete('/:id/chord/:sid', function(req, res){
     console.log(req)   
     console.log(req.params.id)
     console.log(req.params.sid)
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM people_chords WHERE chord_ID = ? and student = ?";
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