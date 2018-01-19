$(document).on('turbolinks:load', function(){
    $('.edit_comment').click(function(){
        var arr = [
            {val : 1, text: '1'},
            {val : 2, text: '2'},
            {val : 3, text: '3'},
            {val : 3, text: '4'},
            {val : 3, text: '5'}
          ];

        var comment = $('.edit_comment ~ .card-text');
        var data = comment.html();
        comment.empty();
        $form = $("<form></form>");
        var text = document.createElement('input');
        text.setAttribute('type', 'text');
        text.setAttribute('value', data);
        $form.append(text);
        comment.append($form);
        var star = $('.edit_comment ~ .card-title');
        star.empty();
        var sel = $('<select>').appendTo(star);
        $(arr).each(function() {
         sel.append($("<option>").attr('value',this.val).text(this.text));
        });
        return false;
    }
);
});