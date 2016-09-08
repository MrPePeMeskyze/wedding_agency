/**	
	Custom JS
	
	1. DROPDOWN MENU
	2. FIXED TOP MENU BAR
	3. TOP SLIDER
	4. WHY CHOOSE SLIER(SLICK SLIDER)
	5. COUNTER
	6. DOCTORS TEAM SLIDER(SLICK SLIDER)
	7. TESTIMONIAL SLIDER(SLICK SLIDER)
	8. PRELOADER
	9. SCROLL TOP BUTTON
	10. ACCORDION	 	
	
**/

jQuery(function($){


  /* ----------------------------------------------------------- */
  /*  1. DROPDOWN MENU
  /* ----------------------------------------------------------- */

   // for hover dropdown menu
  $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
    });

	/* ----------------------------------------------------------- */
	/*  2. Fixed Top Menubar
	/* ----------------------------------------------------------- */

	// For fixed top bar
    //   $(window).scroll(function(){
    //    if($(window).scrollTop() >50 /*or $(window).height()*/){
    //         $(".navbar-fixed-top").addClass('past-main');
    //        $(".navbar-right .dropdown-menu").css('top','70px');   
    //    }
    //else{    	
    //  $(".navbar-fixed-top").removeClass('past-main');
    //  $(".navbar-right .dropdown-menu").css('top','75px');
    //  }
    //});
    

    /* ----------------------------------------------------------- */
	/*  3. Top Slider
	/* ----------------------------------------------------------- */     
	     $('.top-slider').slick({
		  dots: false,
		  arrows:true,
		  autoplay: true,
		  speed: 500,
		  fade: true,
		  cssEase: 'linear'
		});
    /* ----------------------------------------------------------- */
	/*  4. Why Choose Slider(Slick Slider)
	/* ----------------------------------------------------------- */ 

	$('.whychoose-slider').slick({
	  dots: false,
      infinite: true,      
      speed: 800,
      arrows:true,      
      slidesToShow: 1,
      slide: 'div',
      autoplay: true,
      fade: false,
      autoplaySpeed: 5000,
      cssEase: 'linear'
	});
	
	/* ----------------------------------------------------------- */
	/*  4.1 Service-Slider(Slick Slider)
	/* ----------------------------------------------------------- */ 

	$('.services-slider').slick({
	  centerMode: true,
	  infinite: true,
	  autoplay: true,
	  centerPadding: '60px',
	  fade: false,
      autoplaySpeed: 5000,
      cssEase: 'linear',
	  lazyLoad: 'ondemand',
	  slide: 'div',
	  speed: 800,
      arrows:true, 
	  slidesToShow: 3,
	  responsive: [
		{
		  breakpoint: 750,
		  settings: {
			  centerMode: true,
			  infinite: true,
			  autoplay: true,
			  centerPadding: '60px',
			  fade: false,
			  autoplaySpeed: 5000,
			  cssEase: 'linear',
			  lazyLoad: 'ondemand',
			  slide: 'div',
			  speed: 800,
			  arrows:true, 
			  slidesToShow: 2
		  }
		},
		{
		  breakpoint: 500,
		  settings: {
			  centerMode: true,
			  infinite: true,
			  autoplay: true,
			  centerPadding: '60px',
			  fade: false,
			  autoplaySpeed: 5000,
			  lazyLoad: 'ondemand',
			  cssEase: 'linear',
			  slide: 'div',
			  speed: 800,
			  arrows:false, 
			  slidesToShow: 1
		  }
		}
	  ]
	});

	/* ----------------------------------------------------------- */
	/*  5. Counter
	/* ----------------------------------------------------------- */ 

	  $('.counter').counterUp({
            delay: 10,
            time: 1000
        });



	/* ----------------------------------------------------------- */
	/*  7. Testimonial Slider 
	/* ----------------------------------------------------------- */ 

	$('.testimonial-nav').slick({
	  dots: true,
      infinite: true,      
      speed: 800,
      arrows:false,      
      slidesToShow: 1,
      slide: 'li',
      autoplay: true,
      fade: true,
      autoplaySpeed: 5000,
      cssEase: 'linear'
	});

	/* ----------------------------------------------------------- */
	/*  8. PRELOADER 
	/* ----------------------------------------------------------- */ 

	  jQuery(window).load(function() { // makes sure the whole site is loaded
      $('#status').fadeOut(); // will first fade out the loading animation
      $('#preloader').delay(100).fadeOut('slow'); // will fade out the white DIV that covers the website.
      $('body').delay(100).css({'overflow':'visible'});
    })
	  
	/* ----------------------------------------------------------- */
	/*  9. SCROLL TOP BUTTON
	/* ----------------------------------------------------------- */

	//Check to see if the window is top if not then display button

	  $(window).scroll(function(){
	    if ($(this).scrollTop() > 300) {
	      $('.scrollToTop').fadeIn();
	    } else {
	      $('.scrollToTop').fadeOut();
	    }
	  });
	   
	  //Click event to scroll to top

	  $('.scrollToTop').click(function(){
	    $('html, body').animate({scrollTop : 0},800);
	    return false;
	  });

	/* ----------------------------------------------------------- */
	/*  10. Bootstrap Accordion
	/* ----------------------------------------------------------- */  

	
	$('#accordion .panel-collapse').on('shown.bs.collapse', function () {
		$(this).prev().find(".fa").removeClass("fa-plus").addClass("fa-minus");
	});
	
	//The reverse of the above on hidden event:
	
	$('#accordion .panel-collapse').on('hidden.bs.collapse', function () {
		$(this).prev().find(".fa").removeClass("fa-minus").addClass("fa-plus");
	});	
	

	$('.feedback-button').click(function(event){
		$(this).closest('.appointment-form').find('input').removeClass('alert')
		$(this).closest('.appointment-form').find('textarea').removeClass('alert')
		var fio = $(this).closest('.appointment-form').find('#fio');
		var email = $(this).closest('.appointment-form').find('#email')
		var body = $(this).closest('.appointment-form').find('#body')
		var phone = $(this).closest('.appointment-form').find('#phone')
		if(fio.val() == ""){
			fio.addClass("alert");
		}
		if(email.val() == ""){
			email.addClass("alert");
		}
		if(body.val() == ""){
			body.addClass("alert");
		}
		if(fio.val() != "" && email.val() != "" && body.val() != ""){
			$.ajax({
			  url: "/sendmail", data: 'fio='+fio.val()+'&email='+email.val()+'&body='+body.val()+'&phone='+phone.val(), 
			  format: 'json',
			  dataType: 'json',
			  type: "POST",
			  error: function(data){
			    alert('Server error');
			  }
			});
			$(this).closest(".appointment-form").hide();
			$(this).closest(".modal-body").find(".appointment-msg").show();
			$(this).closest(".modal-body").find(".appointment-msg").html("<div class='feedback-succsess col-md-12 col-sm-12'>Сообщение успешно отправлено!</div>")
		}
	});
	$('.feedback-header a, .review-button a').click(function(event){
		$(".appointment-form").show();
		$(".appointment-form").find('input').removeClass('alert')
		$(".appointment-form").find('textarea').removeClass('alert')
		$(".appointment-msg").hide();
		document.getElementById("feedback").reset();
		document.getElementById("new_reviews").reset();
		$("#name_file").html('');
		$("#new_reviews .rating").val(0);
		$('.rating-input i').removeClass('glyphicon-star').addClass('glyphicon-star-empty')
	});
    $('#datetimepicker').datetimepicker({
    	format: 'DD/MM/YYYY'
    });
	$('.review-button-submit').click(function(event){
		$(this).closest('.appointment-form').find('input').removeClass('alert')
		$(this).closest('.appointment-form').find('textarea').removeClass('alert')
		var review_fio = $(this).closest('.appointment-form').find('#review_fio');
		var review_date = $(this).closest('.appointment-form').find('#datetimepicker');
		var review_body = $(this).closest('.appointment-form').find('#review_body');
		if(review_fio.val() == ""){
			review_fio.addClass("alert");
		}
		var valid_date = true;
		if(review_date.val() != ""){
			re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;

		    if(!review_date.val().match(re)) {
		      review_date.addClass("alert");
		      valid_date = false;
		    }
		}
		if(review_body.val() == ""){
			review_body.addClass("alert");
		}
		if(review_body.val() != "" && review_fio.val() != "" && valid_date != false){
			$(this).closest(".appointment-form").hide();
			$(this).closest(".modal-body").find(".appointment-msg").show();
			$(this).closest(".modal-body").find(".appointment-msg").html("<div class='feedback-succsess col-md-12 col-sm-12'>Отзыв успешно создан!<br/> Он появится на странице после ее перезагрузки!</div>")
		} else {
			return false;
		}
	});
	$('#add-photo').change(function(){
		$('#add-photo').each(function() {
			var name = this.value;
			reWin = /.*\\(.*)/;
			var fileTitle = name.replace(reWin, "$1");
			reUnix = /.*\/(.*)/;
			fileTitle = fileTitle.replace(reUnix, "$1");
			$('#name_file').html(fileTitle);
		});	
	});

});