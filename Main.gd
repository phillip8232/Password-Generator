extends Control

var chars : Array = ["A","B","C","D","E","F","G","H",
					"I","J","K","L","M","N","O","P",
					"Q","R","S","T","U","V","W","Y",
					"X","Z","!","@","#","$","%","^",
					"&","*","1","2","3","4","5","6",
					"7","8","9","0"]

var length : int = 0
var genAmount : int = 0
var genCount : int = 0

var password = ""

func _ready() -> void:
	$GenerateButton.connect("pressed", self, "onGeneratePressed")
	$Length.connect("text_changed", self, "lengthChanged")
	$Amount.connect("text_changed", self, "amountChanged")


func onGeneratePressed() -> void:
	generate(length,genAmount)

func lengthChanged(new_text: String) -> void:
	if(int(new_text)):
		length = int(new_text)
	else: 
		print("length must be an integer")

func amountChanged(new_text: String) -> void:
	if(int(new_text)):
		genAmount = int(new_text)
	else: 
		print("Amount must be an integer")

func generate(length: int, amount: int) -> void:
	if genCount >= amount:
		genCount = 0
		return
	genCount += 1
	randomize()
	password = ""
	while password.length() < length:
		var select = randi() %  chars.size()
		if(randi() % 2 + 1 == 1):
			password += chars[select].to_lower()
		else:
			password += chars[select]
	$Passwords.add_text(password)
	$Passwords.newline()
	generate(length,genAmount)
