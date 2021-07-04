<?php
  /**
   * Membership Manager
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: _memberships_edit.tpl.php, v1.00 2018-07-08 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<h3><?php echo Lang::$word->META_T5;?></h3>
<form method="post" id="wojo_form" name="wojo_form">
  <div class="wojo segment form">
    <div class="wojo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_NAME;?>
          <i class="icon asterisk"></i></label>
      </div>
      <div class="field">
        <input type="text" value="<?php echo $this->data->name;?>" placeholder="<?php echo Lang::$word->LG_NAME;?>" name="name">
      </div>
    </div>
    <div class="wojo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_AUTHOR;?></label>
      </div>
      <div class="field">
        <input type="text" value="<?php echo $this->data->author;?>" placeholder="<?php echo Lang::$word->LG_AUTHOR;?>" name="author">
      </div>
    </div>
    <div class="wojo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_COLOR;?></label>
      </div>
      <div class="field">
        <div class="wojo fluid right action input">
          <input type="text" value="<?php echo $this->data->color;?>" name="color" readonly>
          <div class="wojo big empty link label" data-lang-color="true" style="background:<?php echo $this->data->color;?>"></div>
        </div>
      </div>
    </div>
    <div class="wojo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_ABBR;?>
          <i class="icon asterisk"></i></label>
      </div>
      <div class="field">
        <input type="text" value="<?php echo $this->data->abbr;?>" name="abbr" readonly>
      </div>
    </div>
  </div>
  <div class="content-center">
    <a href="<?php echo Url::url("/admin/languages");?>" class="wojo simple small button"><?php echo Lang::$word->CANCEL;?></a>
    <button type="button" data-action="processLanguage" name="dosubmit" class="wojo primary button"><?php echo Lang::$word->LG_UPDATE;?></button>
  </div>
  <input type="hidden" name="id" value="<?php echo $this->data->id;?>">
</form>