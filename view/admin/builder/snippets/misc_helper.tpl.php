<?php
  /**
   * Misc Helper
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: misc_helper.tpl.php, v1.00 2018-01-08 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<div class="wojo modal" id="editSource">
  <div class="header">Edit Html</div>
  <div class="sub-header">
    <p class="wojo icon text middle"><i class="icon warning sign"></i> Be careful what you are doing here.</p>
  </div>
  <div class="wojo form content">
    <textarea id="tempHtml" style="min-height:400px;"></textarea>
  </div>
  <div class="actions">
    <button class="wojo simple small cancel button">cancel</button>
    <button class="wojo ok small primary button">ok</button>
  </div>
</div>