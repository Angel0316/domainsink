<?php
  /**
   * Update
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2019
   * @version $Id: upgrade.php, v1.00 2019-02-22 10:12:05 gewa Exp $
   */
  define("_WOJO", true);
  require_once ("init.php");
  
    if (isset($_POST['submit'])) {
		Db::run()->pdoQuery("
			CREATE TABLE `mod_faq_categories`(
				`id` int(6) unsigned NOT NULL  auto_increment , 
				`name_en` varchar(50) COLLATE utf16_general_ci NOT NULL  , 
				`sorting` int(6) unsigned NOT NULL  DEFAULT 0 , 
				PRIMARY KEY (`id`) 
			) ENGINE=MyISAM DEFAULT CHARSET='utf16' COLLATE='utf16_general_ci';
		");

		Db::run()->pdoQuery("
			ALTER TABLE `mod_faq`  
				ADD COLUMN `category_id` int(4) unsigned   NOT NULL DEFAULT 0 after `id` ;
		");
		
		Db::run()->pdoQuery("
			ALTER TABLE `pages`  
				ADD COLUMN `show_header` tinyint(1) unsigned   NOT NULL DEFAULT 1 after `custom_bg_en` ;
		");
		
		Db::run()->pdoQuery("
			ALTER TABLE `plug_slider` 
				ADD COLUMN `autoplay` tinyint(1) unsigned   NOT NULL DEFAULT 0 after `layout` , 
				ADD COLUMN `autoplaySpeed` smallint(1) unsigned   NOT NULL DEFAULT 1000 after `autoplay` , 
				ADD COLUMN `autoplayHoverPause` tinyint(1) unsigned   NOT NULL DEFAULT 1 after `autoplaySpeed` , 
				ADD COLUMN `autoloop` tinyint(1) unsigned   NOT NULL DEFAULT 1 after `autoplayHoverPause` , 
				CHANGE `height` `height` smallint(3) unsigned   NOT NULL DEFAULT 100 after `autoloop` , 
				ADD COLUMN `fullscreen` tinyint(1) unsigned   NOT NULL DEFAULT 0 after `height` , 
				CHANGE `settings` `settings` blob   NULL after `fullscreen` , 
				DROP COLUMN `slidesTime` , 
				DROP COLUMN `transition` , 
				DROP COLUMN `automaticSlide` , 
				DROP COLUMN `showProgressBar` , 
				DROP COLUMN `pauseOnHover` , 
				DROP COLUMN `slidesEaseIn` , 
				DROP COLUMN `width` ;
		");
		
		Db::run()->pdoQuery("
			ALTER TABLE `plug_slider_data` 
				ADD COLUMN `attrib` varchar(60)  COLLATE utf8_general_ci NULL after `color` , 
				CHANGE `mode` `mode` varchar(2)  COLLATE utf8_general_ci NOT NULL DEFAULT 'bg' after `attrib` ;
		");
		
		Db::run()->pdoQuery("
			ALTER TABLE `settings` 
				CHANGE `analytics` `analytics` varchar(100)  COLLATE utf8_general_ci NULL after `logging` ;
		");
		
		Db::run()->pdoQuery("
			UPDATE `settings` SET `wojov` = '5.10' WHERE `id` = '1'; 
		");
		
		if (count(App::Core()->langlist) > 1) {
			foreach(App::Core()->langlist as $row) {
				$flag_id = $row->abbr;
				if($row->abbr == "en") {
					continue;
				}
				Db::run()->pdoQuery("ALTER TABLE mod_faq_categories ADD name_$flag_id varchar(50) NOT NULL AFTER name_en");
			}
		}
		
		Url::redirect(SITEURL . "/upgrade.php?update=done");
	}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CMS pro Upgrade</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway:400,100,300,600,700);
body {
  font-family: Raleway, Arial, Helvetica, sans-serif;
  font-size: 14px;
  line-height: 1.3em;
  color: #FFF;
  background-color: #222;
  font-weight: 300;
  margin: 0;
  padding: 0
}
#wrap {
  width: 800px;
  margin-top: 150px;
  margin-right: auto;
  margin-left: auto;
  background-color: #208ed3;
  box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.1);
  border: 2px solid #111;
  border-radius: 3px
}
header {
  background-color: #145983;
  font-size: 26px;
  font-weight: 200;
  padding: 35px
}
.line {
  height: 2px;
  background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 47%, rgba(255,255,255,0) 100%)
}
.line2 {
  position: absolute;
  left: 200px;
  height: 360px;
  width: 2px;
  background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 47%, rgba(255,255,255,0) 100%);
  display: block
}
#content {
  position: relative;
  padding: 45px 20px
}
#content .left {
  float: left;
  width: 200px;
  height: 400px;
  background-image: url(assets/images/installer.png);
  background-repeat: no-repeat;
  background-position: 10px center
}
#content .right {
  margin-left: 200px
}
h4 {
  font-size: 18px;
  font-weight: 300;
  margin: 0 0 40px;
  padding: 0
}
p.info {
  background-color: #383838;
  border-radius: 3px;
  box-shadow: 1px 1px 1px 1px rgba(0,0,0,0.1);
  padding: 10px
}
p.info span {
  display: block;
  float: left;
  padding: 10px;
  background: rgba(255,255,255,0.1);
  margin-left: -10px;
  margin-top: -10px;
  border-radius: 3px 0 0 3px;
  margin-right: 5px;
  border-right: 1px solid rgba(255,255,255,0.05)
}
footer {
  background-color: #383838;
  padding: 20px
}
form {
  display: inline-block;
  float: right;
  margin: 0;
  padding: 0
}
.button {
  border: 2px solid #222;
  font-family: Raleway, Arial, Helvetica, sans-serif;
  font-size: 14px;
  color: #FFF;
  background-color: #208ED3;
  text-align: center;
  cursor: pointer;
  font-weight: 600;
  transition: all .35s ease;
  outline: none;
  margin: 0;
  padding: 5px 20px
}
.button:hover {
  background-color: #222;
  transition: all .55s ease;
  outline: none
}
.clear {
  font-size: 0;
  line-height: 0;
  clear: both;
  height: 0
}
.clearfix:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
a {
  text-decoration: none;
  float: right
}
</style>

<body>
<div id="wrap">
  <header>Welcome to CMS pro Upgrade Wizard</header>
  <div class="line"></div>
  <div id="content">
    <div class="left">
      <div class="line2"></div>
    </div>
    <div class="right">
      <h4>CMS pro Upgrade</h4>
      <?php if(Validator::compareNumbers(5.1, App::Core()->wojov, "<")):?>
      <p class="info"><span>Warning!</span>You need at least CMS pro v5.00 in order to continue.</p>
      <?php else:?>
      <?php if(isset($_GET['update']) && $_GET['update'] == "done"):?>
      <p class="info"><span>Success!</span>Installation Completed. Please delete upgrade.php</p>
      <?php else:?>
      <p class="info"><span>Warning!</span>Please make sure you have performed database backup!!!</p>
      <p style="margin-top:60px">When ready click Install button.</p>
      <p><span>Please be patient, and<strong> DO NOT</strong> Refresh your browser.<br>
        This process might take a while</span>.</p>
      <?php endif;?>
      <?php endif;?>
    </div>
  </div>
  <div class="clear"></div>
  <footer class="clearfix">
    <small>current <b>cmspro v.<?php echo App::Core()->wojov;?></b></small>
    <?php if(isset($_GET['update']) && $_GET['update'] == "done"):?>
    <a href="admin/index.php" class="button">Back to admin panel</a>
    <?php else:?>
    <form method="post" name="upgrade_form">
      <?php if(Validator::compareNumbers(5.1, App::Core()->wojov, ">")):?>
      <input name="submit" type="submit" class="button" value="Upgrade to CMS pro (5.1)" id="submit" />
      <?php endif;?>
    </form>
    <?php endif;?>
  </footer>
</div>
</body>
</html>