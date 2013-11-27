(function() {
  var $, canvas, context, gameObjects, mouseX, mouseY, paused, playerX, playerY, rgb, rgba;

  $ = jQuery;

  rgb = function(r, g, b) {
    return "rgb(" + r + ", " + g + ", " + b + ")";
  };

  rgba = function(r, g, b, a) {
    return "rgb(" + r + ", " + g + ", " + b + ", " + a + ")";
  };

  canvas = document.getElementById("myCanvas");

  console.log(canvas);

  context = canvas.getContext("2d");

  console.log(context);

  mouseX = 0;

  mouseY = 0;

  playerX = 0;

  playerY = 0;

  gameObjects = [new EnemyFollower(10, 10), new EnemyFollower(20, 20), new EnemyRunsAwayAndShoots(100, 100)];

  paused = false;

  draw();

  console.log(rgb(0, 0, 0));

  $(function() {
    var newWidth;
    newWidth = Math.min(($("#myCanvas")).width(), ($("#myCanvas")).height());
    ($("#myCanvas")).width(newWidth);
    ($("#myCanvas")).height(newWidth);
    ($("#myCanvas")).css("width", newWidth);
    ($("#myCanvas")).css("height", newWidth);
    ($("#myCanvas")).click(function() {
      console.log("LOL");
      return console.log("");
    });
    ($("body")).mousemove(function(event) {
      mouseX = event.pageX;
      return mouseY = event.pageY;
    });
    return ($("#pauseButton")).click(function() {
      return paused = !paused;
    });
  });

}).call(this);
