$(document).ready(function(){
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editable.defaults.ajaxOptions = {type: "put"}
    $('#username').editable();
    initEditables();
    initDirectoryNavigationLinks('.directory-navigation-link');
});
function initEditables(){
    $('.translation-editable').editable({
        type: 'textarea',
        emptytext: 'Empty',
        send: 'always',
        onblur: 'cancel'
    });
}