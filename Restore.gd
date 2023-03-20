extends Control

onready var musicButton = $ButtonsContainer/Music
onready var sfxButton = $ButtonsContainer/SFX
onready var soundEffects = $soundEffects

var soundON1 = load("res://assets/ui_elements/buttonIcons/Sound button 1.png")
var soundON2 = load("res://assets/ui_elements/buttonIcons/Sound button 2.png")
var soundOFF1 = load("res://assets/ui_elements/buttonIcons/Mute button 1.png")
var soundOFF2 = load("res://assets/ui_elements/buttonIcons/Mute button 2.png")
var sfxON1 = load("res://assets/ui_elements/buttonIcons/SFX button 1.png")
var sfxON2 = load("res://assets/ui_elements/buttonIcons/SFX button 2.png")
var sfxOFF1 = load("res://assets/ui_elements/buttonIcons/Mute SFX button 1.png")
var sfxOFF2 = load("res://assets/ui_elements/buttonIcons/Mute SFX button 2.png")

func _change_sound_and_sfx_face():
	if Globals.soundON == true:
		musicButton.set_normal_texture(soundON1)
		musicButton.set_pressed_texture(soundON2)
		musicButton.set_hover_texture(soundON2)
	if Globals.soundON == false:
		musicButton.set_normal_texture(soundOFF1)
		musicButton.set_pressed_texture(soundOFF2)
		musicButton.set_hover_texture(soundOFF2)
	if Globals.SFXON == true:
		sfxButton.set_normal_texture(sfxON1)
		sfxButton.set_pressed_texture(sfxON2)
		sfxButton.set_hover_texture(sfxON2)
	if Globals.SFXON == false:
		sfxButton.set_normal_texture(sfxOFF1)
		sfxButton.set_pressed_texture(sfxOFF2)
		sfxButton.set_hover_texture(sfxOFF2)

func _process(delta):
	if $".".visible == true:
		_change_sound_and_sfx_face()

func _ready():
	$".".visible = false


func _on_ResumeButtonSettings_pressed():
	$".".visible = false
	soundEffects.play()
	if get_tree().paused == true:
		get_tree().paused = false 


func _on_Music_pressed():
	var press = true
	if Globals.soundON == true && press == true:
		Globals.soundON = false
		soundEffects.play()
		press = false
	if Globals.soundON == false && press == true:
		Globals.soundON = true
		soundEffects.play()
		press = false


func _on_SFX_pressed():
	var press = true
	if Globals.SFXON == true && press == true:
		Globals.SFXON = false
		soundEffects.play()
		press = false
	if Globals.SFXON == false && press == true:
		Globals.SFXON = true
		soundEffects.play()
		press = false

func _on_Credits_pressed():
	soundEffects.play()
	OS.shell_open("https://shinystarsgames.squarespace.com/credits-slime-summit")


func _on_Restore_pressed():
	soundEffects.play()
