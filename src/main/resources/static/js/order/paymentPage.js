$(document).ready(function () {
	  let popup = $("#paymentpage_section_2");

	  $(".order_paymentPage_btn_filter1").on("click", function () {
	    console.log("Button clicked!");
	        console.log("Event target: ", this);
	    if (popup.is(":hidden")) {
	      popup.css({
	        visibility: "visible",
	        display: "none"
	      }).slideDown(1000);
	      $(this).find("i").removeClass("fa-caret-down").addClass("fa-caret-up");
	    } else {
	      popup.slideUp(1000, function() {
	        $(this).css("visibility", "hidden");
	      });
	      $(this).find("i").removeClass("fa-caret-up").addClass("fa-caret-down");
	    }
	  });
	});
$(document).ready(function () {
  let popup = $("#paymentpage_section_4");

  $(".order_paymentPage_btn_filter2").on("click", function () {
    console.log("Button clicked!");
        console.log("Event target: ", this);
    if (popup.is(":hidden")) {
      popup.css({
        visibility: "visible",
        display: "none"
      }).slideDown(1000);
      $(this).find("i").removeClass("fa-caret-down").addClass("fa-caret-up");
    } else {
      popup.slideUp(1000, function() {
        $(this).css("visibility", "hidden");
      });
      $(this).find("i").removeClass("fa-caret-up").addClass("fa-caret-down");
    }
  });
});

$(document).ready(function () {
  let popup = $("#paymentpage_div_section_5");

  $(".order_paymentPage_btn_filter3").on("click", function () {
    console.log("Button clicked!");
        console.log("Event target: ", this);
    if (popup.is(":hidden")) {
      popup.css({
        visibility: "visible",
        display: "none"
      }).slideDown(1000);
      $(this).find("i").removeClass("fa-caret-down").addClass("fa-caret-up");
    } else {
      popup.slideUp(1000, function() {
        $(this).css("visibility", "hidden");
      });
      $(this).find("i").removeClass("fa-caret-up").addClass("fa-caret-down");
    }
  });
});
