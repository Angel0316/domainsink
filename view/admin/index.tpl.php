<?php
  /**
   * Index
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2016
   * @version $Id: index.tpl.php, v1.00 2016-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
?>
<h3><?php echo Lang::$word->META_T1;?></h3>
<div class="row gutters">
  <div class="column screen-25 tablet-50 mobile-50 phone-100">
    <div class="wojo secondary card">
      <div class="content content-center"><span class="wojo basic white circular gigantic label"><?php echo $this->counters[0];?></span></div>
      <div class="footer content-center wojo white text"><?php echo Lang::$word->AD_RUSER;?></div>
    </div>
  </div>
  <div class="column screen-25 tablet-50 mobile-50 phone-100">
    <div class="wojo positive card">
      <div class="content content-center"><span class="wojo basic white circular gigantic label"><?php echo $this->counters[1];?></span></div>
      <div class="footer content-center wojo white text"><?php echo Lang::$word->AD_AUSER;?></div>
    </div>
  </div>
  <div class="column screen-25 tablet-50 mobile-50 phone-100">
    <div class="wojo negative card">
      <div class="content content-center"><span class="wojo basic white circular gigantic label"><?php echo $this->counters[2];?></span></div>
      <div class="footer content-center wojo white text"><?php echo Lang::$word->AD_PUSER;?></div>
    </div>
  </div>
  <div class="column screen-25 tablet-50 mobile-50 phone-100">
    <div class="wojo indigo card">
      <div class="content content-center"><span class="wojo basic white circular gigantic label"><?php echo $this->counters[3];?></span></div>
      <div class="footer content-center wojo white text"><?php echo Lang::$word->AD_AMEM;?></div>
    </div>
  </div>
</div>
<?php if(Auth::checkAcl("owner")):?>
<h4><?php echo Lang::$word->AD_TYEAR;?></h4>
<div class="row horizontal-gutters">
  <div class="column screen-80 tablet-70 mobile-100 phone-100">
    <div id="legend" class="wojo small horizontal list align-right"></div>
    <div id="payment_chart" style="height:350px" class="wojo basic segment"></div>
  </div>
  <div class="column screen-20 tablet-30 mobile-100 phone-100">
    <div class="wojo pink attached card">
      <div class="content">
        <p class="wojo bold white text half-bottom-padding"><?php echo Utility::formatMoney($this->stats['totalsum']);?></p>
        <div id="chart1"></div>
      </div>
    </div>
    <div class="wojo space divider"></div>
    <div class="wojo blue attached card">
      <div class="content">
        <p class="wojo bold white text half-bottom-padding"><?php echo $this->stats['totalsales'];?>
          <?php echo Lang::$word->TRX_SALES;?></p>
        <div id="chart2"></div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="columns">
    <h4><?php echo Lang::$word->TRX_POPMEM;?></h4>
  </div>
  <div class="columns">
    <div id="legend2" class="wojo small horizontal list align-right"></div>
  </div>
</div>
<div id="payment_chart2" style="height:350px" class="wojo basic segment"></div>
<?php endif;?>
<?php if(Auth::checkAcl("owner")):?>
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/morris.min.js"></script>
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/raphael.min.js"></script>
<script type="text/javascript" src="<?php echo SITEURL;?>/assets/sparkline.min.js"></script>
<script type="text/javascript"> 
// <![CDATA[	
$(document).ready(function() {
    $('.gigantic.label').each(function() {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 3500,
            step: function(now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

    $("#payment_chart").addClass('loading');
    $("#payment_chart2").addClass('loading');
    $.ajax({
        type: 'GET',
        url: "<?php echo ADMINVIEW;?>/helper.php?getIndexStats=1",
        dataType: 'json'
    }).done(function(json) {
        var legend = '';
        json.legend.map(function(val) {
            legend += val;
        });
        $("#legend").html(legend);
        Morris.Line({
            element: 'payment_chart',
            data: json.data,
            xkey: 'm',
            ykeys: json.label,
            labels: json.label,
            parseTime: false,
            lineWidth: 4,
            pointSize: 6,
            lineColors: json.color,
            gridTextFamily: "Roboto",
            gridTextColor: "rgba(0,0,0,0.6)",
            gridTextSize: 14,
            fillOpacity: '.75',
            hideHover: 'auto',
            xLabelAngle: 35,
            smooth: true,
            resize: true,
        });
        $("#payment_chart").removeClass('loading');
    });

    $.ajax({
        type: 'GET',
        url: "<?php echo ADMINVIEW;?>/helper.php?getMainStats=1",
        dataType: 'json'
    }).done(function(json) {
        var data = json.data;
        json.legend.map(function(v) {
            return $("#legend2").append(v);
        });
        Morris.Area({
            element: 'payment_chart2',
            data: data,
            xkey: 'm',
            ykeys: json.label,
            labels: json.label,
            parseTime: false,
            lineWidth: 4,
            pointSize: 5,
            lineColors: json.color,
            gridTextFamily: "Roboto",
            gridTextColor: "rgba(0,0,0,0.6)",
            fillOpacity: '.65',
            hideHover: 'auto',
            xLabelAngle: 35,
            preUnits: json.preUnits,
            smooth: true,
            resize: true,
        });

        $("#payment_chart2").removeClass('loading');
    });

    var sparkline = function() {
        $('.sparkline').sparkline('html', {
            enableTagOptions: true,
            tagOptionsPrefix: "data"
        });
    }
    var sparkResize;
    $(window).resize(function() {
        clearTimeout(sparkResize);
        sparkResize = setTimeout(sparkline, 500);
        chart1();
        chart2();
    });
    sparkline();


    var barEl1 = $("#chart1");
    var barValues1 = [<?php echo $this->stats['amount_str'];?>];
    var barValueCount1 = barValues1.length;
    var barSpacing1 = 4;
    var chart1 = function() {
        barEl1.sparkline(barValues1, {
            type: 'bar',
            height: 55,
            barWidth: Math.round((barEl1.parent().width() - (barValueCount1 - 1) * barSpacing1) / barValueCount1),
            barSpacing: barSpacing1,
            zeroAxis: false,
            barColor: 'rgba(255,255,255,0.75)'
        });
    }

    var barEl2 = $("#chart2");
    var barValues2 = [<?php echo $this->stats['sales_str'];?>];
    var barValueCount2 = barValues2.length;
    var barSpacing2 = 5;
    var chart2 = function() {
        barEl2.sparkline(barValues2, {
            type: 'bar',
            height: 55,
            barWidth: Math.round((barEl2.parent().width() - (barValueCount2 - 1) * barSpacing2) / barValueCount2),
            barSpacing: barSpacing2,
            zeroAxis: false,
            barColor: 'rgba(255,255,255,0.75)'
        });
    }

    chart1();
    chart2();
});
// ]]>
</script>
<?php endif;?>
