$(function () {
  var count = $("#slide li").length;
  var current = 1;
  var next = 2;
  var interval = 3000;
  var duration = 500;
  var timer;
  $("#slide li:not(:first-child)").hide();
  timer = setInterval(slideTimer, interval);

  function slideTimer() {
    $("#slide li:nth-child(" + current + ")").fadeOut(duration);
    $("#slide li:nth-child(" + next + ")").fadeIn(duration);
    current = next;
    next = ++next;
    if (next > count) {
      next = 1;
    }
    $("#button li a").removeClass("target");
    $("#button li:nth-child(" + current + ") a").addClass("target");
  }

  $("#button li a").click(function () {
    next = $(this).html();
    clearInterval(timer);
    timer = setInterval(slideTimer, interval);
    slideTimer();
    return false;
  });
});
