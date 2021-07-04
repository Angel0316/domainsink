<?php
  /**
   * Edit Role
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2016
   * @version $Id: getPluginLayout.tpl.php, v1.00 2016-03-02 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<form class="layform" name="layform">
  <div class="poplayout half-padding">
    <?php if($this->data):?>
    <div data-section="<?php echo $this->section;?>" class="wojo very relaxed list">
      <?php foreach($this->data as $row):?>
      <div class="item">
        <div class="content">
          <div class="wojo small text header" data-id="<?php echo $row->id;?>"><?php echo $row->title;?></div>
          <div class="description margin-top">
            <input type="text" name="space[<?php echo $row->id;?>]" value="<?php echo $row->space;?>" class="rangeslider">
          </div>
        </div>
      </div>
      <div class="wojo space divider"></div>
      <?php endforeach;?>
    </div>
    <?php endif;?>
  </div>
</form>
<div class="wojo double divider"></div>
<div class="content-center">
  <button class="wojo small simple button cancel"><?php echo Lang::$word->CANCEL;?></button>
  <button class="wojo small primary button update"><?php echo Lang::$word->UPDATE;?></button>
</div>
