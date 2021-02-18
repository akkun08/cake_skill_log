$(function () {
  $(".hamburger").click(function () {
    $(this).toggleClass("active");

    if ($(this).hasClass("active")) {
      $(".sign-up").addClass("active");
    } else {
      $(".sign-up").removeClass("active");
    }
  });

  $(".sign-up").click(function () {
    $(".sign-up").toggleClass("active");
    $(".hamburger").toggleClass("active");
    if ($(this).hasClass("active")) {
      $(".sign-up").addClass("active");
    } else {
      $(".sign-up").removeClass("active");
    }
  });
});
