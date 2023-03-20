extends Control

export(Color, RGB) var backgroundColor
onready var scrollBar = $ScrollBar
onready var soundEffects = $soundEffects



#func _on_Use_Item_button_down():
#	if itemToken == null:
#		print("Error you need to buy this first")
#	else:
#		print("consuming item")
#		billing.consumePurchase(itemToken)
#	pass # Replace with function body.
func _ready():
	_change_look()

func _process(delta):
	SaveScript._save()
	SaveScript._backup_save()

func _change_look():
	$LoadScreen.visible = false
	VisualServer.set_default_clear_color(backgroundColor)
	scrollBar.get_h_scrollbar().modulate = Color(0, 0, 0, 0)

func _on_ResumeButtonSettings_pressed():
	soundEffects.play()#make sure to add this to the other nodes later!
	$LoadScreen.visible = true



#these don't control the buying, that is contained in the actual buybox script! 
#Instead this just controls the sound effect
func _on_BuyButton_pressed():
	soundEffects.play()


func _on_Button_pressed():
	soundEffects.play()
