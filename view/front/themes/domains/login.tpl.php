<?php
  /**
   * Login
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: login.tpl.php, v1.00 2018-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
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

<main>
<div class="content-center">
<h1 class="wojo primary text"><?php echo Lang::$word->WELCOME;?> <span class="wojo semi text"><?php echo Lang::$word->BACK;?></span></h1>
  <p><?php echo Lang::$word->M_SUB19;?></p>
</div>
<div class="wojo-grid">
<div class="wojo divider"></div>
</div>
			<div class="section" style="padding:32px 0">
			<div class="wojo-grid">
			<div class="row align-center">
			<div class="columns screen-60 tablet-80 mobile-100 phone-100">
            <div id="loginForm">
              <form method="post" id="login_form" name="wojo_form">
                <div class="wojo form">
                  <div class="wojo block fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_EMAIL;?></label>
                      <input placeholder="<?php echo Lang::$word->M_EMAIL;?>" name="email" type="text">
                    </div>
                    <div class="field">
                      <span class="wojo mini text push-right"><a id="passreset" class="secondary dashed"><?php echo Lang::$word->M_PASSWORD_RES;?>?</a>
                      </span>
                      <label><?php echo Lang::$word->M_PASSWORD;?></label>
                      <input placeholder="********" name="password" type="password">
                    </div>
                  </div>
                  <div class="wojo fields">
                    <div class="field align-middle">
                      <p class="wojo small text"><?php echo Lang::$word->M_SUB20;?>
                        <a href="https://www.domainsink.com/trck/go.php?url=<?php echo Url::url('/' . App::Core()->system_slugs->register[0]->{'slug' . Lang::$lang});?>"><?php echo Lang::$word->M_SUB21;?>.</a>
                      </p>
                    </div>
                    <div class="field content-right">
                      <button id="doLogin" class="wojo primary wide button" name="submit" type="button"><?php echo Lang::$word->LOGIN;?></button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div id="passForm" class="hide-all">
              <form method="post" id="pass_form" name="pass_form">
                <h3 class="wojo primary text"><?php echo Lang::$word->M_SUB27;?>
                  <span class="wojo semi text"><?php echo Lang::$word->M_SUB27_1;?></span></h3>
                <p><?php echo Lang::$word->M_SUB28;?></p>
                <div class="wojo form">
                  <div class="wojo block fields">
                    <div class="field">
                      <label><?php echo Lang::$word->M_EMAIL;?></label>
                      <input placeholder="<?php echo Lang::$word->M_EMAIL;?>" name="pemail" type="email">
                    </div>
                  </div>
                  <div class="wojo fields">
                    <div class="field align-middle">
                      <p class="wojo small text">
                        <a id="backToLogin"><?php echo Lang::$word->M_SUB14;?></a>
                      </p>
                    </div>
                    <div class="field content-right">
                      <button id="doPassword" class="wojo primary wide button" name="submit" type="button"><?php echo Lang::$word->M_SUB29;?></button>
                    </div>
                  </div>
                </div>
              </form>
            </div>

      		</div>
			</div>
			</div>
			</div>    
</main>
