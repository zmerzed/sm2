<?php
require_once getcwd() . '/wp-customs/User.php';
$currentUser = User::find(get_current_user_id());
$currentUser->notes = $currentUser->getNotes();

?>
<script>
    var CURRENT_USER = <?php echo json_encode($currentUser); ?>;
    var ROOT_URL = '<?php echo get_site_url(); ?>';
</script>
<div class="main-content matchHeight" ng-app="smApp" ng-controller="notesController">
  <div ng-include src="workoutTemplate" class = "table-responsive" ng-if = "currentUser.notes.length != 0"></div>
  <div ng-if = "currentUser.notes.length == 0">No notes at the moment.</div>
</div>

<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/app.js'; ?>"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() .'/js/angular/notesController.js'; ?>"></script>