module.exports = function(){
    var express = require('express');
    var router = express.Router();
    



     router.post('/', function(req, res){
           
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO songs_chords (`c_id`, `song_id`) VALUES (?,?)";
        var inserts = [req.body.c1, req.body.song_ID];
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