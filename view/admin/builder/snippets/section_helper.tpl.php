<?php
  /**
   * Block Helper
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: block-helper.tpl.php, v1.00 2018-01-08 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<div id="section-helper" class="transition hidden">
  <div class="header handle">
    <ul class="wojo basic tabs">
      <li class="hide-all">
        <a wojo-tab="rows">Rows</a>
      </li>
      <li class="hide-all">
        <a wojo-tab="blocks">Blocks</a>
      </li>
      <li class="hide-all">
        <a wojo-tab="sections">Sections</a>
      </li>
      <li class="hide-all">
        <a wojo-tab="plugins">Plugins</a>
      </li>
      <li class="hide-all">
        <a wojo-tab="modules">Modules</a>
      </li>
    </ul>
    <a class="close"><i class="icon delete"></i></a>
  </div>
  <div class="content" style="min-height:200px;max-height:600px;overflow-y:scroll;overflow-x:hidden;">
    <div id="rows" class="wojo tab item">
      <div class="grid-blocks row screen-block-3 content-center half-gutters">
        <div class="column">
          <a data-row="1" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_1.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="2" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_2.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="3">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_3.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="4" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_4.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="5" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_5.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="6" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_6.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="7" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_7.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="8" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_8.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="9" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_9.svg">
          </a>
        </div>
        <div class="column">
          <a data-row="10" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_10.svg">
          </a>
        </div>
        <div class="column">&nbsp;</div>
        <div class="column">
          <a data-row="11" data-element="rows">
            <img src="<?php echo ADMINVIEW;?>/builder/images/grid_11.svg">
          </a>
        </div>
      </div>
    </div>
    <div id="blocks" class="wojo tab item">
      <div class="grid-blocks row screen-block-2 content-center half-gutters">
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_2.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_3.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_4.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_5.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_6.png">
          </a>
        </div>
        <div class="column">
          <a data-name="divider" data-element="blocks" data-html="elements/divider_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/divider_7.png">
          </a>
        </div>
      </div>
      <div class="grid-blocks row screen-block-4 content-center half-gutters">
        <div class="column">
          <a data-name="soundcloud" data-element="blocks" data-html="elements/audio_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/audio_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="google map" data-element="blocks" data-html="elements/map_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/map_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="youtube" data-element="blocks" data-html="elements/youtube_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/youtube_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="vimeo" data-element="blocks" data-html="elements/vimeo_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/vimeo_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="image" data-element="blocks" data-html="elements/picture_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/picture_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="button" data-element="blocks" data-html="elements/button_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/button_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="heading" data-element="blocks" data-html="elements/heading_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/heading_1.png">
          </a>
        </div>
        <div class="column">
          <a data-name="paragraph" data-element="blocks" data-html="elements/text_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/text_1.png">
          </a>
        </div>
      </div>
    </div>
    <div id="sections" class="wojo tab item">
      <div class="margin-bottom">
        <select id="blockFilter" class="small fluid">
          <option value="all" selected="selected">All Blocks</option>
          <option value="headers">Headers</option>
          <option value="sections">Content Sections</option>
          <option value="iblocks">Icon Blocks</option>
          <option value="info">Info Blocks</option>
          <option value="testimonials">Testimonials</option>
          <option value="ptables">Pricing Tables</option>
          <option value="cta">Call to Action</option>
          <option value="media">Media Blocks</option>
        </select>
      </div>
      <div id="builder-elements" class="grid-blocks">
        <div class="item">
          <a data-element="headers" data-html="elements/header_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_1.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_2.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_3.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_4.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_5.png">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_6.png">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_7.png">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_8.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_9">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_9.png">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_10">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_10.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_11">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_11.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_12">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_12.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_13">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_13.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="headers" data-html="elements/header_14">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/header_14.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_1.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_2.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_3.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_4.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_5.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_6.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_7.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_8.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_9">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_9.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_10">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_10.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_11">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_11.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_12">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_12.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_13">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_13.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_14">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_14.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_15">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_15.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_16">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_16.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_17">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_17.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_18">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_18.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="sections" data-html="elements/content_19">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/content_19.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_1.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_2.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_3.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_4.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_5.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_6.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_7.png">
          </a>
        </div>
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_8.png">
          </a>
        </div>   
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_9">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_9.png">
          </a>
        </div>  
        <div class="item">
          <a data-element="iblocks" data-html="elements/iblocks_10">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/iblocks_10.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_1.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_2.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_3.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_4.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_5.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_6.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_7.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_8.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="info" data-html="elements/info_9">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/info_9.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_1.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_2.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_3.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_4.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_5.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_6.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_7.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="testimonials" data-html="elements/testimonials_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/testimonials_8.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_1.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_2.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_3.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_4.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_5.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="ptables" data-html="elements/ptables_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/ptables_6.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="cta" data-html="elements/cta_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_1.jpg">
          </a>
        </div> 
        <div class="item">
          <a data-element="cta" data-html="elements/cta_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_2.png">
          </a>
        </div> 
        <div class="item">
          <a data-element="cta" data-html="elements/cta_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_3.png">
          </a>
        </div>
        <div class="item">
          <a data-element="cta" data-html="elements/cta_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_4.png">
          </a>
        </div>
        <div class="item">
          <a data-element="cta" data-html="elements/cta_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_5.png">
          </a>
        </div>
        <div class="item">
          <a data-element="cta" data-html="elements/cta_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_6.png">
          </a>
        </div>
        <div class="item">
          <a data-element="cta" data-html="elements/cta_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/cta_7.png">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_1">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_1.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_2">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_2.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_3">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_3.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_4">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_4.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_5">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_5.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_6">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_6.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_7">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_7.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_8">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_8.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_9">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_9.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_10">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_10.jpg">
          </a>
        </div>
        <div class="item">
          <a data-element="media" data-html="elements/media_11">
            <img src="<?php echo Url::builderUrl($this->core->theme);?>/thumbs/media_11.jpg">
          </a>
        </div>
      </div>
    </div>
    <!-- System Plugins -->
    <div id="plugins" class="wojo tab item">
      <div class="grid-blocks row screen-block-3 half-gutters align-middle">
        <?php if($this->plugins):?>
        <?php foreach($this->plugins as $row):?>
        <?php if($row->plugalias):?>
        <div class="column">
          <a data-element="plugins" data-mode="readonly" data-plugin-id="<?php echo $row->id;?>" data-plugin-plugin_id="<?php echo $row->plugin_id;?>" data-plugin-name="<?php echo htmlspecialchars($row->title);?>" data-plugin-alias="<?php echo $row->plugalias;?>" data-plugin-group="<?php echo $row->groups;?>">
            <img src="<?php echo APLUGINURL . $row->icon;?>">
          </a>
          <p class="wojo tiny text truncate content-center half-top-padding"><?php echo $row->title;?></p>
        </div>
        <?php endif;?>
        <?php endforeach;?>
        <?php endif;?>
      </div>
      
      <!-- User Plugins -->
      <div class="grid-blocks row screen-block-2 half-gutters align-middle">
        <?php if($this->plugins):?>
        <?php foreach($this->plugins as $row):?>
        <?php if(!$row->plugalias):?>
        <div class="column">
          <a data-element="uplugins" data-plugin-id="<?php echo $row->id;?>" data-plugin-name="<?php echo htmlspecialchars($row->title);?>">
            <img src="<?php echo BUILDERVIEW;?>/images/uplugins.jpg">
          </a>
          <p class="wojo tiny text truncate content-center half-top-padding"><?php echo $row->title;?></p>
        </div>
        <?php endif;?>
        <?php endforeach;?>
        <?php endif;?>
      </div>
    </div>
    
    <!-- System Modules -->
    <div id="modules" class="wojo tab item">
      <div class="grid-blocks row screen-block-3 half-gutters align-middle">
        <?php if($this->modules):?>
        <?php foreach($this->modules as $row):?>
        <?php $group = explode("/", $row->modalias);?>
        <div class="column">
          <a data-element="modules" data-mode="readonly" data-module-id="<?php echo $row->parent_id;?>" data-module-module_id="<?php echo $row->id;?>" data-module-name="<?php echo $row->title;?>" data-module-alias="<?php echo $row->modalias;?>" data-module-group="<?php echo $group[0];?>">
            <img src="<?php echo AMODULEURL . $row->icon;?>">
          </a>
          <p class="wojo tiny text truncate content-center half-top-padding"><?php echo $row->title;?></p>
        </div>
        <?php endforeach;?>
        <?php endif;?>
      </div>
    </div>
  </div>
</div>
