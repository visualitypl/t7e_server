$(document).ready(function(){
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editable.defaults.ajaxOptions = {type: "put"}
    $('#username').editable();
    initEditables();
    initDirectoryNavigationLinks('.directory-navigation-link');
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover()
});
function initEditables(){
    $('.translation-editable').editable({
        type: 'textarea',
        emptytext: 'Empty',
        send: 'always',
        onblur: 'cancel'
    });
    //$.fn.editableform.buttons =
    //'<button type="submit" class="btn btn-success editable-submit btn-mini">ACCEPT</button>' +
    //'<button type="button" class="btn editable-cancel btn-mini">RESET</button>';
}