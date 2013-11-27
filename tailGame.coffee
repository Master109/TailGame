#This is the code for the tailGame game

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

class EnemyFollower
  constructor: (@x, @y) ->
    @moveSpeed = .1

  draw: ->
  	context.fillStyle = "rgb(255, 0, 0)"
  	circle(@x, @y, 5)

  run: ->
  	if @x < playerX
  		@x += @moveSpeed
  	else
  		@x -= @moveSpeed

  	if @y < playerY
  		@y += @moveSpeed
  	else
  		@y -= @moveSpeed

class EnemyRunsAwayAndShoots
	constructor: (@x, @y) ->
		@moveSpeed = .1

		@deadline = 100
		@shootCounter = 0

	draw: ->
		context.fillStyle = "rgb(255, 255, 0)"
		circle(@x, @y, 20)

	run: ->
	  	if @x > playerX
	  		@x += @moveSpeed
	  	else
	  		@x -= @moveSpeed

	  	if @y > playerY
	  		@y += @moveSpeed
	  	else
  			@y -= @moveSpeed

  		@shootCounter++
  		if @shootCounter == @deadline
	  		gameObjects.push(new Bullet(@x, @y, 0, 0))
	  		@shootCounter = 0

 class Bullet
 	constructor: (@x, @y, @velX, @velY) ->

 	run: ->
 		@x += @velX
 		@y += @velY

 	draw: ->
 		context.fillStyle = rgb(0, 0, 0)
 		circle(@x, @y, 3)

circle = (centerX, centerY, radius) ->
	context.beginPath();
	context.arc(centerX, centerY, radius, 0, 2 * Math.PI, true);
	context.fill()

draw = () ->
	context.fillStyle = "rgb(127, 127, 127)"
	context.fillRect(0, 0, 1000, 1000)

	#Draw the player
	context.fillStyle = "rgb(0, 200, 0)"
	circle(playerX, playerY, 10)

	#Move all of the gameObjects
	for object in gameObjects
		object.draw()

	if not paused
		#move the player
		playerX += (mouseX - playerX) * .1
		playerY += (mouseY - playerY) * .1

		#move the other game objects
		for object in gameObjects
			object.run()

	setTimeout(draw, 1)

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

	($ "#myCanvas").click( ->
		console.log "LOL"
		console.log ""
		)

	($ "body").mousemove( (event) ->
		mouseX = event.pageX / 3
		mouseY = event.pageY / 3
		)

	($ "#pauseButton").click( ->
		paused = not paused
		)
