function deleteChord(id, sid){
    $.ajax({
        url: '/chords/' + id +/chord/+ sid,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};