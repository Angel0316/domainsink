<link rel="stylesheet" type="text/css" href="https://www.domainsink.com/view/front/themes/domains/cache/datatables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://www.domainsink.com/view/front/themes/domains/cache/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="https://www.domainsink.com/view/front/themes/domains/cache/bootstrap4.min.css"/>
<script type="text/javascript" src="https://www.domainsink.com/view/front/themes/domains/cache/datatables.min.js"></script>
<script type="text/javascript" src="https://www.domainsink.com/view/front/themes/domains/cache/bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script type="text/javascript">
function format ( d ) {
    var div = $('<div/>')
        .addClass( 'loading' )
        .html( '<strong>Loading...</strong>' );
 
    $.ajax( {
		type: 'POST',
        url: 'https://www.domainsink.com/view/front/plugins_/domlist/details.php',
        data: {
            domid: d.DT_RowId,
			passing: 1
        },
		dataType: 'html',
        success: function (msg) {
           div.html( msg );
        }
    } );
 
    return div;
}
 
$(document).ready(function() {


    var dt = $('#example').DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax": "https://www.domainsink.com/view/front/plugins_/domlist/pull.php",
        "columns": [
            {
                "class":          "details-control",
                "orderable":      false,
                "data":           null,
                "defaultContent": ""
            },
            { "data": "name" },
            { "data": "hits" },
            { "data": "auction" },
            { "data": "askedprice" },
            { "data": "catname" },
            { "data": "domtype" },
            { "data": "da" },
            { "data": "pa" },
            { "data": "juice" },
            { "data": "juiceandnojuice" },
            { "data": "alexa" },
            { "data": "dmoz" },
            { "data": "google" },
            { "data": "fb" },
            { "data": "archiveorg" },

            {
    
                "orderable":      false,
                "data":           "registrar"
            },

        ],
        "order": [[1, 'asc']]
    } );
 
    // Array to track the ids of the details displayed rows
    var detailRows = [];
 
    $('#example tbody').on( 'click', 'tr td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = dt.row( tr );
        var idx = $.inArray( tr.attr('id'), detailRows );
 
        if ( row.child.isShown() ) {
            tr.removeClass( 'details' );
            row.child.hide();
 
            // Remove from the 'open' array
            detailRows.splice( idx, 1 );
        }
        else {
            tr.addClass( 'details' );
            row.child( format( row.data() ) ).show();
 
            // Add to the 'open' array
            if ( idx === -1 ) {
                detailRows.push( tr.attr('id') );
            }
        }
    } );
 
    // On each draw, loop over the `detailRows` array and show any child rows
    dt.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } );
} );
	</script>
<style>
.l {
  color: white;
  font-size:12px;
  padding-left: 4px;
  padding-right: 4px;
}
.font_one {font-size:14px;}
td.details-control {
    background: url('https://www.domainsink.com/uploads/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.details td.details-control {
    background: url('https://www.domainsink.com/uploads/details_close.png') no-repeat center center;
}.dan {    background: url('https://www.domainsink.com/uploads/dan.png') no-repeat center center;	width:20px;	height:20px;}
.dynadot {
    background: url('https://www.domainsink.com/uploads/dynadot.png') no-repeat center center;
	width:20px;
	height:20px;
}
.namesilo {
    background: url('https://www.domainsink.com/uploads/namesilo.png') no-repeat center center;
	width:20px;
	height:20px;
}

.plus {
    background: url('https://www.domainsink.com/uploads/details_open.png') no-repeat center center;
	width:20px;
	height:20px;
}
.minus {
    background: url('https://www.domainsink.com/uploads/details_close.png') no-repeat center center;
	width:20px;
	height:20px;
}
.l {
  color: white;
  font-size:12px;
  padding-left: 4px;
  padding-right: 4px;
}
.regular {background-color: #9db569;} /* Green */
.featured {background-color: #6699ff;} /* Blue */
.premium {background-color: #ff9933;} /* Orange */
.other {background-color: #e7e7e7; color: black;} /* Gray */ 
.auction {background-color: #ff9900;} /* Orange auction */
.sort {
   background-image: url(https://www.domainsink.com/uploads/sort_both.png)  no-repeat center center;
	width:20px;
	height:20px;
}
.faded {color:#efebeb;}
</style>
<?php
  /**
   * Domain list
   *
   */

  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
  
  Bootstrap::Autoloader(array(APLUGPATH . 'domlist/'));


?>
 <div class="wojo-grid">
  <h4>
    <?php echo Lang::$word->DOMAINS;?>
  </h4>
</div>
<div class="row align-center">
<div class="row gutters" style="width:98%">
      <div class="columns mobile-50 phone-100">
          <div class="wojo text font_one" style="padding-top:10px;">
			<table id="example" class="table table-striped" style="width:100%">
					<thead>
						<tr>
							<th></th>
							<th><span class="wojo secondary text font_one" title="Domain for sale">Domain</span></th>
							<th><span class="wojo secondary text font_one" title="Number of hits since domain was listed">Hits</span></th>
							<th><span class="wojo secondary text font_one" title="Auction or Flat rate">Offer</span></th>
							<th><span class="wojo secondary text font_one" title="Price">Price</span></th>
							<th><span class="wojo secondary text font_one" title="Category">Category</span></th>
							<th><span class="wojo secondary text font_one" title="Type of the domain - Regular, Featured or Premium">Type</span></th>
							<th><span class="wojo secondary text font_one" title="Domain authority (MOZ Metrics)">DA</span></th>
							<th><span class="wojo secondary text font_one" title="Page authority (MOZ Metrics)">PA</span></th>
							<th><span class="wojo secondary text font_one" title="External links that pass link juice (MOZ Metrics)">JLinks</span></th>
							<th><span class="wojo secondary text font_one" title="All external links (MOZ Metrics)">ALinks</span></th>
							<th><span class="wojo secondary text font_one" title="Alexa global rank">Alexa</span></th>
							<th><span class="wojo secondary text font_one" title="Dmoz listing">Dmoz</span></th>
							<th><span class="wojo secondary text font_one" title="Links indexed by Google">Google</span></th>
							<th><span class="wojo secondary text font_one" title="Total Facebook shares of the domain (full url share counts are not included)">FB</span></th>
							<th><span class="wojo secondary text font_one" title="Archive.org captures">Arc</span></th>
							<th title="Buy domain"><i data-type="icon" class="icon money" style="color:#99cc66"></i></th>
						</tr>

					</thead>
			</table>
<div style="border-top:1px solid #eeeded;padding-top:5px;margin-top:10px;">
			<p><span class="wojo secondary text font_one"><strong>CONTROLS:</strong></span></p>
			<p>
			<div style="float:left" class="plus"></div>
			<div style="float:left"><small class="wojo secondary text grey">&nbsp;&nbsp;Click to see details&nbsp;</small></div>
			<div style="float:left" class="minus"></div>
			<div style="float:left"><small class="wojo secondary text grey">&nbsp;&nbsp;Click to close details&nbsp;</small></div>
			<div style="clear:both"></div>
			</p>
			<p><span class="wojo secondary text font_one"><strong>LEGEND:</strong></span></p>
			<div style="float:left"><span class="l auction">A</span> <small class="wojo secondary text grey">- Auction&nbsp;</small></div>
			<div style="float:left"><span class="l other">F&nbsp;</span> <small class="wojo secondary text grey">- Flat rate&nbsp;</small></div>
			<div style="float:left"><span class="l regular">RE</span> <small class="wojo secondary text grey">- Regular, low cost domains&nbsp;</small></div>
			<div style="float:left"><span class="l featured">FE</span> <small class="wojo secondary text grey">- Featured, high price domains&nbsp;</small></div>
			<div style="float:left"><span class="l premium">PR</span> <small class="wojo secondary text grey">- Premium, top price domains&nbsp;</small></div>
			<div style="clear:both"></div>
			<p>			<div style="float:left" class="dan"></div>			<div style="float:left"><small class="wojo secondary text grey"> Buy this domain at Dan.com&nbsp;</small></div>			
			<div style="float:left" class="dynadot"></div>
			<div style="float:left"><small class="wojo secondary text grey"> Buy this domain at Dynadot&nbsp;</small></div>
			<div style="float:left" class="namesilo"></div>
			<div style="float:left"><small class="wojo secondary text grey"> Buy this domain at Namesilo&nbsp;</small></div>
			<div style="clear:both"></div>
			</p>
</div>
		  </div>
	  </div>
</div>
</div>