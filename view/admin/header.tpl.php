<?php
  /**
   * Header
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2016
   * @version $Id: header.tpl.php, v1.00 2015-10-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');

  if (!App::Auth()->is_Admin()) {
	  Url::redirect(SITEURL . '/admin/login/'); 
	  exit; 
  }
 ?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title><?php echo $this->title;?></title>
<?php if(in_array(Core::$language, array("ar", "he"))):?>
<link href="<?php echo ADMINVIEW . '/cache/' . Cache::cssCache(array('base_rtl.css','transition_rtl.css','dropdown_rtl.css','image_rtl.css','button_rtl.css','message_rtl.css','list_rtl.css','table_rtl.css','datepicker_rtl.css','divider_rtl.css','form_rtl.css','input_rtl.css','icon_rtl.css','flags_rtl.css','label_rtl.css','segment_rtl.css','popup_rtl.css','dimmer_rtl.css','modal_rtl.css','progress_rtl.css','editor_rtl.css','utility_rtl.css','style_rtl.css'), ADMINBASE);?>" rel="stylesheet" type="text/css" />
<?php else:?>
<link href="<?php echo ADMINVIEW . '/cache/' . Cache::cssCache(array('base.css','transition.css','dropdown.css','image.css','button.css','message.css','list.css','table.css','datepicker.css','divider.css','form.css','input.css','icon.css','flags.css','label.css','segment.css','popup.css','dimmer.css','modal.css','progress.css','editor.css','utility.css','style.css'), ADMINBASE);?>" rel="stylesheet" type="text/css" />
<?php endif;?>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/jquery.js"></script>
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/global.js"></script>
</head>
<body>
<?php if($this->core->ploader):?>
<div id="master-loader">
  <div class="wanimation"></div>
  <div class="curtains left"></div>
  <div class="curtains right"></div>
</div>
<?php endif;?>
<div id="mResults" class="wojo page inverted dimmer">
  <a class="close white"><i class="icon delete"></i></a>
  <div class="padding"></div>
</div>
<div id="wrapper" class="clearfix">
<aside>
  <div class="bg" style="background-image: url('<?php echo ADMINVIEW;?>/images/<?php echo (isset($_COOKIE['ABG_CMS']) ? $_COOKIE['ABG_CMS'] : "sidebar-1.jpg");?>');">
    <div class="content">
      <a href="<?php echo Url::url("/admin");?>" class="logo">
        <?php echo ($this->core->logo) ? '<img src="' . SITEURL . '/uploads/' . $this->core->logo . '" alt="' . $this->core->company . '">': $this->core->company;?>
      </a>
      <div class="optiscroll is_sidebar">
        <nav>
          <ul>
            <li class="has-sub uavatar<?php if (Utility::in_array_any(["myaccount", "mypassword"], $this->segments)) echo ' active open';?>">
              <a href="#">
                <img src="<?php echo UPLOADURL;?>/avatars/<?php echo (App::Auth()->avatar) ? App::Auth()->avatar : "blank.svg";?>" alt="" class="avatar">
                <span><?php echo App::Auth()->name;?></span>
                <i class="icon chevron down"></i>
              </a>
              <ul>
                <li>
                  <a<?php if (in_array("myaccount", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/myaccount");?>"><small>MA</small><span><?php echo Lang::$word->M_MYACCOUNT;?></span></a>
                </li>
                <li>
                  <a<?php if (in_array("password", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/mypassword");?>"><small>PC</small><span><?php echo Lang::$word->M_SUB2;?></span></a>
                </li>
                <li>
                  <a href="<?php echo Url::Url("/admin/logout");?>"><small>L</small><span><?php echo Lang::$word->LOGOUT;?></span></a>
                </li>
                <li>
                  <div class="row half-horizontal-gutters">
                    <div class="columns">
                      <a class="sbg<?php echo (empty($_COOKIE['ABG_CMS']) or $_COOKIE['ABG_CMS'] == "sidebar-1.jpg") ? " active" : "";?>" data-img="sidebar-1.jpg">
                        <img src="<?php echo ADMINVIEW;?>/images/sidebar-1.jpg" alt="">
                      </a>
                    </div>
                    <div class="columns">
                      <a class="sbg<?php echo (isset($_COOKIE['ABG_CMS']) and $_COOKIE['ABG_CMS'] == "sidebar-2.jpg") ? " active" : "";?>" data-img="sidebar-2.jpg">
                        <img src="<?php echo ADMINVIEW;?>/images/sidebar-2.jpg" alt="">
                      </a>
                    </div>
                    <div class="columns">
                      <a class="sbg<?php echo (isset($_COOKIE['ABG_CMS']) and $_COOKIE['ABG_CMS'] == "sidebar-3.jpg") ? " active" : "";?>" data-img="sidebar-3.jpg">
                        <img src="<?php echo ADMINVIEW;?>/images/sidebar-3.jpg" alt="">
                      </a>
                    </div>
                    <div class="columns">
                      <a class="sbg<?php echo (isset($_COOKIE['ABG_CMS']) and $_COOKIE['ABG_CMS'] == "sidebar-4.jpg") ? " active" : "";?>" data-img="sidebar-4.jpg">
                        <img src="<?php echo ADMINVIEW;?>/images/sidebar-4.jpg" alt="">
                      </a>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
            <li class="has-sub <?php if (Utility::in_array_any(["templates","menus","pages","languages","fields","coupons"], $this->segments)) echo ' active open';?>">
              <a href="#">
                <i class="icon layer alt"></i>
                <span><?php echo Lang::$word->ADM_CONTENT;?></span>
                <i class="icon chevron down"></i>
              </a>
              <ul>
                <?php if (Auth::hasPrivileges('manage_menus')):?>
                <li>
                  <a<?php if (in_array("menus", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/menus");?>"><small>MM</small><span><?php echo Lang::$word->ADM_MENUS;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_pages')):?>
                <li>
                  <a<?php if (in_array("pages", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/pages");?>"><small>MP</small><span><?php echo Lang::$word->ADM_PAGES;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_coupons')):?>
                <li>
                  <a<?php if (in_array("coupons", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/coupons");?>"><small>MC</small><span><?php echo Lang::$word->ADM_COUPONS;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_languages')):?>
                <li>
                  <a<?php if (in_array("languages", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/languages");?>"><small>ML</small><span><?php echo Lang::$word->ADM_LNGMNG;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_fields')):?>
                <li>
                  <a<?php if (in_array("fields", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/fields");?>"><small>CF</small><span><?php echo Lang::$word->ADM_CFIELDS;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_email')):?>
                <li>
                  <a<?php if (in_array("templates", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/templates");?>"><small>ET</small><span><?php echo Lang::$word->ADM_EMTPL;?></span></a>
                </li>
                <?php endif;?>
              </ul>
            </li>
            <li<?php if (in_array("users", $this->segments)) echo ' class="active"';?>>
              <a href="<?php echo Url::Url("/admin/users");?>"><i class="icon user alt"></i><span><?php echo Lang::$word->ADM_USERS;?></span></a>
            </li>
            <li<?php if (in_array("layout", $this->segments)) echo ' class="active"';?>>
              <a href="<?php echo Url::Url("/admin/layout");?>"><i class="icon grid"></i><span><?php echo Lang::$word->ADM_LAYOUT;?></span></a>
            </li>
            <li<?php if (in_array("memberships", $this->segments)) echo ' class="active"';?>>
              <a href="<?php echo Url::Url("/admin/memberships");?>"><i class="icon membership"></i><span><?php echo Lang::$word->ADM_MEMBS;?></span></a>
            </li>
            <li<?php if (in_array("modules", $this->segments)) echo ' class="active"';?>>
              <a href="<?php echo Url::Url("/admin/modules");?>"><i class="icon server alt"></i><span><?php echo Lang::$word->MODULES;?></span></a>
            </li>
            <li<?php if (in_array("plugins", $this->segments)) echo ' class="active"';?>>
              <a href="<?php echo Url::Url("/admin/plugins");?>"><i class="icon usb stick"></i><span><?php echo Lang::$word->PLUGINS;?></span></a>
            </li>
            <li class="has-sub <?php if (Utility::in_array_any(["backup", "manager", "mailer", "countries", "configuration"], $this->segments)) echo ' active open';?>">
              <a href="#">
                <i class="icon cogs"></i>
                <span><?php echo Lang::$word->ADM_CONFIG;?></span>
                <i class="icon chevron down"></i>
              </a>
              <ul>
                <?php if (Auth::checkAcl("owner")):?>
                <li>
                  <a<?php if (in_array("configuration", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/configuration");?>"><small>C</small><span><?php echo Lang::$word->ADM_SYSTEM;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_backup')):?>
                <li>
                  <a<?php if (in_array("backup", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/backup");?>"><small>B</small><span><?php echo Lang::$word->ADM_BACKUP;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_files')):?>
                <li>
                  <a<?php if (in_array("manager", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/manager");?>"><small>F</small><span><?php echo Lang::$word->ADM_FM;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_newsletter')):?>
                <li>
                  <a<?php if (in_array("mailer", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/mailer");?>"><small>N</small><span><?php echo Lang::$word->ADM_NEWSL;?></span></a>
                </li>
                <?php endif;?>
                <?php if (Auth::hasPrivileges('manage_countries')):?>
                <li>
                  <a<?php if (in_array("countries", $this->segments)) echo ' class="active"';?> href="<?php echo Url::Url("/admin/countries");?>"><small>C</small><span><?php echo Lang::$word->ADM_CNTR;?></span></a>
                </li>
                <?php endif;?>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</aside>
<main>
<div class="mcontent">
<header>
  <div class="row gutters align-middle">
    <div class="columns shrink mobile-order-1 phone-order-1"><a id="mtoggle" class="wojo white icon circular button"><i class="icon vertical ellipsis"></i></a>
    </div>
    <div class="columns mobile-order-2 phone-order-2">
      <div class="wojo small breadcrumb">
        <?php echo Url::crumbs($this->crumbs ? $this->crumbs : $this->segments, "//", Lang::$word->HOME);?>
      </div>
    </div>
    <div class="columns screen-30 tablet-50 mobile-100 phone-100 mobile-order-4 phone-order-4">
      <div class="wojo fluid transparent right icon input">
        <input type="text" placeholder="<?php echo Lang::$word->FIND;?>" id="masterSearch">
        <button class="wojo white circular icon button"><i class="icon find"></i></button>
      </div>
    </div>
    <?php if (Auth::checkAcl("owner")):?>
    <div class="columns shrink mobile-order-3 phone-order-3">
      <a data-dropdown="#dropdown-aMenu" class="wojo white icon circular button">
        <i class="icon horizontal ellipsis"></i>
      </a>
      <div class="wojo small dropdown menu top-right" id="dropdown-aMenu">
        <a class="item" href="<?php echo Url::url("/admin/permissions");?>"><i class="icon lock"></i>
          <span class="padding-left"><?php echo Lang::$word->ADM_PERMS;?></span></a>
        <a class="item" href="<?php echo Url::url("/admin/transactions");?>"><i class="icon wallet"></i>
          <span class="padding-left"><?php echo Lang::$word->ADM_TRANS;?></span></a>
        <a class="item" href="<?php echo Url::url("/admin/utilities");?>"><i class="icon sliders vertical"></i>
          <span class="padding-left"><?php echo Lang::$word->ADM_UTIL;?></span></a>
        <a class="item" href="<?php echo Url::url("/admin/system");?>"><i class="icon laptop"></i>
          <span class="padding-left"><?php echo Lang::$word->SYS_TITLE;?></span></a>
        <a class="item" href="<?php echo Url::url("/admin/gateways");?>"><i class="icon credit card"></i>
          <span class="padding-left"><?php echo Lang::$word->ADM_GATE;?></span></a>
        <a class="item" href="<?php echo Url::url("/admin/trash");?>"><i class="icon trash"></i>
          <span class="padding-left"><?php echo Lang::$word->ADM_TRASH;?></span></a>
      </div>
    </div>
    <?php endif;?>
  </div>
</header>