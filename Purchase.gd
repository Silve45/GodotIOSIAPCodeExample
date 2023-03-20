extends Control

export(Color, RGB) var backgroundColor
onready var scrollBar = $ScrollBar
onready var soundEffects = $soundEffects
var payment
var timer

var _appstore = null

func give_player(product_id):
	print(product_id)
	print("GIVE PLAYER IS WORKING!!!")
	if product_id == "pack1SKU": #woo this works!!!
		print("So it is working like this :)")
#		Globals.coinCount += 500
		Globals.adBarOn = false
		MobileAds.hide_banner()
		Globals.pack1 = true
		SaveScript._save()
		SaveScript._backup_save()
		#make sure to put remove ads bool here ( and on every purchase ) 
	else:
		print("bad :(")

func check_events():
	while _appstore.get_pending_event_count() > 0:
		var event = _appstore.pop_pending_event()#was "inappstore"
		if event.result=="ok": # other possible values are "progress", "error", "unhandled"
	
		# print(event.product_id)
			match event.type:
				'product_info':
			# fields: titles, descriptions, prices, ids, localized_prices, currency_codes, invalid_ids
			#...
					pass
				'purchase':
			# fields: product_id, transaction_id, receipt		
					#...
					give_player(event.product_id)
#					Globals.coinCount += 100
#					SaveScript._save()
				'restore':
			# fields: product_id, transaction_id, receipt		
					#...
					pass
	
func _on_Purchase_button_down():
	soundEffects.play()
	var result = _appstore.purchase({'product_id': "pack1SKU"})# I think this is the diabled coin one

func _on_Purchase2_button_down():
	soundEffects.play()
	var result = _appstore.purchase({'product_id': "pack1SKU"})

func _ready():
	VisualServer.set_default_clear_color(backgroundColor)
	scrollBar.get_h_scrollbar().modulate = Color(0, 0, 0, 0)
	if Engine.has_singleton("InAppStore"):
		_appstore = Engine.get_singleton('InAppStore')
		var result = _appstore.request_product_info( { "product_ids": ["pack1SKU", "product_2"] } )
		if result == OK:
			print("Successfully started product info request")
			_appstore.set_auto_finish_transaction(true)

			var timer = Timer.new()
			timer.wait_time = 1
			timer.connect("timeout", self, 'check_events')
			add_child(timer)
			timer.start()
		else:
			print("failed requesting product info")
	else:
		print("no app store plugin")


func _on_ResumeButtonSettings_pressed():
	soundEffects.play()#make sure to add this to the other nodes later!
	$LoadScreen.visible = true
