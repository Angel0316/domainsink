function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};

jQuery(document).ready(function ($) {

	var vid = getUrlParameter('a');
	var site = getUrlParameter('b');
	var placement = getUrlParameter('c');
	var cid = getUrlParameter('cid');
	var category = getUrlParameter('f');
	var offer = getUrlParameter('w');
	var creative = getUrlParameter('i');
	var lander = getUrlParameter('e');
	var source = getUrlParameter('h');
	var track = getUrlParameter('t');
	var loc = getUrlParameter('loc');
	var clk = getUrlParameter('clk');
	var ext = getUrlParameter('ext');
	var browser = getUrlParameter('browser');

   $('.to-lock').sociallocker({
	theme: 'default',
	share:{
	      url: 'http://www.hotoffer.space/lan.php?a='+vid+'&e='+lander+'&cid='+cid+'&w='+offer+'&clk='+clk+'&t='+track+'&ext='+ext+'&loc='+loc+'&b='+site+'&i='+offer+'&f='+category+'&h='+source+'&c='+source+'&browser='+browser
	   },
	text: {
        header: "Share To Check If You Are Eligible For Our Gift!",
		message: "<b><span style='color:red'>HURRY UP!</span> TIME LEFT: <span id=\"javascript_countdown_time\" style=\"color:red;font-size:14px;\"><span></span></span></b><br>(refresh page if you see an error)"
    },
	facebook:{
	   appId: '741859679335930',

	},
	buttons:{
	   order: ["facebook-share"],
	   counters: false,
	   lazy: true
	}
   });
});