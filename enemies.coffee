###
This class should hold all of the enemy classes and related classes
###

class Enemy
	constructor: () ->

	draw: ->

	run: ->
		triedSpeed = dist(@velX, @velY)

		if triedSpeed > @maxSpeed
			@velX *= @maxSpeed / triedSpeed
			@velY *= @maxSpeed / triedSpeed

		@x += @velX
		@y += @velY

class EnemyFollower extends Enemy
	constructor: (@x, @y) ->
		@maxSpeed = .2
		@SIZE = ($ "#myCanvas").width() * .005;

	draw: ->
		context.fillStyle = rgb(255, 0, 0)
		circle(@x, @y, @SIZE)

	run: ->
		@velX = playerX - @x
		@velY = playerY - @y
		super
 
class EnemyRunsAwayAndShoots extends Enemy
	constructor: (@x, @y) ->
		@maxSpeed = .1

		@deadline = 100
		@shootCounter = 0

		@velX = 0
		@velY = 0

	draw: ->
		context.fillStyle = rgb(255, 255, 0)
		circle(@x, @y, 20)

	run: ->
		@velX = @x - playerX
		@velY = @y - playerY

		@shootCounter++
		if @shootCounter == @deadline
			gameObjects.push(new Bullet(@x, @y, (playerX-@x)*.001, (playerY-@y)*.001))
			@shootCounter = 0

		if @x > ($ "#myCanvas").width() + (@SIZE / 2 or @x < -@SIZE / 2 or @y > ($ "#myCanvas").height() + (@SIZE / 2) or @y < -@SIZE / 2
		{
			thisEnemy = gameObjects.indexOf(this);
			gameObjects.splice(thisEnemy, 1);
		}
		super

 class Bullet extends Enemy
 	constructor: (@x, @y, @velX, @velY) ->

 	draw: ->
 		context.fillStyle = rgb(0, 0, 0)
 		circle(@x, @y, 3)

circle = (centerX, centerY, radius) ->
	context.beginPath();
	context.arc(centerX, centerY, radius, 0, 2 * Math.PI, true);
	context.fill()

draw = () ->
	context.fillStyle = rgb(127, 127, 127)
	context.fillRect(0, 0, 1000, 1000)

	#Draw the player
	context.fillStyle = rgb(0, 200, 0)
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
