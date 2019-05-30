var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});

app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);


app.get('/',function(req,res,next){
  var context = {};
  res.render('home',context);

});

app.use('/students', require('./students.js'));
app.use('/guitars', require('./guitars.js'));
app.use('/chords', require('./chords.js'));
app.use('/songs', require('./songs.js'));
app.use('/student_chords', require ('./student_chords.js'));
app.use('/song_chords', require ('./song_chords.js'));
app.use('/student_songs',require ('./student_songs.js'));


app.use('/', express.static('public'));

app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on flip3.engr.oregonstate.edu:' + app.get('port') + '; press Ctrl-C to terminate.');
});
