(function() {
	mobileActivity();
	window.onresize = function(event) {
		mobileActivity();
	};
})();
function togEvents(a){
	(function( $ ) {
		var sw = $(a).closest('div').find('.trainer-schedule-wrapper');
		$(sw).slideToggle();
		$('.trainer-schedule-wrapper').each(function(){
			if(!$(this).is(sw))
				$(this).hide();
		});		
	})(jQuery);	
}
function mobileActivity(){
	(function( $ ) {
		var winWidth = $(window).width(),
		sw = $('.trainer-schedule-wrapper'),
		dl = $('.trainer-day-label');
		if(winWidth <= 991){			
			if($(sw).length != 0){
				$(sw).each(function(){
					this.style = "display:none;";
				});
				$(dl).each(function(){
					$(this).attr('onclick', 'togEvents(this)');
				});
			}
		}else{
			$(sw).removeAttr('style');
			$(dl).removeAttr('onclick');
		}		
	})(jQuery);	
}
