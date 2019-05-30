module.exports = function(){
    var express = require('express');
    var router = express.Router();
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
    
    //gets the guitars
    function getGuitars(res, mysql, context, complete){
        mysql.pool.query("SELECT g.g_ID as g_ID, g.name as name, g.type as type, s.fname as fname, s.lname as lname FROM guitars g LEFT JOIN students s ON s.s_ID=g.student", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.guitars=results;
             complete();
            });
                                                                                                   
        
    }
    
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deleteguitar.js"];
        var mysql = req.app.get('mysql');
        getGuitars(res, mysql, context, complete);
        getStudentName(res, mysql, context, complete)
        
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('guitars', context);
            }

        }
});
    
       //To add a guitar
    
       router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO guitars (name, type, student) VALUES (?,?,?)";
        var inserts = [req.body.name, req.body.type, req.body.student_name];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/guitars');
            }
        });
}); 
     
//delets a guitar    
 router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM guitars WHERE g_ID = ?";
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
    
    
 return router;
}();