<?php
  /**
   * Activation
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: activation.tpl.php, v1.00 2018-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<!-- start bing pixel -->
<script>(function(w,d,t,r,u){var f,n,i;w[u]=w[u]||[],f=function(){var o={ti:"26098342"};o.q=w[u],w[u]=new UET(o),w[u].push("pageLoad")},n=d.createElement(t),n.src=r,n.async=1,n.onload=n.onreadystatechange=function(){var s=this.readyState;s&&s!=="loaded"&&s!=="complete"||(f(),n.onload=n.onreadystatechange=null)},i=d.getElementsByTagName(t)[0],i.parentNode.insertBefore(n,i)})(window,document,"script","//bat.bing.com/bat.js","uetq");</script>
<!-- end bing pixel -->
<div class="wojo-grid">
  <?php if(Validator::get('done')):?>
  <?php Message::msgOk(Lang::$word->M_INFO9 . '<a href="' . Url::url('/' . $this->core->system_slugs->login[0]->{'slug' . Lang::$lang}) . '">' . Lang::$word->M_INFO9_1 . '</a>');?>
  <?php else:?>
  <?php echo Message::msgError(Lang::$word->M_INFO10);?>
  <?php endif;?>
<?php
if (isset($_COOKIE['t_'])) {

	$trck = $_COOKIE['t_'];

	$postback = "http://www.trckc.xyz/lead.php?s2=525&s3=".$trck;

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $postback);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	//curl_setopt ($ch, CURLOPT_CAINFO, dirname(__FILE__)."/cacert.pem");
	curl_exec($ch);
	curl_close($ch);
}
?>
</div>