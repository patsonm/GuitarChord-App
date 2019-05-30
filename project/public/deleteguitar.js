function deleteGuitar(id){
    $.ajax({
        url: '/guitars/' + id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};