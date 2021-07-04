<?php
  /**
   * Footer
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2016
   * @version $Id: footer.tpl.php, v1.00 2016-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<!-- Footer -->
<footer>
  <div class="wrapper">
    <div class="wojo-grid">
      <div class="row gutters">
        <div class="columns screen-50 tablet-50 mobile-100 phone-100">
          <div class="vertical-margin">
            <h2 class="half-vertical-margin"><span class="wojo semi primary text">Have a Question?</span></h2>
              <h6>Check Our <a href="https://www.domainsink.com/domains/faq">FAQ</a> or send us a message!</h6>
            <a href="https://www.domainsink.com/domains/contact" class="wojo primary button">Contact Us</a>
          </div>
        </div>
        <div class="columns screen-50 tablet-50 mobile-100 phone-100">
          <div class="vertical-margin">
            <div class="row gutters">
              <div class="columns phone-100">
                <h6>&nbsp;</h6>
                <div class="wojo small relaxed list">
                  <div class="item">&nbsp;
                  </div>
                  <div class="item">&nbsp;
                  </div>
                  <div class="item">&nbsp;
                  </div>
                  <div class="item">&nbsp;
                  </div>
                  <div class="item">&nbsp;
                  </div>
                </div>
              </div>
               <div class="columns phone-100">
                <h6>DomainSink</h6>
                  <div class="wojo small relaxed list">
                  <div class="item"><a href="https://www.domainsink.com/domains/about" class="secondary">About</a>
                  </div>
                  <div class="item"><a href="https://www.domainsink.com/domains/privacy" class="secondary">Privacy</a>
                  </div>
                  <div class="item"><a href="https://www.domainsink.com/domains/tos" class="secondary">TOS</a>
                  </div>
                  <div class="item">&nbsp;
                  </div>
				  <div class="item">
				  <p class="wojo small black text">
				  <span class="logo wojo icon text">
				  <?php echo ($this->core->logo) ? '<img src="' . SITEURL . '/uploads/' . $this->core->logo . '" alt="'.$this->core->company . '" class="wojo basic image">': null;?> Copyright &copy;<?php echo date('Y') . ', '. $this->core->company;?>
				  </span>
				  </p>
				  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
      <div class="row">
        <div class="columns">
          <div class="content-center">
            <a href="<?php echo SITEURL;?>" class="wojo small simple icon secondary button"><i class="icon home"></i></a>
            <a href="//validator.w3.org/check/referer" target="_blank" class="wojo small simple icon secondary button"><i class="icon html5"></i></a>
            <!--<a href="<?php echo URl::url('/' . $this->core->system_slugs->sitemap[0]->{'slug' . Lang::$lang});?>" class="wojo small simple icon secondary button"><i class="icon apps"></i></a>-->
            <!--<a href="<?php echo SITEURL;?>/rss.php" class="wojo small simple icon secondary button"><i class="icon rss"></i></a>-->
            <a href="//<?php echo $this->core->social->facebook;?>" class="wojo small simple icon secondary button"><i class="icon facebook"></i></a>
            <a href="//<?php echo $this->core->social->twitter;?>" class="wojo small simple icon secondary button"><i class="icon twitter"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <figure class="absolute">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="271 -32.7 589.5 112.7">
      <linearGradient id="aa" x1="546.629" x2="574.638" y1="75.039" y2="-83.805" gradientTransform="matrix(1 0 0 -1 0 46.6)" gradientUnits="userSpaceOnUse">
        <stop offset="0" stop-color="#00dffc"/>
        <stop offset="1" stop-color="#377dff"/>
      </linearGradient>
      <path fill="url(#aa)" d="M271 32S402.5-30.5 548 8.5s205 66 312.5 71.5H271V32z"/>
      <path fill="#377DFF" d="M271-32.7c0 .1 38.9 5.7 42.5 6.4C351.2-19 387.9-6.8 421.9 11c15.5 8.2 30.3 17.6 45.6 26.3 22.2 12.7 45.4 22.1 70.1 28.9 11 3 22.2 5.5 33.4 7.7 13.6 2.6 27.3 4.7 41 6.2H271V-32.7z"/>
    </svg>
  </figure>
</footer>
<a href="#" id="back-to-top" title="Back to top"><i class="icon long arrow up"></i></a>
<script type="text/javascript" src="<?php echo THEMEURL;?>/js/master.js"></script>
<?php Debug::displayInfo();?>
<script type="text/javascript"> 
// <![CDATA[  
<?php if($this->core->ploader):?>
$(window).on('load', function() {
	setTimeout(function() {
		$("body").addClass("loaded");
	}, 200);
});
<?php endif;?>
$(document).ready(function() {
    $.Master({
		url: "<?php echo FRONTVIEW;?>",
		surl: "<?php echo SITEURL;?>",
        weekstart: <?php echo(App::Core()->weekstart);?>,
		ampm: <?php echo (App::Core()->time_format) == "HH:mm" ? 0 : 1;?>,
        lang: {
            monthsFull: [ <?php echo Date::monthList(false);?> ],
            monthsShort: [ <?php echo Date::monthList(false, false);?> ],
            weeksFull: [ <?php echo Date::weekList(false); ?> ],
            weeksShort: [ <?php echo Date::weekList(false, false);?> ],
			weeksMed: [ <?php echo Date::weekList(false, false, true);?> ],
            button_text: "<?php echo Lang::$word->BROWSE;?>",
            empty_text: "<?php echo Lang::$word->NOFILE;?>",
			sel_pic: "<?php echo Lang::$word->SELIMG;?>",
        }
    });
	<?php if($this->core->eucookie):?>
    $("body").acceptCookies({
        position: 'top',
        notice: '<?php echo Lang::$word->EU_NOTICE;?>',
        accept: '<?php echo Lang::$word->EU_ACCEPT;?>',
        decline: '<?php echo Lang::$word->EU_DECLINE;?>',
        decline_t: '<?php echo Lang::$word->EU_DECLINE_T;?>',
        whatc: '<?php echo Lang::$word->EU_W_COOKIES;?>'
    });
	<?php endif;?>
});
// ]]>
</script>
<?php if($this->core->analytics):?>
<script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo $this->core->analytics;?>"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', '<?php echo $this->core->analytics;?>');
</script>
<?php endif;?>
</body></html>