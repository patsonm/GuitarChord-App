module.exports = function(){
    var express = require('express');
    var router = express.Router();
    
  
    
    
    function getStudents(res, mysql, context, complete){
        mysql.pool.query("SELECT s_ID as s_ID, s.fname as fname, s.lname as lname, v.result as vocals FROM students s INNER JOIN vocals v ON s.vocals=v.vocals", function(error, results, fields)
            {if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
             context.students=results;
             complete();
            });
                                                                                                   
        
    }
    
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deleteperson.js"];
        var mysql = req.app.get('mysql');
        getStudents(res, mysql, context, complete);
        //getPlanets(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('students', context);
            }

        }
});
    
    function getStudentID(res, mysql, context, id, complete){
        var sql = "SELECT s_ID, fname, lname, vocals FROM students where s_ID = ?";
        var inserts =[id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.student = results[0];
            complete();
        });
}
        
        
    
    
    //To add a person
    
       router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO students (fname, lname, vocals) VALUES (?,?,?)";
        var inserts = [req.body.fname, req.body.lname, req.body.vocals];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/students');
            }
        });
}); 
    
    //update person
    
 
    router.get('/:id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["updateperson.js"];
        var mysql = req.app.get('mysql');
        getStudentID(res, mysql, context, req.params.id, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('update-person', context);
            }

        }
})
    //put for update person

  router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        console.log(req.body)
        console.log(req.params.id)
        var sql = "UPDATE students SET fname=?, lname=?, vocals=? WHERE s_ID=?";
        var inserts = [req.body.fname, req.body.lname, req.body.vocals, req.params.id];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(error)
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        });
});
    
    /* Route to delete a person, simply returns a 202 upon success. Ajax will handle this. */

    router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM students WHERE s_ID = ?";
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