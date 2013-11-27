#This is the code for the tailGame game

$ = jQuery

newWidth = console.log Math.min(($ "#myCanvas").width(), ($ "#myCanvas").height())
($ "#myCanvas").css {width: newWidth + "px"}
($ "#myCanvas").css {height: newWidth + "px"}

console.log "TESTf"

canvas = document.getElementById("myCanvas")
console.log canvas

context = canvas.getContext("2d")
console.log context

x = 0
y = 0

class EnemyFollower
  constructor: (x, y) ->
    @x = x
    @y = y

circle = (centerX, centerY, radius) ->
	context.beginPath();
	context.arc(centerX, centerY, radius, 0, 2 * Math.PI, true);
	context.stroke()

draw = () ->
	context.fillStyle = "rgb(127, 127, 127)"
	context.fillRect(0, 0, 1000, 1000)

	context.fillStyle = "rgb(0, 200, 0)"
	circle(x, y, 10)

	setTimeout(draw, 1)

draw()

($ "#myCanvas").click( ->
	console.log "LOL"
	console.log ""
	)

($ "#myCanvas").mousemove( (event) ->
	x = event.pageX / 2
	y = event.pageY / 2
	)
