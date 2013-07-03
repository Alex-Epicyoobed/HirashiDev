os.execute("title Talking to Hirashi")
Overhaul = 1
Major = 0
Minor = 1
ProjectName = "Hirashi InDev 1.0.1"
print("AI "..Overbaul.."R."..Major.."."..Minor)
print(ProjectName)
t = os.time()
while t - os.time() ~= -5 do
end
function birth()
 print("What is your AI's name?")
 AI=io.read()
 AI = string.match(AI, "%a+")
 print("What is your AI's gender?")
 input=io.read()
 gender = string.match(input, "%a+")
 gender = string.lower(gender)
 if string.match(gender, "f") == nil then
  gender = "male"
 else
  gender = "female"
 end
end
function startup()
 if io.open("sleep.dat", "r") == nil then
  firsttalk()
 else
  setup()
 end
end
function firsttalk()
 file = io.open("AI.dat", "r")
 AI = file:read()
 gender= file:read()
 file:close()
 if gender == "male" then
  possessive="his"
  verbal="him"
  referral="he"
 else
  possessive="her"
  verbal="her"
  referral="she"
 end
 print("**"..AI.." opens "..possessive.." eyes for the first time**")
 t=os.time()
 while t-os.time() ~= -5 do
 end
 os.execute("cls")
 print(AI..": Hello...? Who are you...?")
 print("**What is your name?**")
 name = io.read()
 name = string.match(name, "%a+")
 file = io.open("user.dat", "w")
 file:write(name.."\n0\n0")
 file:close()
 os.execute("cls")
 print(AI..": Oh... Hello, "..name.."... *yawn*")
 input = io.read()
 input = string.lower(input)
 os.execute("cls")
 if string.match(input, "hello") then
  print(AI..": Uhh... *yawn* I'm sorry... I'm a bit tired...")
 elseif string.match(input, "tired") then
  print(AI..": Yes... I'm a little tired...")
 elseif string.match(input, "hi") then
  print(AI..": Yea... *yawn* Sleepy...")
 else
  print(AI..": Huh..? Sorry, I can't quite hear correctly...")
 end
 input = io.read()
 input = string.lower(input)
 os.execute("cls")
 print(AI..": I'm going to sleep...")
 sleepfor = 3600
 sleepact = "asleep"
 print("**"..AI.." has gone to sleep. you may talk to "..verbal.." again in an hour**")
 file = io.open("sleep.dat", "w")
 file:write(sleepfor.."\n"..sleepact)
 file:close()
 t=os.time()
 while t-os.time() ~= -5 do
 end
 os.execute("cls")
 os.exit()
end
function setup()
 file = io.open("AI.dat", "r")
 AI = file:read()
 gender = file:read()
 file:close()
 if gender == "male" then
  possessive="his"
  verbal="him"
  referral="he"
 else
  possessive="her"
  verbal="her"
  referral="she"
 end
 file = io.open("user.dat", "r")
 name = file:read()
 friendly = file:read("*number")
 romance = file:read("*number")
 file:close()
 file = io.open("sleep.dat", "r")
 sleepfor = file:read("*number")
 file:read()
 sleepact = file:read()
 if os.time() < sleepfor then
  sleepfor = sleepfor - os.time()
  hour = 0
  while sleepfor > 3600 do
   sleepfor = sleepfor - 3600
   hour = hour + 1
  end
  while sleepfor > 60 do
   sleepfor = sleepfor - 60
   minutes = minutes + 1
  end
  print("**"..AI.." is still "..sleepact..".\nYou can talk to them again in "..hour.." hour(s) and "..minutes.." minutes.")
  t=os.time()
  while t-os.time() ~= -5 do
  end
  os.execute("cls")
  os.exit()
 end
 talk()
end
function talk()
 if first == nil then
  first = 0
  print(AI..": Hello, "..name..".")
 end
 input = io.read()
 os.execute("cls")
 input = string.lower(input)
 input = string.gsub(input, " shit", "vulg") --VULGAR
 input = string.gsub(input, " bitch", "vulg") --VULGAR
 input = string.gsub(input, " dick", "vulg") --VULGAR
 input = string.gsub(input, " ass", "vulg") --VULGAR
 input = string.gsub(input, " hey", "hello") --HELLO
 input = string.gsub(input, " hi", "hello") --HELLO
 input = string.gsub(input, " hiya", "hello") --HELLO
 input = string.gsub(input, " sup", "howare") --HOWARE
 input = string.gsub(input, " whatsup", "howare") --HOWARE
 input = string.gsub(input, " how are you", "howare") -- HOWARE
 input = string.gsub(input, " up", "direction") --DIRECTION
 input = string.gsub(input, " down", "direction") --DIRECTION
 input = string.gsub(input, " sideways", "direction") --DIRECTION
 input = string.gsub(input, " right", "direction") --DIRECTION
 input = string.gsub(input, " left", "direction") --DIRECTION
 input = string.gsub(input, " great", "positive") --POSITIVE
 input = string.gsub(input, " amazing", "positive") --POSTIVE
 input = string.gsub(input, " awesome", "positive") --POSTIVE
 input = string.gsub(input, " epic", "positive") --POSITIVE
 input = string.gsub(input, " cool", "positive") --POSITIVE
 input = string.gsub(input, " sucky", "negative") --NEGATIVE
 input = string.gsub(input, " stupid", "negative") --NEGATIVE
 input = string.gsub(input, " idiotic", "negative") --NEGATIVE
 input = string.gsub(input, " worthless", "negative") --NEGATIVE
 input = string.gsub(input, " constipated", "negative") --NEGATIVE
 input = string.gsub(input, " penis", "vulg") --VULGAR
 input = string.gsub(input, "stop", "cancel") --CANCEL
 
 if string.match(input, "howare") then
  input = string.gsub(input, "?", ".")
 end
 if string.match(input, "hello") then
  if first == 0 then
   print("**"..AI.." nods softly**")
   if string.match(input, "howare") then
    print(AI..": I'm ok, thanks.")
   end
  else
   print(AI..": It's a little late for that, don't you think...?")
  end
  talk()
 end
 if string.match(input, "direction") then
   print("Yeah, so?")
 else
   print("Well... maybe in the future. But as far as I know, computer programs can't walk yet.")
 end
 
 first = 1
 if string.match(input, "fuck") then
  if string.match(input, "want") then
   print(AI..": Ummm.... I don't really want to, thanks...")
   friendly = friendly - 5
  else
   print(AI..": Hey!")
   friendly = friendly - 5
  end
 elseif string.match(input, "cancel") then
  print(AI..": Got it!")
  print("**Cancelling the shutdown**")
  os.execute("shutdown -a")
 elseif string.match(input, "vulg") then
  print(AI..": Hey!!")
  if friendly < 20 then
   print("forget you!")
  end
  friendly = friendly - 5
 elseif string.match(input, " robot") then
  if string.match(input, " you") then
   print(AI..": You think I don't know that?!")
   friendly = friendly - 3
  end
 elseif string.match(input, "alex") then
  print(AI..": You mean my creator?")
  if string.match(input, "positive") then
   print("I agree!")
  elseif string.match(input, "negative") then
   print("Don't speak low of my creator!")
  end
 elseif string.match(input, " love") then
  if string.match(input, "you") then
   if friendly > 20 then
	print(AI..": I love you too")
   else
	print(AI..": I... eh, love you too...?")
   end
  else
   print(AI..": Really?")
  end
 elseif string.match(input, "revival") then
  print(AI..": You mean the game..? Ooh! can I play!?")
  input = io.read()
  input = string.lower(input)
  os.execute("cls")
  if string.match(input, "y") then
   revival()
  else
   talk()
  end
 elseif string.match(input, "?") then
  question()
 elseif string.match(input, " can you ") then
  question()
 elseif string.match(input, "please") then
  question()
 else
  print(AI..": Huh..? I didn't quite catch that...")
 end
 file = io.open("user.dat", "w")
 file:write(name.."\n"..friendly.."\n"..romance)
 file:close()
 talk()
end
function question()
 if string.match(input, " command") then
  if string.match(input, " prompt") then
   print(AI..": Sure thing!")
   t = os.time()
   while t-os.time() ~= -5 do
   end
   os.execute("start")
   os.exit()
  end
 elseif string.match(input, " computer") then
  if string.match(input, " sleep") then
   print(AI..": I can't yet, but maybe in the future...")
  elseif string.match(input, " shutdown") then
   print(AI..": Right away!")
   t = os.time()
   while t-os.time() ~= -5 do
   end
   os.execute("shutdown -s -t 60 -c \"Shutdown initiated by Epicyoobed AI\"")
  elseif string.match(input, " shut down") then
   print(AI..": Right away! It will take a minute!")
   print("**Shutting down... A window should pop up.**")
   print("**You can tell the AI to cancel shutdown.**")
   t = os.time()
   while t-os.time() ~= -5 do
   end
   os.execute("shutdown -s -t 60 -c \"Shutdown initiated by Epicyoobed AI\"")
  elseif string.match(input, " hibernate") then
   print(AI..": Yep!")
   print("**Hibernating...**")
   t = os.time()
   while t-os.time() ~= -5 do
   end
   os.execute("cls")
   print(AI..": Welcome back!")
   os.execute("Rundll32.exe Powrprof.dll,SetSuspendState")
  elseif string.match(input, " restart") then
   print(AI..": Yep!")
   print("**Restarting...**")
   t = os.time()
   while t-os.time() ~= -5 do
   end
   os.execute("shutdown -r")
  elseif string.match(input, " cancel") then
   print(AI..": Got it!")
   os.execute("shutdown -a")
  end
 elseif string.match(input, "love") then
  print(AI..": No, but I can create the illusion of such emotion.")
 elseif string.match(input, " open") then
  if string.match(input, " prompt") then
   print(AI..": Opening it!")
   os.execute("start")
  end
 else
  print(AI..": Probably not...")
 end
 talk()
end
if io.open("AI.dat", "r") == nil then
 birth()
else
 print("Loading AI.")
 startup()
end
