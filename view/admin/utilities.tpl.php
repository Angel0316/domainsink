<?php
  /**
   * Utilities
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: utilities.tpl.php, v1.00 2018-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
	  
  if (!Auth::checkAcl("owner")) : print Message::msgError(Lang::$word->NOACCESS); return; endif;
?>
<h3><?php echo Lang::$word->META_T19;?></h3>
<p class="wojo small text">
  <?php echo Lang::$word->UTL_INFO;?>
</p>
<div class="row gutters">
  <div class="columns screen-50 tablet-100 mobile-100 phone-100">
    <div class="wojo segment">
      <form method="post" name="wojo_forma">
        <div class="wojo form">
          <div class="wojo fields">
            <div class="field three wide">
              <label><?php echo Lang::$word->UTL_SUB1;?></label>
              <select name="days" class="wojo small fluid secection dropdown">
                <option value="3">3</option>
                <option value="7">7</option>
                <option value="14">14</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="100">100</option>
                <option value="180">180</option>
                <option value="365">365</option>
              </select>
            </div>
            <div class="field five wide">
              <label><?php echo Lang::$word->DELETE;?></label>
              <button type="button" data-action="processMInactive" name="dosubmit" class="wojo small negative button"><?php echo Lang::$word->UTL_DELINACTIVE;?></button>
            </div>
          </div>
          <p class="wojo mini text"><?php echo Lang::$word->UTL_SUB1_T;?></p>
        </div>
      </form>
    </div>
    <div class="wojo segment">
      <form method="post" name="wojo_formb">
        <div class="wojo form">
          <div class="wojo fields">
            <div class="field three wide basic">
              <label><?php echo Lang::$word->UTL_SUB3;?></label>
              <p class="wojo mini text"><?php echo str_replace("[NUMBER]", '<span class="wojo label" id="banned">' . $this->banned . '</span>', Lang::$word->UTL_SUB2_T);?></p>
            </div>
            <div class="field five wide basic">
              <label><?php echo Lang::$word->DELETE;?></label>
              <button type="button" data-action="processMBanned" name="dosubmit" class="wojo small negative button"><?php echo Lang::$word->UTL_DELBANNED;?></button>
            </div>
          </div>
        </div>
      </form>
    </div>
    <div class="wojo segment">
      <form method="post" name="wojo_formp">
        <div class="wojo form">
          <div class="wojo fields">
            <div class="field three wide basic">
              <label><?php echo Lang::$word->UTL_SUB2;?></label>
              <p class="wojo mini text"><?php echo str_replace("[NUMBER]", '<span class="wojo label" id="pending">' . $this->pending . '</span>', Lang::$word->UTL_SUB2_T);?></p>
            </div>
            <div class="field five wide basic">
              <label><?php echo Lang::$word->DELETE;?></label>
              <button type="button" data-action="processMPEnding" name="dosubmit" class="wojo small negative button"><?php echo Lang::$word->UTL_DELPENDING;?></button>
            </div>
          </div>
        </div>
      </form>
    </div>
    <div class="wojo segment">
      <form method="post" name="wojo_formc">
        <div class="wojo form">
          <div class="wojo fields">
            <div class="field three wide basic">
              <label><?php echo Lang::$word->UTL_CART;?></label>
              <p class="wojo mini text"><?php echo Lang::$word->UTL_CART_T;?></p>
            </div>
            <div class="field five wide basic">
              <label><?php echo Lang::$word->DELETE;?></label>
              <button type="button" data-action="processMCart" name="dosubmit" class="wojo small negative button"><?php echo Lang::$word->UTL_CRBTN;?></button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="columns screen-50 tablet-100 mobile-100 phone-100">
    <div class="wojo segment">
      <form method="post" name="wojo_forms">
        <div class="wojo form">
          <div class="wojo fields">
            <div class="field three wide basic">
              <label><?php echo Lang::$word->UTL_SUB4;?></label>
              <p class="wojo mini text"><?php echo Lang::$word->UTL_SUB4_T;?></p>
            </div>
            <div class="field five wide basic">
              <label><?php echo Lang::$word->UTL_GENERATE;?></label>
              <button type="button" data-action="processMap" name="dosubmit" class="wojo small positive button"><?php echo Lang::$word->UTL_GENERATE;?></button>
            </div>
          </div>
        </div>
      </form>
    </div>
    <div class="wojo segment">
      <form method="post" name="wojo_formss">
        <div class="wojo small form">
          <div class="wojo small fields">
            <div class="field">
              <label><?php echo Lang::$word->UTL_SUB5;?></label>
              <p class="wojo small text"><?php echo Lang::$word->UTL_SUB5_T;?></p>
            </div>
          </div>
          <?php foreach($this->core->slugs->moddir as $key => $mod):?>
          <div class="wojo small fields">
            <div class="field">
              <input type="text" value="<?php echo $key;?>" name="<?php echo $mod;?>">
              <p class="wojo small text half-top-margin"><?php echo SITEURL . '/' . $key . '/';?></p>
            </div>
            <div class="field">
              <input type="text" disabled value="<?php echo $mod;?>">
            </div>
          </div>
          <?php endforeach;?>
          <div class="wojo small fields">
            <div class="field">
              <input type="text" value="<?php echo $this->core->slugs->pagedata->page;?>" name="page">
              <p class="wojo small text half-top-margin"><?php echo SITEURL . '/' . $this->core->slugs->pagedata->page . '/page-title';?></p>
            </div>
            <div class="field">
              <input type="text" disabled value="page">
            </div>
          </div>
          <button type="button" data-action="processSlugs" name="dosubmit" class="wojo small positive button"><?php echo Lang::$word->UPDATE;?></button>
        </div>
      </form>
    </div>
  </div>
</div>