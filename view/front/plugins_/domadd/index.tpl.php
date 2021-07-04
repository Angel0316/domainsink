<?php
  /**
   * Domains
   *
   */

  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
  
  Bootstrap::Autoloader(array(APLUGPATH . 'domsale/'));


	require_once (dirname( __FILE__ ) . '/sdfnjnksd.php');

?>
<style>
.bg { background-color: #999999;}
.l {
  color: white;
  font-size:12px;
  padding-left: 4px;
  padding-right: 4px;
}
.success {background-color: #4CAF50;} /* Green */
.info {background-color: #2196F3;} /* Blue */
.warning {background-color: #ff9800;} /* Orange */
.danger {background-color: #f44336;} /* Red */ 
.other {background-color: #e7e7e7; color: black;} /* Gray */ 
.auction {background-color: #ff9900;} /* Orange auction */
</style>
<div class="wojo-grid">
  <h4>
    <?php echo Lang::$word->DOMADD;?>
  </h4>
</div>
<div class="row align-center">
<div class="row gutters" style="width:98%">
      <div class="columns mobile-50 phone-100">
          <div class="wojo text font_one" style="padding-top:10px;">
			

		<div class="wojo form">

					<div class="wojo block fields">
                    <div class="field">
                      <label>Name<i class="icon asterisk"></i></label>
                      <input name="domain" type="text" placeholder="Domain Name">
                    </div>
					</div>

					<div class="field">
                      <div class="wojo checkbox">
                        <input name="regular" type="checkbox" value="1" class="check_class" id="regular">
                        <label for="regular"><small>Regular</small>
                        </label>
                      </div>
                    </div>
					<div class="field">
                      <div class="wojo checkbox">
                        <input name="featured" type="checkbox" value="2" class="check_class" id="featured">
                        <label for="featured"><small>Featured</small>
                        </label>
                      </div>
                    </div>
					<div class="field">
                      <div class="wojo checkbox">
                        <input name="premium" type="checkbox" value="3" class="check_class" id="premium">
                        <label for="premium"><small>Premium</small>
                        </label>
                      </div>
                    </div>


                    <div class="field content-right">
                      <button class="wojo primary button" data-action="register" name="dosubmit" type="button">Complete Registration</button>
                    </div>

		</div>








		  </div>
	  </div>
</div>
</div>
<script>
$(document).ready(function() {
  $(document).on('change', ".check_class", function () {
    $(".check_class").prop("checked", false);
    $(this).prop("checked", true);
  });
});
</script>