$(document).on('turbolinks:load', function(){
    $('.edit_comment').click(function(e){
        var id = $(this).attr("id").split("_")[2];
        $('#info_'+id).hide();
        $('#edit_form_'+id).show();
        return false;
    });
});