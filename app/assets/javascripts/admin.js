function giveRevisorRole(uid){
    console.log("give to " + uid);
}

function removeRevisorRole(uid){
    jQuery.ajax({
        url: '/admin/remove_role',
        data:'uid='+uid,
        success:  function(){
            console.log('success!');
        }
    });
    console.log("remove " + uid);
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
