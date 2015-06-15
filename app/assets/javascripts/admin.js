function changeRevisorRole(uid, url, successCallback){
    jQuery.ajax({
        url: url,
        data:'uid='+uid,
        success:  successCallback(),
        error: function(){
            toastr.error('Action not completed', 'Error')
        }
    });
}

function giveRevisorRole(uid){
    changeRevisorRole(uid, '/admin/asign_role', function(){
        toastr.success('El usuario es ahora revisor', 'Rol Modificado')
    });
}

function removeRevisorRole(uid){
    changeRevisorRole(uid, '/admin/remove_role', function(){
        toastr.success('El el revisor es ahora un usuario regular', 'Rol Modificado')
    });
}

function onRoleClick(){
    jQuery(".roles-table input").click( function(){
        var id = parseInt($(this).val(), 10);
        if(jQuery(this).is(":checked")) {
            giveRevisorRole(jQuery(this).val())
        } else {
            removeRevisorRole(jQuery(this).val())
        }
    });
}

jQuery(document).ready(function() {
    onRoleClick();
});
