func _on_Restore_button_down():
	soundEffects.play()
	var result = _appstore.restore_purchases()
	print("pressed, restore")

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
#					give_player(event.product_id)
#					Globals.coinCount += 100
#					SaveScript._save()
					pass
				'restore':
					give_player(event.product_id)
			# fields: product_id, transaction_id, receipt		
					#...
					pass

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
