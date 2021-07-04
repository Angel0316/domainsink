<?php
  /**
   * Register
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: register.tpl.php, v1.00 2018-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>

<header id="header" style="background-color:#f8f9fa">
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


<main>
<!--
    <div id="sOverlay" class="columns relative fullsize flex-block screen-33 tablet-hide mobile-hide phone-hide">
      <div class="wSlider" style="height:100vh" data-wslider='{"items":1,"autoloop":true,"arrows":false,"buttons":false,"autoplay":true,"autoplaySpeed":"500", "autoplayHoverPause":false}'>
        <div class="holder" style="background-position: top center;background-repeat: no-repeat;background-size: cover;background-image: url(<?php echo ADMINVIEW;?>/images/sidebar-1.jpg);height:100vh"></div>
        <div class="holder" style="background-position: top center;background-repeat: no-repeat;background-size: cover;background-image: url(<?php echo ADMINVIEW;?>/images/sidebar-2.jpg);height:100vh"></div>
        <div class="holder" style="background-position: top center;background-repeat: no-repeat;background-size: cover;background-image: url(<?php echo ADMINVIEW;?>/images/sidebar-3.jpg);height:100vh"></div>
        <div class="holder" style="background-position: top center;background-repeat: no-repeat;background-size: cover;background-image: url(<?php echo ADMINVIEW;?>/images/sidebar-4.jpg);height:100vh"></div>
      </div>
    </div>
-->
<div class="content-center">
<h1 class="wojo primary text"><?php echo Lang::$word->M_SUB30;?> <span class="wojo semi text"><?php echo $this->core->company;?></span></h1>
  <p><?php echo Lang::$word->M_SUB23;?></p>
</div>
<div class="wojo-grid">
<div class="wojo divider"></div>
</div>
			<div class="section" style="padding:32px 0">

			<div class="wojo-grid">
			<div class="row align-center">
			<div class="columns screen-60 tablet-80 mobile-100 phone-100">


              <form method="post" id="reg_form" name="reg_form">
                <div class="wojo form">
                  <div class="wojo block fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_EMAIL;?>
                        <i class="icon asterisk"></i></label>
                      <input name="email" type="email" placeholder="<?php echo Lang::$word->M_EMAIL;?>">
                    </div>
                    <div class="field">
                      <label><?php echo Lang::$word->M_PASSWORD;?>
                        <i class="icon asterisk"></i></label>
                      <input type="password" name="password" placeholder="********">
                    </div>
                  </div>
                  <div class="wojo fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_FNAME;?>
                        <i class="icon asterisk"></i></label>
                      <input name="fname" type="text" placeholder="<?php echo Lang::$word->M_FNAME;?>">
                    </div>
                    <div class="field">
                      <label><?php echo Lang::$word->M_LNAME;?>
                        <i class="icon asterisk"></i></label>
                      <input name="lname" type="text" placeholder="<?php echo Lang::$word->M_LNAME;?>">
                    </div>
                  </div>
                  <?php echo $this->custom_fields;?>
                  <?php if($this->core->enable_tax):?>
                  <div class="wojo block fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_ADDRESS;?>
                        <i class="icon asterisk"></i></label>
                      <input type="text" name="address" placeholder="<?php echo Lang::$word->M_ADDRESS;?>">
                    </div>
                  </div>
                  <div class="wojo fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_CITY;?>
                        <i class="icon asterisk"></i></label>
                      <input type="text" name="city" placeholder="<?php echo Lang::$word->M_CITY;?>">
                    </div>
                    <div class="field">
                      <label><?php echo Lang::$word->M_STATE;?>
                        <i class="icon asterisk"></i></label>
                      <input type="text" name="state" placeholder="<?php echo Lang::$word->M_STATE;?>">
                    </div>
                  </div>
                  <div class="wojo fields">
                    <div class="field three wide">
                      <label>
                        <?php echo Lang::$word->M_ZIP;?>
                        <i class="icon asterisk"></i></label>
                      <input type="text" name="zip">
                    </div>
                    <div class="field">
                      <label>
                        <?php echo Lang::$word->M_COUNTRY;?>
                        <i class="icon asterisk"></i></label>
                      <select name="country">
                        <?php echo Utility::loopOptions($this->clist, "abbr", "name");?>
                      </select>
                    </div>
                  </div>
                  <?php endif;?>
                  <div class="wojo block fields">
                    <div class="field">
                      <label><?php echo Lang::$word->CAPTCHA;?>
                        <i class="icon asterisk"></i></label>
                      <div class="wojo right labeled fluid input">
                        <input placeholder="<?php echo Lang::$word->CAPTCHA;?>" name="captcha" type="text">
                        <span class="wojo label">
                        <?php echo Session::captcha();?>
                        </span>
                      </div>
                    </div>
                    <div class="field">
                      <div class="wojo checkbox">
                        <input name="agree" type="checkbox" value="1" id="agree">
                        <label for="agree"><a href="<?php echo Url::url('/' . App::Core()->pageslug, $row->page); ?>privacy" class="secondary dashed"><small><?php echo Lang::$word->AGREE;?></small></a> & <a href="<?php echo Url::url('/' . App::Core()->pageslug, $row->page); ?>tos" class="secondary dashed"><small>ToS</small></a>
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="wojo fields align-middle">
                    <div class="field"><span class="wojo small secondary text"><?php echo Lang::$word->M_SUB31;?></span>
                      <a href="<?php echo Url::url('/' . $this->core->system_slugs->login[0]->{'slug' . Lang::$lang});?>"><span class="wojo small text"><?php echo Lang::$word->LOGIN;?>.</span></a>
                    </div>
                    <div class="field content-right">
                      <button class="wojo primary button" data-action="register" name="dosubmit" type="button"><?php echo Lang::$word->M_SUB24;?></button>
                    </div>
                  </div>
                </div>
              </form>

			</div>
			</div>
			</div>
			</div>
</main>
