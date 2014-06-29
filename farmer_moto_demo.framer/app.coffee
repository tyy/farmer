# This imports all the layers for "AndroidWearSceneTemplate" into androidwearscenetemplateLayers
androidwearscenetemplateLayers = Framer.Importer.load "imported/AndroidWearSceneTemplate"

# Framer.Defaults.Animation = 
#   time: 0.2
#   curve: 'spring'
#   curveOptions:
#     tension: 500
#     friction: 35
#     velocity: 10

# Set up views to access them later
receive_msg = androidwearscenetemplateLayers.receive_msg
voice = androidwearscenetemplateLayers.voice
send_msg1 = androidwearscenetemplateLayers.send_msg1
send_msg2 = androidwearscenetemplateLayers.send_msg2
back = androidwearscenetemplateLayers.back

# # Set up the initial states
# Framer.Defaults.frame = receive_msg.frame 

# Welcome to Framer

# This is all CoffeeScript. Learn here: http://framerjs.com/learn.html#coffeescript

# Drop an image on the preview screen to create an image layer, or use the generator to import assets from Sketch or Photoshop

# Set up the initial states
# So to hide the layer for a group named "Main Screen" you can do:

myLayer_step = new Layer
x: 63
y: 99
width: 208
height: 189

receive_msg.visible = true;
voice.visible = true;
send_msg1.visible = true;
send_msg2.visible = true;
back.visible = true;

# # Intro slide only draggable horizontally
# receive_msg.draggable.enabled = false
# receive_msg.draggable.speedY = 0

# A couple shortcut functions
Layer::fadeIn = ->
  this.animate
    properties: 
      opacity: 1
    	curve: 'ease-in-out'
    	time: 0.5

Layer::fadeOut = ->
  this.animate
    properties: 
      opacity: 0
    	curve: 'ease-in-out'
    	time: 0.5
			
# receive_msg.on Events.DragEnd, ->
	
# 	  if receive_msg.x < -80 
#     # Dragged enough, move to the next slide after a delay
#     	receive_msg.animate
#      	 properties:
#         x: -640
#      	 time: 0.2
#       	curve: 'ease-out'

#     	Utils.delay 0.6, ->
#       	changeScene(1)

#   	else
#     # Not dragged enough, move it back
#     	receive_msg.animate
#       	properties:
#         	x: 0
#       	time: 0.2
#       	curve: 'ease-out'

voice.on Events.Click, -> 
				receive_msg.fadeOut()
				voice.fadeOut()
				send_msg1.fadeIn()
				Utils.delay 2, ->
					send_msg1.fadeOut()
					send_msg2.fadeIn()
					Utils.delay 2, ->
						send_msg2.fadeOut()
						back.fadeIn()

		
back.on Events.Click, -> 
			back.fadeOut()
			receive_msg.fadeIn()
			voice.fadeIn()
