$(document).on('turbolinks:load', function(){
    $('.edit_comment').click(function(e){
        var id = $(this).attr("id").split("_")[2];
        $('#info_'+id).hide();
        $('#edit_form_'+id).show();
        return false;
    });

    $('#new_comment').click(function(e){
        if ($('#new_field').val().length == 0) {
            e.preventDefault();
            $('#new_field').addClass('is-invalid');
        }
    });
});