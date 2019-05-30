function deletePerson(id){
    $.ajax({
        url: '/students/' + id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};