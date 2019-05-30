module.exports = function(){
    var express = require('express');
    var router = express.Router();
    



     router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO people_song (`song_id`, `student`) VALUES (?,?)";
        var inserts = [req.body.song_ID2, req.body.student_name_drop];
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
    
    
    
    
    
 return router;
}();