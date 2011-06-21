jQuery.fn.scrollView = function () {
    return this.each(function () {
        jQuery('html, body').animate({
            scrollTop: jQuery(this).offset().top -35
        }, 250);
    });
}

jQuery(document).ready(function(){
	jQuery(".sections > li > a").click(function(){
		var location = jQuery(this);
		if (jQuery(this).hasClass('active')) {
			jQuery(this).parent().css('margin-top', '0');
			jQuery(this).toggleClass("active").next().slideToggle(100);
			jQuery('html, body').stop().animate({scrollTop:0}, 250);
			return false;
		}
		else {
			jQuery(".sections > li > a.active").parent().css('margin-top', '0');
			jQuery(".sections > li > a.active").next().slideToggle(100);
			jQuery(".sections > li > a.active").removeClass('active');
			setTimeout( function() {
				jQuery(location).parent().css('margin-top', '35px');
				jQuery(location).toggleClass("active").next().slideToggle(100);
				jQuery(location).scrollView();
			}, 100);
			return false;
		}
	});
});

jQuery('#contents ol > li > a').click(function() {
	var destination = jQuery(this).attr("href");
	if (jQuery('a', destination).hasClass('active')) {
		jQuery(destination).parent.scrollView();
	}
	else {
		jQuery(".sections > li > a.active").parent().css('margin-top', '0');
		jQuery(".sections > li > a.active").next().slideToggle(100);
		jQuery(".sections > li > a.active").removeClass('active');
		setTimeout( function() {
			jQuery('.clicker', destination).parent().css('margin-top', '35px');
			jQuery('.clicker', destination).toggleClass("active").next().slideToggle(100);
			jQuery(destination).scrollView();
		}, 100);
		return false;
	}
});