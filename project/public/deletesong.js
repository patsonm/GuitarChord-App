function deleteSong(id){
    $.ajax({
        url: '/songs/' + id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};

function deleteSongRelation(id, sid){
    $.ajax({
        url: '/songs/r/' + id + sid,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};