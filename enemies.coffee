###
This class should hold all of the enemy classes and related classes
###

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
	  		gameObjects.push(new Bullet(@x, @y, (playerX-@x)*.001, (playerY-@y)*.001))
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
