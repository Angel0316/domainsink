<?php
  /**
   * Profile
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: profile.tpl.php, v1.00 2018-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<main class="margin-top">
  <div class="wojo-grid">
    <h1 class="vertical-margin"><?php echo Lang::$word->META_T32;?></h1>
    <div class="row gutters">
      <div class="columns shrink mobile-30 phone-100">
        <div class="wojo boxed card content-center">
          <figure class="wojo basic medium circular image content-center"><img src="<?php echo UPLOADURL;?>/avatars/<?php echo $this->data->avatar ? $this->data->avatar : "blank.png" ;?>" alt=""></figure>
          <p class="half-top-margin"><?php echo Lang::$word->M_JOINED;?>: <?php echo Date::doDate("yyyy", $this->data->created);?></p>
        </div>
      </div>
      <div class="columns mobile-70 phone-100">
        <div class="padding">
          <h2><?php echo Lang::$word->M_SUB32;?>
            <span class="wojo semi primary text"><?php echo $this->data->fname;?>
            <?php echo $this->data->lname;?></span></h2>
          <p><?php echo Lang::$word->M_LASTSEEN;?>: <?php echo Date::timesince($this->data->lastlogin);?></p>
          <div class="wojo small secondary text"><?php echo $this->data->info;?></div>
          <div class="wojo divider"></div>
          <a href="<?php echo $this->data->tw_link;?>" target="_blank" class="wojo primary icon button"><i class="twitter icon"></i></a>
          <a href="<?php echo $this->data->fb_link;?>" target="_blank" class="wojo primary icon button"><i class="facebook icon"></i></a>
          <a href="<?php echo $this->data->gp_link;?>" target="_blank" class="wojo primary icon button"><i class="google plus icon"></i></a>
        </div>
      </div>
    </div>
  </div>
</main>