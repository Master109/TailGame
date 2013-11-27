#This is the code for the tailGame game

//@codekit-prepend helperFunctions.coffee
//@codekit-prepend enemies.coffee

$ = jQuery

#little helper functions
rgb = (r, g, b) ->
	"rgb(" + r + ", " + g + ", " + b + ")" #note that return is implied here
rgba = (r, g, b, a) ->
	"rgb(" + r + ", " + g + ", " + b + ", " + a + ")" #note that return is implied here

canvas = document.getElementById("myCanvas")
console.log canvas

context = canvas.getContext("2d")
console.log context

mouseX = 0
mouseY = 0

playerX = 0
playerY = 0

#gameObjects will store all of the enemies
gameObjects = [new EnemyFollower(10, 10), new EnemyFollower(20, 20), new EnemyRunsAwayAndShoots(100, 100)]

#If paused is true, then everything will still be drawn, but it won't be run.
paused = false

#call draw for the first time.
draw()

console.log rgb(0, 0, 0)

$ ->
	newWidth = Math.min(($ "#myCanvas").width(), ($ "#myCanvas").height())
	($ "#myCanvas").width(newWidth)
	($ "#myCanvas").height(newWidth)

	($ "#myCanvas").css("width", newWidth)
	($ "#myCanvas").css("height", newWidth)

	($ "#myCanvas").click( ->
		console.log "LOL"
		console.log ""
		)

	($ "body").mousemove( (event) ->
		mouseX = event.pageX
		mouseY = event.pageY
		)

	($ "#pauseButton").click( ->
		paused = not paused
		)
