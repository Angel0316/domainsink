<?php
  /**
   * Load Language Section
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2018
   * @version $Id: loadLanguageSection.tpl.php, v1.00 2018-01-08 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<?php
  $i = 0;
  $html = '';

  switch ($this->type):
      case "plugins":
      case "modules":
          foreach ($this->xmlel as $pkey):
              $i++;
              $html .= '
		  <div class="item">
			<div class="content"><span data-editable="true" data-set=\'{"type": "phrase", "id": ' . $i . ',"key":"' . $pkey['data'] .
                  '", "path":"' . $this->fpath . '"}\'>' . $pkey . '</span></div>
			<div class="content shrink"><span class="wojo small tiny label">' . $pkey['data'] . '</span></div>
		  </div>';
          endforeach;
          break;

      case "filter":
          foreach ($this->section as $pkey):
              $i++;
              $html .= '
		  <div class="item">
			<div class="content"><span data-editable="true" data-set=\'{"type": "phrase", "id": ' . $i . ',"key":"' . $pkey['data'] .
                  '", "path":"lang"}\'>' . $pkey . '</span></div>
			<div class="content shrink"><span class="wojo small tiny label">' . $pkey['data'] . '</span></div>
		  </div>';
          endforeach;
          break;

      default:
          foreach ($this->xmlel as $pkey):
              $i++;
              $html .= '
		  <div class="item">
			<div class="content"><span data-editable="true" data-set=\'{"type": "phrase", "id": ' . $i . ',"key":"' . $pkey['data'] .
                  '", "path":"lang.xml"}\'>' . $pkey . '</span></div>
			<div class="content shrink"><span class="wojo small tiny label">' . $pkey['data'] . '</span></div>
		  </div>';
          endforeach;
          break;

  endswitch;
  echo $html;