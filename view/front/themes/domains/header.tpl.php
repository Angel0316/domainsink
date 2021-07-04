<?php
  /**
   * Header
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: header.tpl.php, v1.00 2018-10-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
 ?>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title><?php echo $this->title;?></title>
<meta name="keywords" content="<?php echo $this->keywords;?>">
<meta name="description" content="<?php echo $this->description;?>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="dcterms.rights" content="<?php echo $this->core->company;?> &copy; All Rights Reserved">
<meta name="robots" content="index">
<meta name="robots" content="follow">
<meta name="revisit-after" content="1 day">
<meta name="generator" content="Powered by CMS pro! v<?php echo $this->core->wojov;?>">
<meta property="og:url"                content="https://www.domainsink.com" />
<meta property="og:type"               content="website" />
<meta property="og:title"              content="Expired Domains With High Traffic" />
<meta property="og:description"        content="Generate Leads With Free Domain Traffic!" />
<meta property="og:image"   content="https://www.domainsink.com/uploads/expired-domains-with-traffic-domainsink-pipeline-facebook.jpg" />
<meta property="og:image:secure_url"   content="https://www.domainsink.com/uploads/expired-domains-with-traffic-domainsink-pipeline-facebook.jpg" />
<meta property="fb:app_id" content="1123302184684574" />
<meta property="og:site_name" content="DomainSink" />
<link rel="canonical" href="https://www.domainsink.com/" />
<link rel="shortcut icon" href="<?php echo SITEURL;?>/assets/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/jquery.js"></script>
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/global.js"></script>
<?php if(in_array(Core::$language, array("ar", "he"))):?>
<link href="<?php echo THEMEURL . '/cache/' . Cache::cssCache(array('base_rtl.css','transition_rtl.css', 'button_rtl.css', 'divider_rtl.css', 'icon_rtl.css', 'flag_rtl.css', 'image_rtl.css', 'label_rtl.css', 'form_rtl.css', 'input_rtl.css', 'list_rtl.css','segment_rtl.css','card_rtl.css','table_rtl.css','dropdown_rtl.css','popup_rtl.css','statistic_rtl.css','datepicker_rtl.css','message_rtl.css','dimmer_rtl.css','modal_rtl.css','progress_rtl.css','editor_rtl.css','item_rtl.css','feed_rtl.css','comment_rtl.css','utility_rtl.css','style_rtl.css'), THEMEBASE);?>" rel="stylesheet" type="text/css">
<?php else:?>
<link href="<?php echo THEMEURL . '/cache/' . Cache::cssCache(array('base.css','transition.css', 'button.css', 'divider.css', 'icon.css', 'flag.css', 'image.css', 'label.css', 'form.css', 'input.css', 'list.css','segment.css','card.css','table.css','dropdown.css','popup.css','statistic.css','datepicker.css','message.css','dimmer.css','modal.css','progress.css','accordion.css','item.css','feed.css','comment.css','editor.css','utility.css','style.css'), THEMEBASE);?>" rel="stylesheet" type="text/css">
<?php endif;?>
<link href="<?php echo THEMEURL . '/plugins/cache/' . Cache::pluginCssCache(THEMEBASE . '/plugins');?>" rel="stylesheet" type="text/css">
<link href="<?php echo THEMEURL . '/modules/cache/' . Cache::moduleCssCache(THEMEBASE . '/modules');?>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo THEMEURL . '/plugins/cache/' . Cache::pluginJsCache(THEMEBASE . '/plugins');?>"></script>
<script type="text/javascript" src="<?php echo THEMEURL . '/modules/cache/' . Cache::moduleJsCache(THEMEBASE . '/modules');?>"></script>
</head>
<body class="page_<?php echo Url::doSeo($this->segments[0]);?>">
<?php if($this->core->ploader):?>
<!-- Page Loader -->
<div id="master-loader">
  <div class="wanimation"></div>
  <div class="curtains left"></div>
  <div class="curtains right"></div>
</div>
<?php endif;?>
<header id="header"  style="background-color:#f8f9fa">
  <div class="wojo-grid">
    <div class="top-bar">
      <div class="row align-middle">
        <!--Lang Switcher-->
        <?php if($this->core->showlang):?>
        <?php if(count($this->core->langlist) > 1):?>
        <div class="columns shrink">
          <a data-dropdown="#dropdown-langChange" class="wojo mini secondary button">
          <div class="description"><span class="flag icon <?php echo $this->core->lang;?>"></span> <?php echo Lang::$word->LANGUAGE;?> </div>
          <i class="icon small chevron down"></i>
          </a>
          <div class="wojo small dropdown menu top-center" id="dropdown-langChange">
            <?php foreach($this->core->langlist as $lang):?>
            <a data-value="<?php echo $lang->abbr;?>" class="item">
            <span class="flag icon <?php echo $lang->abbr;?>"></span>
            <span class="padding-left"><?php echo $lang->name;?></span></a>
            <?php endforeach;?>
          </div>
        </div>
        <?php endif;?>
        <?php endif;?>
        <!--Lang Switcher End-->
        
        <div class="columns content-right">
          <div class="wojo horizontal list">
		  <div class="item">
            <a href="<?php echo SITEURL;?>" class="wojo small simple icon secondary button"><i class="icon home"></i></a>
            <a href="//validator.w3.org/check/referer" target="_blank" class="wojo small simple icon secondary button"><i class="icon html5"></i></a>
            <!--<a href="<?php echo URl::url('/' . $this->core->system_slugs->sitemap[0]->{'slug' . Lang::$lang});?>" class="wojo small simple icon secondary button"><i class="icon apps"></i></a>-->
            <!--<a href="<?php echo SITEURL;?>/rss.php" class="wojo small simple icon secondary button"><i class="icon rss"></i></a>-->
            <a href="//<?php echo $this->core->social->facebook;?>" class="wojo small simple icon secondary button"><i class="icon facebook"></i></a>
            <a href="//<?php echo $this->core->social->twitter;?>" class="wojo small simple icon secondary button"><i class="icon twitter"></i></a>
          </div>

            <?php if($this->core->showsearch):?>
            <div class="item">
              <a href="<?php echo Url::url("/" . $this->core->system_slugs->search[0]->{'slug' . Lang::$lang});?>" class="item wojo small secondary circular icon button"><i class="icon find"></i></a>
            </div>
            <?php endif;?>
            <?php if(File::is_File(FMODPATH . 'digishop/index.tpl.php')):?>
            <div class="item">
              <a href="<?php echo Url::url('/' . App::Core()->modname['digishop'], App::Core()->modname['digishop-checkout']);?>" class="item wojo small secondary circular icon button">
              <i class="icon basket"></i></a>
            </div>
            <?php endif;?>
            
            <!--Show Login-->
            <?php if($this->core->showlogin):?>
            <div class="item">
              <?php if(App::Auth()->is_User()):?>
              <a href="<?php echo Url::url("/" . $this->core->system_slugs->account[0]->{'slug' . Lang::$lang});?>" class="wojo mini secondary rounded button phone-hide">
              <?php echo Lang::$word->HI;?>
              <?php echo App::Auth()->name;?>! </a>
              <a href="<?php echo Url::url("/" . $this->core->system_slugs->account[0]->{'slug' . Lang::$lang});?>" class="wojo small secondary circular icon button screen-hide tablet-hide mobile-hide phone-show">
              <i class="icon user"></i></a>
              <?php else:?>
              <a href="<?php echo Url::url("/" . $this->core->system_slugs->login[0]->{'slug' . Lang::$lang});?>" class="wojo small secondary circular icon button"><i class="icon user"></i></a>
              <?php endif;?>
            </div>
            <?php endif;?>
            <!--Show Login End-->
            
          </div>
        </div>
      </div>
    </div>
    <div class="bottom-bar">
      <div class="row align-middle">
        <div class="columns shrink mobile-80 phone-80">
          <a href="<?php echo SITEURL;?>/" class="logo"><?php echo ($this->core->logo) ? '<img src="' . SITEURL . '/uploads/' . $this->core->logo . '" alt="'.$this->core->company . '">': $this->core->company;?></a>
        </div>
        <div class="columns mobile-20 screen-hide tablet-hide phone-20 content-right"><a href="#" class="menu-mobile"></a>
        </div>
        <div class="columns mobile-100 phone-100 content-right">
          <nav class="menu"><?php echo App::Content()->renderMenu($this->menu);?></nav>
        </div>
      </div>
    </div>
  </div>
</header>