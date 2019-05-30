function searchChordByMajor() {
    //get the first name 
    var major_sound  = document.getElementById('major_sound').value
    //construct the URL and redirect to it
    window.location = '/chords/search/' + encodeURI(major_sound)
}