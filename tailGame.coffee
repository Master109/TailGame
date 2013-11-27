#This is the code for the tailGame game

$ = jQuery

canvas = document.getElementById("myCanvas")
console.log canvas

context = canvas.getContext("2d")
console.log context

mouseX = 0
mouseY = 0

playerX = 0
playerY = 0

class EnemyFollower
  constructor: (x, y) ->
    @x = x
    @y = y
    @moveSpeed = .1

  draw: ->
  	circle(@x, @y, 10)

  run: ->
  	if @x < playerX
  		@x += @moveSpeed
  	else
  		@x -= @moveSpeed

  	if @y < playerY
  		@y += @moveSpeed
  	else
  		@y -= @moveSpeed

circle = (centerX, centerY, radius) ->
	context.beginPath();
	context.arc(centerX, centerY, radius, 0, 2 * Math.PI, true);
	context.stroke()

draw = () ->
	context.fillStyle = "rgb(127, 127, 127)"
	context.fillRect(0, 0, 1000, 1000)

	#Draw the player
	context.fillStyle = "rgb(0, 200, 0)"
	context.fillRect(playerX, playerY, 10, 10)

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
gameObjects = [new EnemyFollower(10, 10), new EnemyFollower(20, 20)]

#If paused is true, then everything will still be drawn, but it wpn't be run.
paused = false

draw()

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