_PALETTECOLOR 1, _RGB32(255, 255, 255)
COLOR 0, 1
RANDOMIZE TIMER

nnn = 2: OPEN "SCRN:" FOR OUTPUT AS #2

travl = 1.5

GOTO 1
'fontpath$ = ENVIRON$("SYSTEMROOT") + "\fonts\LiberationMono-Bold.ttf" 'Find Windows Folder Path.
'fontpath$ = ENVIRON$("SYSTEMROOT") + "\fonts\DroidSansMono.ttf" 'Find Windows Folder Path.
'fontpath$ = ENVIRON$("SYSTEMROOT") + "\fonts\consolab.ttf" 'Find Windows Folder Path.
'fontpath$ = ENVIRON$("SYSTEMROOT") + "\fonts\ARLRDBD.ttf" 'Find Windows Folder Path.
fontpath$ = "cyberbit.ttf"
'fontpath$ = "consola.ttf"

'fontpath$ = "DroidSansMono.ttf"
'fontpath$ = "LiberationMono-Bold.ttf"

style$ = "MONOSPACE, BOLD"
font& = _LOADFONT(fontpath$, 8, style$)
_FONT font&
1

xx = 199
DIM anim$(xx), STRENGTH(xx), stmax(xx), DEXTERITY(xx), INTELLIGENCE(xx)
DIM hitsave(xx), hitpoints(xx), hitmax(xx), speed(xx), dodge(xx)
DIM will(xx), dr(xx), wdam(xx), dmod(xx), damtype$(xx), reach$(xx)
DIM asiz(xx), weight(xx), wemax(xx), feet(xx), damchart(xx), damax(xx), remark$(xx)
DIM st0(xx), hits0(xx), we0(xx), gravo(xx), ar(xx), g4(xx)
DIM skill$(xx), adv$(xx), INFO$(xx)
DIM ATTACK(xx), text$(100)
CLS: PRINT
PRINT " G D W  /  G U R P S  Bestiary"
PRINT
PRINT
PRINT " 1. Perry Rhodan Races"
PRINT
PRINT " 2. Dinosaurs"
PRINT
PRINT " 3. Earth Animals"
PRINT
PRINT " 4. Prehistoric Animals"
PRINT
PRINT " 5. Mythical Animals"
PRINT
PRINT " 6. Space 1889"
PRINT
'PRINT " 7. PC's and NPC's"
'PRINT
'PRINT " 8. Traveller (animal encounters)":
'PRINT
'PRINT " 9. Traveller character":
'PRINT

INPUT " "; tier: IF tier = 0 THEN tier = 2
IF tier = 9 THEN a$ = "T": GOSUB 9000: ii = 0: zwei = 1: GOTO 3955
RESTORE 4002
IF tier = 7 THEN RESTORE 4003
IF tier = 2 THEN RESTORE 4004
IF tier = 3 THEN RESTORE 4005
IF tier = 4 THEN RESTORE 4006
IF tier = 5 THEN RESTORE 4007
IF tier = 6 THEN RESTORE 4008
IF tier = 8 GOTO 2000
'DATA "Siganese       ","   ",6,"*SI",0,0,1,1,0,1,1,1.12,""
'DATA "Mausbiber      ","   ",2,"*IL",0,0,5,0,1,1,20,1,"Telekinet"
'DATA "Okefenokee     ","   ",2,"*OK",0,0,5,0,1,1,35,.98,"Teleporter"
'DATA "Blue           ","   ",2,"BL",0,0,15,0,2,2,60,1,""
'DATA "Ara            ","   ",2,"*AR",0,0,15,0,2,2,60,1.2,""
'DATA "Springer       ","   ",2,"SP",0,0,20,0,2,2,100,1,""
'DATA "Terraner       ","   ",2,"TE",0,0,10,0,2,2,80,1,""
'DATA "Ferrone        ","   ",2,"*TE",0,0,15,0,2,2,90,1.4,""
'DATA "Skoar          ","   ",2,"SK",0,0,20,0,2,3,170,1.2,""
'DATA "Dumfrie        ","   ",2,"DU",0,0,15,1,2,3,150,1.2,""
'DATA "Paddler        ","   ",2,"*PA",0,0,20,1,2,2,120,1.2,"Desintegrator"
'DATA "Pseudo Neanderl","   ",2,"*PB",0,0,25,0,3,6,150,1,"Pr„bio"
'DATA "Zentaur        ","   ",2,"*PB",0,0,35,0,3,10,400,1,"Pr„bio"
'DATA "Uberschwerer   ","   ",3,"US",0,0,20,0,2,3,350,1.9,""
'DATA "Epsaler        ","   ",4,"EP",0,0,20,0,2,3,450,2.1,""
'DATA "Maahk          ","   ",3,"MA",0,0,25,0,2,3,500,3,""
'DATA "Druuf          ","   ",2,"DR",0,0,45,0,3,3,1000,1.95,""
'DATA "Kelosker       ","   ",1,"*KE",0,0,35,0,4,4,1200,1,""
'DATA "Naat           ","   ",1,"NA",0,0,45,0,3,5,1300,2.8,""
'DATA "Ertruser       ","   ",3,"ER",0,0,40,0,3,6,16.3*50,3.4,""
'DATA "Oxtorner       ","   ",4,"OX",0,0,25,1,2,7,1200,4.8,""
'DATA "Zyklop         ","   ",1,"*PB",0,0,25,1,2,7,3000,1,""
'DATA "Haluter        ","   ",5,"HA",0,0,65,4,4,10,2000,3.6,""
'DATA "Zeitpolizist   ","   ",5.5,"HA",0,0,70,4,4,11,2100,4,""
'DATA "Pelewon        ","   ",5,"*HA",0,0,70,4,4,11,2100,1.1,""
'DATA "Uleb           ","   ",6,"HA",0,0,70,4,4,12,2390,4.1,""
'DATA "Tyrannosaurus  ","   ",1,"*PB",0,0,100,-1,8,3,8000,1,""
'DATA "B„r            ","   ",2,"ER",0,0,40,-3,3,3,400,1,""

4002
'DATA "AR-Siganese"           ,  0,  0,10,10,10, 0,  0,  5,0,0, 0,0,0,"cru","C"      , 1,   .7,    1,2,2,1.12  ,"","",""
'DATA "AR-Mausbiber"          ,  0,  0,10,10,10, 0,  0,  5,0,0, 0,0,0,"cru","C"      , 1,   15,   20,2,2,1      ,"","",""
'DATA "AR-Okefeenokee"        ,  0,  0,10,10,10, 0,  0,  5,0,0, 0,0,0,"cru","C"      , 1,   30,   35,2,2,.98    ,"","",""
DATA "AR-Blue",0,0,10,10,10,0,0,5,0,0,0,0,0,"cru","C",1,50,60,2,2,1,"","",""
DATA "AR-Ara",0,0,10,10,10,0,0,5,0,0,0,0,0,"cru","C",1,50,60,2,2,1.2,"","",""
DATA "AR-Springer",0,0,10,10,10,0,0,5,0,0,0,0,0,"cru","C",1,90,110,2,2,1,"","",""
DATA "AR-Terraner",0,0,10,10,10,0,0,5,0,0,0,0,0,"cru","C",1,70,90,2,2,1,"","",""
DATA "AR-Ferrone",0,0,10,10,11,0,0,5,0,0,0,0,0,"cru","C",1,90,110,2,2,1.4,"","",""
DATA "AR-Skoar",0,0,14,13,13,0,0,5,0,0,1,0,0,"cru","C",1,150,180,2,2,1.2,"","",""
DATA "AR-Dumfrie",0,0,13,10,13,0,0,5,0,1,5,0,0,"cru","C",1,130,160,2,2,1.2,"","",""
DATA "AR-Paddler",0,0,10,10,10,0,0,5,0,0,0,0,0,"cru","C",1,100,130,2,2,1.2,"","",""
DATA "AR-Ueberschwerer",0,0,10,10,13,0,0,5,0,0,1,0,0,"cru","C",1,320,360,2,2,1.9,"","",""
DATA "AR-Maahk",0,0,10,10,13,0,0,5,0,0,2,0,0,"cru","C",3,450,500,2,2,3,"","",""
DATA "AR-Naat",0,0,10,10,13,0,0,5,0,0,2,0,0,"cru","C",3,1200,1300,2,2,2.8,"","",""
DATA "AR-Epsaler",0,0,13,13,13,0,0,10,5,1,1,0,0,"cru","C,",2,400,450,2,2,2.5,"","",""
DATA "AR-Druuf",0,0,13,13,13,0,0,10,5,1,1,0,0,"cru","C,",2,900,1100,2,2,1.95,"","",""
DATA "AR-Ertruser",0,0,15,13,13,0,0,15,5,1,2,0,0,"cru","C,1,2",2,700,815,2,2,3.5,"","",""
DATA "AR-Oxtorner",0,0,17,13,15,0,0,15,9,2,10,0,0,"cru","C,1",2,1100,1200,2,2,4.8,"","",""
DATA "AR-Pelewon",0,0,15,10,15,0,0,25,3,1,2,0,0,"cru","C",6,2000,2100,2,2,1.1,"","",""
DATA "AR-Haluter",0,0,16,16,16,0,0,33,9,5,23,0,0,"cru","C,1,2",6,1800,2000,2,2,3.6,"","",""
DATA "AR-Zeitpolizist",0,0,17,17,17,0,0,35,9,0,23,0,0,"cru","C",6,2000,2100,2,2,4,"","",""
DATA "AR-ULEB (Bestie)",0,0,18,18,18,0,0,40,9,5,30,0,0,"cru","C,1,2",6,2100,2390,2,2,4.1,"","",""
DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""

REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$



4003 REM 'PC's und NPC's

DATA "Generic NPC",8,13,10,10,10,8,12,5,0,10,0,0,0,"cru"
DATA "C",1,70,90,2,2,1,"","",""

DATA "Bob Urban",10,10,13,13,11,11,06,6,9,0,0,0,0,"cru"
DATA "C,1",1,180,180,2,2,1
DATA "","",""

DATA "Konradin von Seelenfels, Wulfhere",12,12,15,15,11,11,11,0,0,0,0,1,0,"cru"
DATA "C",1,184,184,2,2,1
DATA "Broadsword-4, Bow-4, Shield-4, Brawling-2, 2-Handed-Sword-3"
DATA "Acute Taste & Smell, Alertness, Language Talent, Strong Will +2"
DATA "Code of Honor (Chivalric), Fear of Heights, Fear of Reptiles"

DATA "Blackthorne, Dai",8,15,12,12,12,12,00,0,4,0,0,0,0,"cru"
DATA "C,1",1,110,110,2,2,1
DATA "","",""

DATA "Goodfellow, John",10,10,12,13,09,09,09,0,4,0,0,0,0,"cru"
DATA "C,1",1,160,180,2,2,1
DATA "","",""

DATA "Gainsborough, James",12,12,16,13,11,11,11,0,7,0,0,1,0,"cru","C,1",1,190,190,2,2,1,"","",""

DATA "Jones, J. Malcolm",09,09,12,16,12,12,12,0,6,0,0,1,0,"cru","C,1",1,160,160,2,2,1,"","",""

DATA "Hohenfels, Max von",10,10,14,15,10,10,10,0,6,0,2,0,0,"cru","C,1",1,150,170,2,2,1,"","",""

DATA "Smith, Joan",08,08,12,13,10,10,10,0,5,0,0,1,0,"cru","C,1",1,190,190,2,2,1,"","",""

DATA "Kane",18,18,18,18,18,18,18,0,10,0,0,1,0,"cru","C",1,300,300,2,2,1,"","",""

DATA "Bergerac, Savien de Cyrano II de",13,13,16,14,14,14,14,0,8,0,0,1,0,"cru"
DATA "C",1,160,160,2,2,1
DATA "Parry-5, BPW-4, Fencing-8, Strategy-2, Tactics-4"
DATA "Combat Reflexes, Empathy, Literacy"
DATA "Code of Honor (Gentlemans), Ugly (Large nose)"

DATA "O'Malley, Tom",12,12,13,14,12,12,12,0,7,1,1,1,0,"cru","C",1,180,180,2,2,1,"","",""
DATA "Chang Soo",12,12,14,12,12,12,12,0,6,0,0,1,0,"cru","C",1,165,165,2,2,1,"","",""
DATA "Puncho Smallbrain",15,21,12,08,15,13,18,0,6,0,2,0,0,"cru","C,1",1,200,300,2,2,1,"","",""
DATA "Burton, Richard F.",12,12,14,15,14,14,14,0,8,0,0,1,0,"cru"
DATA "C",1,190,190,2,2,1
DATA "BPW-7, Fencing-9, Guns-5, Knife-4, Survival-5, Swimming-4"
DATA "Charisma+3, Combat Reflexes, Eidetic Memory-1, Strong Will+3"
DATA ""
DATA "O'Toole, Shelby",11,11,16,12,10,10,10,0,6,0,0,1,0,"cru","C",1,160,160,2,2,1,"","",""
DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""
                                                                                                                
4004 'Dinosaurier
'ALLOSAURUS
'ST: 75-100 Move/Dodge: 11/7 Size: 12+
'DX: 14 PD/DR: 2/2 Weight: 1-5 tons
'IQ: 3 Damage: 4d imp# Habitats: P, F
'HT: 14/40-50 Reach: C, 1 Origin: Pre
DATA "Allosaurus",75,100,14,03,14,40,50,11,7,2,2,4,00,"imp","C,1",12,2000,8000,2,1,1,"",""
DATA "Allosaurus is possibly the ultimate carnivore. It resembles Tyrannosaurus, but is smaller, faster, and has larger forelimbs. It measures 8 to 10 meters from head to tail and stands 5 or more meters tall. It is common to the Jurassic period, inhabiting flood plains, forested deltas, and lake shores. Recent discoveries suggest Allosaurus was a pack hunter, as if one of these monsters was not enough. It can bite in close combat or at 1-hex reach. Alternatively, it can claw  with a 2-hex reach - its arms are relatively weak. Its hind legs are powerfully muscled and it can use them to pin down smaller or weakened prey."

DATA "Ankylosaurus",40,50,14,03,14,40,45,7,7,2,2,4,00,"imp","C,1",12,4000,8000,4,1,1,"",""
DATA "Ankylosaurus (curved lizard) is the largest of the ankylosaurs, and was the last to become extinct. It grows up to 30'long and 8' wide, standing 6' high at the hips. Like most ankylosaurs, it is not built for dodging; Dodge is 0. Its back is completely covered in bony armor plates, and even its eyelids are heavily armored. If attacked, Ankylosaurus hunkers down and tries to keep its attackers behind it. The last third of its tail is reinforced, and ends in a heavily-armored shamrock-shaped club which can be swung into any back hex, or any hex adjacent to the back hex, for crushing damage - enough to knock down most theropods, and large theropods find it very difficult to get up again."


DATA "Brontosaurus",300,500,09,03,17,100,200,5,0,2,3,4,00,"cru","1-8",28,30000,50000,4,1,1,"",""
DATA "The Brontosaurus (thunder lizard), possibly the bestknown dinosaur, is 70' or more long as an adult. Though there is no longer a genus Brontosaurus (the specimen from which it was named having been proved to belong to the genus Apatosaurus), the name is still in common use. Apatosaurus is related to Diplodocus, but is more heavily built and has a thicker neck. It is able to rear itself up onto its massive hind legs, using its tail for support, and reach 50 feet up into the trees that it eats. It lives mostly in forests, not swamps, and probably avoids large bodies of water: an Apatosaurus stuck in a swamp would have been an easy catch for an Allosaurus or other theropod. Like elephants, most Apatosaurus travel in small family groups or small herds, though males without harems or offspring travel alone. Apatosaurus' primary defense is its sheer bulk, which enabled it to trample for 6d crushing damage. The last ten feet of its tail is reinforced with bony rods, and can be used to whip predators in rear hexes; the tail has a reach of 8 hexes and can swing 8 hexes per turn (movement is measured by the tip of the tail). The tail automatically hits anything more than 5' tall; anyone within the affected area must make a Dodge roll to avoid being hit for 4d crushing damage. Assess knockback as from a slam: fallen predators can then be trampled."


DATA "Ceratosaurus",50,65,14,03,13,32,40,6,7,2,2,3,-1,"imp","C,1",9,2000,4000,2,1,1,"",""
DATA "Ceratosaurus is a 20' long theropod with a thin ten-foot tail, four-fingered forelimbs, small horns above its eyes, and a prominent horn on its nose. It stands up to 15' tall. Its eyes are large, but set for peripheral vision rather than looking straight ahead; Ceratosaurus may need to spend more time on the alert for larger predators than it does hunting for prey. Make Vision and Smell rolls at Skill-4, Hearing at Skill-2. Ceratosaurus' skull is too thin for it to have engaged in much head-butting; its horns may be used by hatchlings trying to break out of their eggs, or as a sexual display. Ceratosaurus bites in close combat, or claws at 1-hex reach."


DATA "Deinonychus",15,18,16,04,13,12,14,13,8,1,1,1,+2,"imp"
DATA "C,1",3,100,200,2,1,1
DATA "Vision-5, Smell-4, Hearing-4, Stealth-4"
DATA ""
DATA "A large coelurosaur, Deinonychus reaches lengths of up to 10 feet. On each foot, it has a large forward-mounted claw used for disemboweling opponents. The forearms are also heavily clawed. Treat the feet as the main weapon, kicking at close or 1-hex range for impaling damage. It attacks large prey by leaping at up to 2-hex range. Deinonychus can also bite and claw in close combat for 1d cutting damage. Common in the Cretaceous, it inhabits dry flood plains and river banks."




'DATA "Ornithopod",8,50,14,03,15,7,35,16,7,1,1,1,00,"cru","C,1",20,2000,6000,4,1,1,"","",""
'Plesiosaurus
'ST: 10-15 Speed/Dodge: 7/7 Size: 2-3
'DX: 14 PD/DR: 1/ I Wt: 150-250 lbs.
'IQ: 3 Damage: 1d-1 imp
'HT: 14/10-15 Reach: C, 1 Habitat: SW
'Time: Early Jurassic (210-180 mya)
'Range: Europe Discovered: 1821
DATA "Plesiosaurus",10,15,14,03,14,10,15,7,7,1,1,1,-1,"imp","C,1",3,150,250,0,1,1,"",""
DATA "Plesiosaurus, one of the earliest plesiosaurs, is also one of the smallest: only 7' to 8' long including a very long neck. It bites at 1-hex range."
REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$



'DATA "Plesiosaurus",14,30,14,03,14,10,25,7,7,1,1,1,+1,"imp","C,1-7",30,250,4000,4,1,1,"","",""


'Pteranodon
'ST: 3-6 Speed/Dodge: 14/7# Size: 4-6
'DX: 14 PD/DR: 0/0 Wt: 30-50 lbs.
'IQ: 3 Damage: d-1 cr
'HT: 14/10-25 Reach: C Habitat: SW#
'Time: Early – Middle Cretaceous (213-194 mya)
'Range: America Discovered: 1871
DATA "Pteranodon",3,6,14,03,14,10,25,14,7,0,0,1,-1,"cru","C",2,30,50,2,1,1,"",""
DATA "Pteranodons (winged and toothless) have wingspans of up to 30'. They have huge, rudderlike crests on their skulls, which reach up to 6' long. They are very lightly built, and lack tails and teeth. Pteranodons may be encountered over a hundred miles out to sea, soaring like albatross and catching fish near the surface."

'Quetzalcoatlus
'ST: 7-9 Speed/Dodge: I2/7# Size: 15#
'DX: 14 PD/DR: 0/0 Wt: 50-190 lbs.
'IQ: 3 Damage: d cut
'HT: 11-13 Reach: C, 1 Habitats: P, F, S
'Time:   Late Cretaceous (75-65 mya)
'Range: N. America Discovered: 1971
DATA "Quetzalcoatl",7,9,14,04,11,11,13,12,7,0,0,1,00,"imp","C",4,50,190,4,1,1,"",""
DATA "Quetzalcoatlus northropi (named after an Aztec god and an aircraft company) is the largest flying creature ever discovered. It has a wingspan of 40' to 50', larger than some light aircraft, and soars and glides over great distances in search of food. Bmovies to the contrary, it is not strong enough to carry Raquel Welch, or any other adult human. Unlike most pterosaurs, Quetzalcoatlus lives hundreds of miles from the sea-coast. It is probably a scavenger, using its long, narrow, toothless beak and long, flexible neck for reaching into bodies (like the marabou stork of Africa). It may also eat small prey that it could kill with a single crunch."


'Stegosaurus
'ST: 50-75 Speed/Dodge: 4/4 Size: 12+
'DX: 9 PD/DR: 2/4 Wt: 2-5 tons
'IQ: 3 Damage: 4d imp#
'HT: 15/50-65 Reach: 1, 2 Habitats: P, F, S
'Time: Late Jurassic (156-145 mya)
'Range: N. America Discovered: 1877

DATA "Stegosaurus",75,100,08,03,15,50,65,4,4,2,3,3,00,"imp","1,2",12,4000,6000,4,1,1,"",""
DATA "Stegosaurus is a herbivorous dinosaur with large rear legs, small front legs, a small head, a double row of plates along its back, and four long (up to 3'3) horizontal spikes at the end of its powerfully muscled tail. It grows up to 30' long; average length is about 20'. Standing on its hind legs to eat, it is 12' to 15 ' tall. If attacked or threatened, Stegosaurus drops to all fours and lashes out with its tail. Its eyes are arranged for peripheral vision, and its flexible neck enables it to look back and strike Stegosaurus is armored as well as armed; the plates on its back protect its spine, and small armor plates scattered along the body raise its AR to 3. The plates on its back also add two feet to its height, help to control its body temperature, and may also be used to attract mates."


'Triceratops
'ST: 200+ Speed/Dodge: 10/6 Size: 15+
'DX: 12 PD/DR: 2/2# Wt: 6-7 tons
'IQ: 3 Damage: 5d imp#
'HT: 17/50-75 Reach: C Habitat: P
'Time: Late Cretaceous (68-65 mya)
'Range: N. America Discovered: 1889
DATA "Triceratops",200,250,12,03,17,50,75,10,6,2,2,5,00,"imp"
DATA "C",15,12000,14000,4,1,1
DATA "Loc. 3-6 AR4, Block (Shield)-2, Charge 7D imp, -3 to hit",""
DATA "Largest, last and best known of the ceratopsians, Triceratops horridus (rough three horn face) was the most common large herbivore in North America at the end of the Cretaceous era; more than 70% of the large dinosaur fossils from the end of the era are Triceratops remains. An adult Triceratops grows from 25' to 30' in length, with brow horns more than 3' long. Its head, neck and shoulders are protected by  a solid bony frill, up to 7' wide, with AR 4. In close combat, its head butt does impaling damage with either brow horn; it also Blocks as though its shield skill were 2.  A Triceratops can charge at up to 25 mph, doing 5d impaling damage, but is at -2 to hit a human-sized target with this type of attack. Its trample does 3d crushing damage with no penalty to hit. Larger specimens may qualify for the special trampling damage rules. Unlike most ceratopsians, Triceratops has blade-like teeth, which shear through palm fronds and cycads and do 5d cutting damage (at -3 to hit)."

DATA "Tyrannosaurus Rex",100,150,14,3,15,50,80,17,7,2,3,5,02,"imp"
DATA "C,1,2",19,8000,10000,2,1,1
DATA "Skull AR 3, Smell-4, Vision-4, Hearing-4",""
DATA "Tyrannosaurus is one of the largest meateating animals ever to have lived, and has some of the strongest jaws. It measures about 13 meters from head to tail, stands about 6 meters tall, and has a 1 meter head armed with 15 cm teeth. It also has ridiculously small forelimbs. Its legs are much longer than those of Allosaurus, while its claws are shorter. Its torso is also shorter, benefiting speed. Despite its great size, it is surprisingly graceful and fast. It has to be; it is going up against the most heavily defended of all dinosaurs - the Ankylosaurs and Ceratopsians. Tyrannosaurs attack with a terrible bite at up to a 2-hex reach. Unlike allosaurs, they do not kick; their legs and feet are adapted more for running and dodging, avoiding counterattacks from their prey's weapons."

'Giganotosaurus
'ST: 100-160 Speed/Dodge: 16/7# Size: 15+
'DX: 14 PD/DR: 2/3 Wt: 5-9 tons
'IQ: 3 Damage: 5d+3 imp
'HT: 15/50-90 Reach: C, 1, 2 Habitats: P, F
'Time: Late Cretaceous (100 mya)
'Range: S. America Discovered: 1993


DATA "Giganotosaurus",100,160,14,03,15,50,090,16,7,2,3,5,+3,"imp"
DATA "C,1,2",15,10000,18000,2,1,1
DATA "Skull has Armor 3, its clawed arms have a ST 9-10, Height 7 m",""
DATA "Tyrannosaurus rex has now been dethroned as the world's largest predatory dinosaur. The first, nearly-complete specimen of Giganotosaurus (giant southern lizard) unearthed in Argentina was slightly bigger, and much more heavily built, than any T. rex yet found. Giganotosaurus lived 30 million years before T. rex. It seems to have been more closely related to Allosaurus, and probably looked like an enormous (14m!) version of that creature. Treat it in other ways like a slightly bigger T. rex."


'VELOCIRAPTOR
'ST: 7-9 Move/Dodge: 15/7 Size: 1-2
'DX: 15 PD/DR: 0/1 Weight: 35-40 lbs.
'IQ: 3-4 Damage: 1d-1 imp Habitats: P, F
'HT: 12/5-6 Reach: C, 1 Origin: Pre

DATA "Velocitaptor",7,9,15,04,12,5,6,15,7,1,1,1,+1,"imp"
DATA "C,1",1,35,40,2,1,1
DATA "Vision-6, Smell-6, Hearing-6, Stealth-6"
DATA ""
DATA "Velociraptor (swift robber) is a 2 meter long predator. Like the slightly larger Deinonychus, to which it is related, it has a large, sickle-shaped claw on each hind foot, which is held up off the ground to keep it sharp. Velociraptor attacks by grappling with its sharp teeth and foreclaws, then slashing with its raptor claws. It can open its jaws wide enough to bite or swallow large prey; one fossilized Velociraptor was found locked in combat with a Protoceratops more than twice its weight."


DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""










4005 'GURPS Bestiary
REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$


'ALLIGATOR
'ST: 18-24 Move/Dodge: 7/6# Size: 4-6
'DX: 12 PD/DR: 3/4# Wt.: 700-1,500 lbs.
'IQ: 3 Damage: 1d+1 cut Habitats: FW, S
'HT: 12/20-26 Reach: C#

DATA "Alligator",18,24,12,03,12,20,26,7,6,3,4,1,1,"cut","C",5,700,1500,4,1,1,"",""
DATA "Alligators are large reptiles native to the southeastern United States and to the Yangtze River basin of China. They average 3-4m in length, sometimes reaching as long as 6 feet, and are quite sluggish, spending most of their time basking on riverbanks. Unlike crocodiles, alligators are shy of humans – they will flee on sight. If cornered, though, they are vicious fighters. Adults feed mainly on fish, but also catch small animals that come down to the water to drink. Large alligators may sometimes pull deer or cows into the water."

'BABOON
'ST: 9-11 Move/Dodge: 12/7 Size: 1
'DX: 14 PD/DR: 0/0 Weight: 50-90 lbs.
'IQ: 6 Damage: 1d-2 cut Habitats: P, J, F
'HT: 16/8-10 Reach: C
DATA "Baboon",09,11,14,06,16,08,10,12,07,1,1,1,-2,"cut"
DATA "C",1,0050,0090,2,1,1,"",""
DATA "Baboons have a well-organized social structure; they live in troops of 20-50 members. Each troop has a definite territory over which it ranges. Its members never wander far from the rest of the troop. When traveling, the females and young stay in the center of the troop, where they are protected from all sides. When at rest, the troop will post sentries to warn of approaching danger. If threatened, the troop will flee, with the males hanging back to protect the females and young from any pursuers."




'BADGER
'ST: 5-7 Move/Dodge: 6/6 Size: <1
'DX: 13 PD/DR: 1/1 Weight: 20-45 lbs.
'IQ: 4 Damage: 1d-3 cut Habitat: F
'HT: 16/8-10 Reach: C
DATA "Badger",05,07,13,04,16,08,10,06,06,1,1,1,-3,"cut"
DATA "C",1,0020,0045,4,1,1,"",""
DATA "The badger is a large member of the weasel family, measuring 40 to 70 cm long. It is stocky, with a short tail and short but powerful legs. It has distinctive markings - a white head with two broad black stripes running from the tip of the muzzle across the eyes and ears to the back of the head. It also has a short temper and a nasty bite."



'BARRACUDA, GREAT
'ST: 16-20 Move/Dodge: 12/7 Size: 3
'DX: 15 PD/DR: 1/1 Weight: 75-100 lbs.
'IQ: 3 Damage: 1d cut Habitat: SW
'HT: 12/16-20 Reach: C
DATA "Barracuda, Great",16,20,15,03,12,16,20,12,7,3,1,1,0,"cut","C",3,75,100,0,1,1,"",""
DATA "Great barracudas, among the most voracious of predatory fish, are responsible for many attacks blamed on sharks. They are 2,5-3m long, fast, and can attack in surprisingly shallow water as shallow as .5 meter. Their sharp fangs, jutting lower jaws, and long, torpedoshaped bodies make them extremely evil-looking. They are solitary hunters, found in tropical and subtropical waters, and are active day and night. The barracuda hunts by sight rather than smell. Murky water thus should be avoided, as the keen-sighted barracuda may overestimate someone’s size, think him more dangerous, and attack. The barracuda attacks swiftly, biting cleanly, striking once and not repeating its attack. Its bite does cutting damage, and can easily cripple a limb."


'BAT
'ST: 1-2 Move/Dodge: 12/6 Size: <1
'DX: 13 PD/DR: 0/0 Weight: <1 lb.
'IQ: 4 Damage: 1d-5 cut Habitats: Sub, F, J, S
'HT: 13/2 Reach: C
DATA "Bat",01,02,13,04,13,02,02,12,06,1,1,1,-5,"cut"
DATA "C",1,0001,0001,2,1,1,"","",""


'Black Bear
'ST: 14-17 Move/Dodge: 7/6 Size: 2#
'DX: 13 PD/DR: 1/2 Weight: 200-500 lbs.
'IQ: 5 Damage: 1d cr# Habitats: F, M
'HT: 14/14-18 Reach: C
DATA "Black Bear",14,17,13,5,14,14,18,7,6,1,2,1,00,"cru","C",2,200,500,4,1,1,"",""
DATA "The black bear is found in wooded areas throughout North America. It is slightly smaller than the brown bear, measuring up to five feet in length. It is friendly and harmless to people unless provoked, cornered, or injured. It is solitary except during the mating season (June)."

'Brown Bear
'ST: 15-19 Move/Dodge: 7/6 Size: 2#
'DX: 13 PD/DR: 1/2 Weight: 200-700 lbs.
'IQ: 5 Damage: 1d cr# Habitats: F, M, S
'HT: 14/16-20 Reach: C
DATA "Brown Bear",15,19,13,5,14,16,20,7,6,1,2,1,00,"cru","C",2,200,700,4,1,1,"",""
DATA "The brown, grizzly, and Kodiak bears are related and may represent a single species. Of the three, the brown is the smallest and the Kodiak the largest. Brown bears are found in the northwestern portion of North America and throughout Europe and Asia. The grizzly and Kodiak bears are limited to the northwestern United States and Canada."

'Grizzly Bear
'ST: 22-28 Move/Dodge: 8/6 Size: 2#
'DX: 13 PD/DR: 1/2 Wt.: 400-1,000 lbs.
'IQ: 5 Damage: 1d+2 cr# Habitats: F, M
'HT: 14/18-22 Reach: C, 1
DATA "Grizzly Bear",22,28,13,5,14,18,22,8,6,1,2,1,2,"cru","C,1",2,400,1000,4,1,1,"",""
DATA "The brown, grizzly, and Kodiak bears are related and may represent a single species. Of the three, the brown is the smallest and the Kodiak the largest. Brown bears are found in the northwestern portion of North America and throughout Europe and Asia. The grizzly and Kodiak bears are limited to the northwestern United States and Canada."

'Kodiak Bear
'ST: 27-33 Move/Dodge: 7/6 Size: 3#
'DX: 13 PD/DR: 1/2 Wt.: 800-1,500 lbs.
'IQ: 5 Damage: 2d-2 cr# Habitats: F, M
'HT: 15/20-24 Reach: C, 1
DATA "Kodiak Bear",27,33,13,5,15,20,24,7,6,1,2,2,-2,"cru","C,1",3,800,1500,4,1,1,"",""
DATA "The brown, grizzly, and Kodiak bears are related and may represent a single species. Of the three, the brown is the smallest and the Kodiak the largest. Brown bears are found in the northwestern portion of North America and throughout Europe and Asia. The grizzly and Kodiak bears are limited to the northwestern United States and Canada."


DATA "Polar Bear",27,33,13,5,15,18,24,7,6,1,2,2,-2,"cut","C,1",3,600,1400,4,1,1,"",""
DATA "Polar bears are among the largest and most carnivorous bears. They average 2 or 2.5m in length, with some males reaching up to 3m, and stand about 1.5m at the shoulder. Their coats are white with a yellowish tinge, made up of long guard hairs and a dense underfur. They are essentially nomadic, wandering miles in search of food."


'Sun Bear
'ST: 12-15 Move/Dodge: 7/6 Size: 2#
'DX: 13 PD/DR: 1/2 Weight: 150-200 lbs.
'IQ: 5 Damage: 1d-1 cr# Habitats: F, J
'HT: 11-14 Reach: C, 1
DATA "Sun Bear",12,15,13,5,11,11,14,7,6,1,2,1,-1,"cru","C,1",2,150,200,4,1,1,"",""
DATA "The sun bear is the smallest of the bears, measuring about 1.2m in length and standing 60cm high at the shoulder. It gets its name from the distinctive yellow crescent on its chest. It is also known as the honey bear, due to its fondness for honey. It lives in the tropical and sub-tropical forests of southern Asia, spending most of its time in the trees."

'BISON
'ST: 48-70 Move/Dodge: 13/6 Size: 3-4
'DX: 10 PD/DR: 1/2 Wt.: 1/2 to 1-1/2 tons
'IQ: 4 Damage: 1d imp# Habitat: P
'HT: 15/20-25 Reach: C
DATA "Bison",048,70,10,04,15,20,25,13,06,1,2,1,00,"imp","C",4,1000,3000,4,1,1,"",""
DATA "Bison, also known as buffalo, are large ox-like relatives of cattle, standing five to six feet at the shoulder and weighing up to 1,5 tons. Their shaggy fur, short horns, and hunched backs give them a distinctive appearance. Bison live in herds, ranging in size from a single family to thousands of individuals, and are most active in the morning and evening. Herbivores that feed mainly on grass, they migrate over thousands of miles each season."



DATA "Burro",25,25,10,04,13,13,13,8,6,0,0,1,-1,"cru","C",2,100,300,4,1,1,"","",""

'CARIBOU
'ST: 20-25 Move/Dodge: 12/7 Size: 3
'DX: 15 PD/DR: 1/2 Wt.: 500-700 lbs.
'IQ: 4 Damage: 1d+1 imp# Habitats: A, P
'HT: 14/13-16 Reach: C
DATA "Caribou",20,25,15,4,14,13,16,12,7,1,2,1,1,"imp","C",3,500,700,4,1,1,"",""
DATA "Caribou and reindeer belong to the same species. However, reindeer are easier to tame, perhaps because they have been around people longer. Caribou are found in North America and Siberia, while reindeer are found in Scandinavia and Greenland. Other than these differences, treat the two as being identical. Caribou are the only members of the deer family in which both sexes have antlers. The largest caribou are about 2.5m long, standing 1.3m at the shoulder. They live in large migratory herds of up to 3,000, and are active during the daylight hours, though they can be active at night during the long Arctic winters. They are shy of humans, but are quite inquisitive. They can be dangerous during the mating season (fall), when the males will attempt to drive off any intruders."



DATA "Cattle",60,60,9,04,16,16,16,8,4,4,1,1,1,"imp","C",3,800,900,4,1,1,"","",""

'CHEETAH
'ST: 16-20 Move/Dodge: 30/10 Size: 2
'DX: 14 PD/DR: 0/0 Wt.: 110-160 lbs.
'IQ: 4 Damage: 1d cut Habitats: P, D
'HT: 13-16 Reach: C
DATA "Cheetah",16,20,14,04,13,16,30,10,2,0,0,1,0,"cut","C",2,110,160,4,1,1,"",""
DATA "Cheetahs are the fastest land animals; they average speeds of 80-100 km per hour, but have been clocked at speeds up to an incredible 120 km/h. For all practical purposes, they can accelerate instantly from a dead stop to full speed. They are diurnal cats, native to Africa. They have many dog-like features: long legs made for running, not springing; claws that do not fully retract; trainability; a lack of stalking ability. They hunt by outrunning their prey, knocking it down with a forepaw, then strangling it with their bite."


DATA "Constrictor",12,24,13,3,15,16,30,3,6,0,0,1,-4,"cru","C",8,50,250,4,1,1,"","",""
DATA "Crocodile",20,28,14,03,13,24,30,8,7,3,4,1,2,"cut","C",6,900,2000,4,1,1,"","",""

'DINGO
'ST: 7-9 Move/Dodge: 10/6 Size: 1
'DX: 13 PD/DR: 1/1 Weight: 45-110 lbs.
'IQ: 5 Damage: 1d-3 cut Habitat: P
'HT: 10-12 Reach: C
DATA "Dingo",07,09,13,05,10,10,12,10,6,1,1,1,-2,"cut","C",1,45,110,4,1,1,"","",""
DATA "Dog",0004,12,12,05,13,04,12,08,6,0,0,1,-2,"cut","C",1,5,150,4,1,1,"","",""


REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$
DATA "Elephant",250,300,12,06,17,40,50,8,0,1,2,3,00,"cru","C,1,2",10,2500,4000,4,1,1,"","",""
DATA "Gorilla",20,24,13,06,14,16,20,7,6,1,1,1,00,"cut","C,1",1,200,600,2,1,1,"","",""

'Hippopotamus 100-125 8 4 16/32-40 4/4 2/3 5d cr C 10 17
DATA "Hippopotamus",100,125,8,04,16,32,40,4,4,2,3,5,00,"cru","C",10,6000,10000,4,1,1,"","",""

DATA "Human",8,15,10,10,8,8,15,5,5,0,0,1,0,"cru","C",1,120,260,2,2,1,"","",""

'HYENA
'Brown Hyena
'ST: 8-12 Move/Dodge: 14/7 Size: 1
'DX: 14 PD/DR: 1/1 Weight: 70-90 lbs.
'IQ: 5 Damage: 1d-1 cut Habitats: P, D
'HT: 12/9-13 Reach: C
DATA "Brown Hyena",8,12,14,5,14,7,12,9,13,0,0,1,-1,"cut","C",1,70,90,4,2,1,"","",""

'Spotted Hyena
'ST: 14-18 Move/Dodge: 18/8 Size: 2
'DX: 12 PD/DR: 1/1 Weight: 125-200 lbs.
'IQ: 4 Damage: 1d+1 cut Habitats: P, D, J, F
'HT: 12/14-18 Reach: C
DATA "Spotted Hyena",14,18,12,4,12,14,18,18,8,1,1,1,-1,"cut","C",1,125,500,4,2,1,"","",""

'Striped Hyena
'ST: 10-14 Move/Dodge: 14/7 Size: 1-2
'DX: 13 PD/DR: 1/1 Weight: 50-125 lbs.
'IQ: 4 Damage: 1d cut Habitats: P, D, J, F
'HT: 12/11-15 Reach: C
DATA "Striped Hyena",10,14,13,4,12,11,15,14,7,1,1,1,0,"cut","C",1,50,125,4,2,1,"","",""

REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$



DATA "Leopard",20,25,14,05,15,14,17,9,7,1,1,1,1,"cut","C",2,180,240,4,1,1,"","",""

DATA "Lion",24,30,13,4,15,16,20,10,6,1,1,2,-2,"cut","C",2,400,600,4,1,1,"",""
DATA "Lions live in groups called prides that number from 3-20, with four or five being average. Larger prides are common in the more open grasslands. Lions prefer the plains, but will occasionally venture into desert, mountains, and (more rarely) jungle. They often hunt singly, though they are capable of cooperative effort - a lioness or two will lie in the tall grass, while the males herd the prey in their direction. The whole pride will share in the kill. Lions are more diurnal than most cats, but adapt well to a nocturnal existence if hunted by humans. Most encounters with humans end with the lions fleeing rapidly. However, if wounded, a lion will charge angrily and attempt to kill anyone in its way. Likewise, running away from one will sometimes spark its instinct to chase. Occasional man-eaters have been reported - generally, old or wounded lions. Lions attack in close combat, biting and clawing. The actual attack is usually on the neck, strangulation being the most common method of killing."





DATA "Piranha",1,2,13,3,13,3,3,7,6,0,0,1,-5,"cut","C",1,1,10,4,1,1,"","",""

DATA "Puma",8,22,14,05,15,13,19,10,7,1,1,1,,"cut","C",2,80,250,4,1,1,"","",""
DATA "Rhinoceros",125,150,9,4,17,40,50,14,7,2,3,2,01,"cru","C",10,2000,4000,4,1,1,"","",""
DATA "Tiger",35,40,14,4,15,20,25,10,7,1,1,2,00,"cut","C",2,500,700,4,1,1,"","",""
DATA "Shark, great white",40,50,12,03,12,35,45,09,6,1,1,2,01,"imp","C",10,1000,14000,2,1,1,"","",""
DATA "Shark, medium",24,30,13,03,12,20,25,9,6,1,1,2,-2,"cut","C",5,400,1600,4,1,1,"","",""
DATA "G4-Shark, great white",38,45,12,02,12,38,45,07,9,10,0,2,01,"imp"
DATA "C",7,7000,10000,0,1,1,"","Brawling-15, Survival (Open Ocean)-14",""
DATA "Wolf",8,10,14,05,12,11,13,9,7,1,1,1,-2,"cut","C",1,70,170,4,1,1,"","",""
DATA "Wolverine",10,12,12,05,10,10,12,08,6,1,2,1,-2,"cut","C",4,50,100,4,1,1,"","",""

DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""

'DATA "Poisonous Snake",2,15,13,3,15,2,20,3,6,0,0,1,1,"cut","C",2,1,25,4,1,1,"","",""

REM st,stmax,dx,in,hitsave,hitpoints,hitmax,speed,dodge,will,dr,wdam,dmod,damtype$
REM reach$,asiz,weight,wemax,feet,remark$,gravo,Skill$,adv$,INFO$











4006 'Pr„historisch


'ANDREWSARCHUS
'ST: 45-55 Move/Dodge: 7/5 Size: 6+
'DX: 11 PD/DR: 2/2 Wt: 1-1/2 to 2-1/2 tons
'IQ: 3 Damage: 2d+2 imp Habitats: J, F, P
'HT: 13/48-60 Reach: C, 1 Origin: Pre
DATA "Andrewsarchus, Giant Bear Dog",45,55,11,3,13,48,60,7,5,2,2,2,2,"imp","C,1",4,2000,3500,4,1,1,"",""
DATA "Although this animal of 30 million years ago is called a giant bear-dog, it is related to neither bears nor dogs; it seems to have been an ancestor of modern whales. It stands about 8 feet at the shoulder and is 19 feet long – its head alone was more than 1 yard long. Judging from its teeth, it was carnivorous. From its size, it could not have been very fast; however, the Eocene had many slow-moving herbivores for it to prey upon. Little is known of its habits. Assume that it will attack fearlessly, with intent to devour; it bites at up to 1-hex reach."


'CAVE BEAR
'ST: 27-33 Move/Dodge: 7/6 Size: 3#
'DX: 12 PD/DR: 1/2 Wt: 1,200-1,600 lbs.
'IQ: 5 Damage: 2d-2 cr# Habitats: M, P
'HT: 14/24-30 Reach: C, 1 Origin: Ice
DATA "Cave Bear",27,33,12,05,14,24,30,7,6,1,2,2,-2,"imp","C,1",3,1200,1600,2,1,1,"","","Cave bears of the Pleistocene are slightly larger than modern polar bears and Kodiaks. They are almost completely vegetarian, and go into caves only during their winter hibernation. It seems early humans hunted them frequently - many cave bear remains show signs of butchery with stone tools. Make a reaction roll to determine whether the bear is hungry or aggressive, or just gets out of the way. It can claw and bite in close combat. Cave bears can also bear-hug, grappling in close combat and then biting."

'CAVE LION
'ST: 34-42 Move/Dodge: 9/6 Size: 2-4
'DX: 12 PD/DR: 2/2 Wt.: 500-700 lbs.
'IQ: 4 Damage: 2d cut Habitats: M, P
'HT: 15/24-30 Reach: C Origin: Ice
DATA "Cave Lion",34,42,12,04,15,24,30,10,7,2,2,2,00,"cut","C",2,500,700,4,1,1,"",""
DATA "These large cats live during the Pleistocene and are frequently hunted by humans. Little is known about their habits. Assume that they behave similarly to modern lions, including occasionally becoming man-killers."

'DIRE WOLF
'ST: 13-16 Move/Dodge: 7/6 Size: 1
'DX: 12 PD/DR: 1/1 Weight: 150-250 lbs.
'IQ: 4 Damage: 1d cut Habitats: P, M, A, F
'HT: 13-17 Reach: C Origin: Ice
DATA "Dire Wolf",13,16,12,04,13,13,17,7,6,1,1,1,00,"cut","C",1,150,250,4,1,1,"",""
DATA "The dire wolf is the sturdy but slow precursor of the modern wolf. Dire wolves are active both day and night, traveling in packs ranging from 4 to 40 animals. Scavengers by nature, dire wolves prey upon animals in distress - the injured, the old, the abandoned young. They often attack animals trapped in mires, rock slides, and tar pits, which can work to their disadvantage: The La Brea tar pits contain more skeletons of dire wolves than of any other mammal. Dire wolves have no fear of humans. The wolves will attack using pack tactics; they will not be driven off until they have suffered at least 50% casualties."


DATA "Giant Bear Dog",45,55,11,3,13,48,60,7,5,2,2,2,2,"imp","C,1",4,2000,3500,4,1,1,"","",""
DATA "Giant Rat",6,12,13,04,17,8,10,7,6,1,1,1,-2,"cut","C",1,100,200,4,1,1,"","",""

'IRISH ELK (MEGALOCEROS)
'ST: 24-30 Move/Dodge: 10/6 Size: 3
'DX: 12 PD/DR: 1/1 Wt.: 700-1,000 lbs.
'IQ: 4 Damage: 1d+2 imp# Habitats: P, S
'HT: 14/13-16 Reach: C Origin: Ice

DATA "IRISH ELK (MEGALOCEROS)",24,30,12,04,14,13,16,10,6,1,1,1,2,"imp","C",2,700,2000,4,1,1,"",""
DATA "This giant member of the deer family died out just a few thousand years ago; humans were probably a leading cause of its extinction. It stood 6 feet at the shoulder and had enormous antlers, with spreads up to 12 feet being common. Like all deer, Irish elk are undoubtedly shy of humans but may be dangerous in the fall, their mating season."


'Mammoth
'ST: 300-350 Speed/Dodge: 8/0# Size: 13+
'DX: 12 PD/DR: 1/2 Wt: 7-10 tons
'IQ: 4-5 Damage: 3d cr#
'HT: 17/40-50 Reach: C, 1, 2 Habitats: P, F, A
'Time: Early Pleistocene – Recent (2 mya-10,000 ya)
'Range: Asia, Europe, N. America
'Discovered: 1803
DATA "Mammoth",225,275,12,04,17,40,50,8,0,2,2,3,00,"cru","C,1,2",10,2000,3500,4,1,1,"",""
DATA "Mammoths resemble modern Indian elephants with huge curved tusks, up to 5m long, and range in size from 3 to 5m tall. The statistics above are for the largest species, which lived in central Europe; for smaller species, use mastodon statistics, below. Mammoths are covered with long black hair, which fades to rust-colored after a few thousand years of freezing. They had a thick fatty layer under their skins, and small humps of fat, like those of a camel, behind their domed heads. They were extensively hunted by Cro-Magnon and Neandertals; their fur and bones were used for making huts, and their ivory for jewelry and works of art. There is no evidence that they were ever domesticated."

DATA "G4-Megalodon",50,70,10,02,12,55,65,9,5,10,1,4,00,"cut"
DATA "C",30,22000,55000,0,1,1,"Survival (Open Ocean)-4, Smell/Taste-6, Vision, Hearing -1",""
DATA "Carcharocles megalodon, commonly called by its species name (meaning huge tooth) is a shark growing to 14m long; it preys on baleen whales, and apparently became extinct during the Ice Age. Megalodon will eat anything that isn't big enough to eat it, including other sharks. The taste of blood in the water causes it to Berserk, all-out attacking every turn until there is nothing left to eat . . . and sharks can scent blood from 1,000 yards away. "

'SABERTOOTH (SMILODON)
'ST: 26-32 Move/Dodge: 8/6 Size: 2
'DX: 12 PD/DR: 1/1 Wt: 400-600 lbs.
'IQ: 4 Damage: 2d+1 imp Habitats: P, F, D
'HT: 14/20-24 Reach: C Origin: Ice
DATA "Smilodon (Sabertooth)",26,32,12,04,14,20,24,8,6,1,1,2,01,"imp","C",2,400,600,4,1,1,"",""
DATA "The sabertoothed tiger, known scientifically as Smilodon, did not really resemble a tiger in anything but size. Its skeleton more closely resembles that of a lion, but the stabbing cats diverged from the biting cats so long ago that sabertooths are not closely related to any modern animal. Sabertooths knew early humans, who hunted them. They probably returned the favor - some human skulls have been found with sabertooth-sized holes in them! It is believed that the sabertooth hunted the great mammals; its teeth were adapted for slicing through the thick skin to the jugular. They are more solitary than lions, and will bite repeatedly rather than biting and holding. Their teeth (which sometimes measured 11 inches long) are serrated, so they do extra damage in close combat. Like picks, they can get stuck."

'WOLVERINE, PLEISTOCENE
'ST: 13-16 Move/Dodge: 8/6 Size: 1
'DX: 12 PD/DR: 2/2 Weight: 50-100 lbs.
'IQ: 5 Damage: 1d-1 cut Habitats: F, A, M
'HT: 12-14 Reach: C Origin: Ice
DATA "Wolverine, Ice Age",13,16,12,05,12,12,14,08,06,2,2,1,-1,"cut","C",1,50,100,4,1,1,"","",""
DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"",""
DATA "The Ice Age wolverine was larger than its modern descendant, with the same bad temper and no fear of humans. It measures 5 feet long and stands 2 feet high at the shoulder."


4007 'Mythisch
DATA "Gryphon",30,35,14,05,15,20,25,15,7,1,1,2,-1,"cut","C",2,500,600,4,1,1,"","",""
DATA "Ravener",30,36,15,06,16,24,30,10,7,2,2,2,0,"cut","C,1",2,1500,3000,2,1,1,"","",""
DATA "Dragon, Hatchling",10,15,9,11,10,10,10,15,8,4,1,1,-1,"imp","R,C",2,150,200,4,1,1,"","",""
DATA "Dragon, Young",15,25,11,11,15,16,25,10,5,1,2,1,1,"imp","R,C",4,200,400,4,1,1,"","",""
DATA "Dragon, Adolescent",25,40,12,12,15,25,40,12,6,2,3,2,-1,"imp","R,C,1",4,400,800,4,1,1,"","",""
DATA "Dragon, Young Adult",40,50,13,13,15,40,55,14,7,3,4,2,1,"imp","R,C,1",7,800,1500,4,1,1,"","",""
DATA "Dragon, Adult",50,60,14,14,15,55,70,18,9,3,5,3,-2,"imp","R,C,1,2",12,1500,3000,4,1,1,"","",""
DATA "Dragon, Old Adult",55,70,14,15,15,70,90,22,10,4,6,3,00,"imp","R,C,1,2",12,1500,3000,4,1,1,"","",""
DATA "Dragon, Monstrous",70,100,14,16,15,90,115,26,10,4,7,3,1,"imp","R,C,1,2",14,3000,5000,4,1,1,"","",""
DATA "Tarasque",75,75,14,5,15,100,100,7,7,4,4,3,1,"imp","C,1,2",16,2000,2000,4,1,1,"","",""
DATA "Unicorn",35,40,15,5,15,16,17,18,9,1,1,2,1,"imp","C",3,800,1200,4,1,1,"","",""
                                                                                                                   
DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""
4008 'Space 1889
DATA "Steppe Tiger",30,35,14,4,15,20,25,20,8,1,1,2,00,"cut","C",2,1200,1400,4,1,1,"","",""
DATA "Green Koko",20,24,13,3,15,8,10,8,6,0,0,1,-4,"cru","C",8,180,220,4,1,1,"","",""
DATA "Roogie",8,10,14,05,12,11,13,16,7,1,1,1,-2,"cut","C",1,90,110,4,1,1,"","",""
DATA "Ruumet Breehr",250,300,12,06,17,40,50,8,0,1,2,3,00,"cru","C,1,2",10,8000,10000,4,1,1,"","",""

DATA "XXX",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""
4009 '
DATA "cru",0,0,0,0,0,0,0,0,0,0,0,0,0,"   ","     ",0,0,0,0,2,1,"","",""


travl = 1.5
FOR ii = 1 TO xx
    READ anim$(ii):


    PRINT anim$(ii),
    endx$ = LEFT$(anim$(ii), 3)
    sL = LEN(anim$(ii))
    IF LEFT$(anim$(ii), 2) = "AR" THEN ar(ii) = 1: anim$(ii) = RIGHT$(anim$(ii), sL - 3)
    'IF tier = 2 THEN ar(ii) = 1
    IF LEFT$(anim$(ii), 2) = "G4" THEN g4(ii) = 1: anim$(ii) = RIGHT$(anim$(ii), sL - 3)
    READ STRENGTH(ii): STRENGTH(ii) = INT(STRENGTH(ii) / travl)
    READ stmax(ii): stmax(ii) = stmax(ii) / travl
    READ DEXTERITY(ii): ATTACK(ii) = DEXTERITY(ii)
    DEXTERITY(ii) = INT(DEXTERITY(ii) / travl)
    READ INTELLIGENCE(ii): INTELLIGENCE(ii) = CINT(INTELLIGENCE(ii) / travl)
    READ hitsave(ii): hitsave(ii) = hitsave(ii) / travl
    READ hitpoints(ii): hitpoints(ii) = INT(hitpoints(ii) / travl)
    READ hitmax(ii): hitmax(ii) = hitmax(ii) / travl

    READ speed(ii): 'speed(ii) = INT(speed(ii) / travl)
    READ dodge(ii): dodge(ii) = dodge(ii) / travl
    READ will(ii): will(ii) = will(ii) / travl
    READ dr(ii): dr(ii) = dr(ii) / travl
    READ wdam(ii)
    READ dmod(ii)
    READ damtype$(ii)
    READ reach$(ii)
    READ asiz(ii)
    READ weight(ii)
    READ wemax(ii)
    READ feet(ii): zwei = 1: IF feet(ii) > 2 THEN zwei = 2
    READ remark$(ii)
    READ gravo(ii)
    READ skill$(ii)
    IF skill$(ii) = "" AND DEXTERITY(ii) >= 12 THEN skill$(ii) = "Acrobatics-4, Stealth-6, Tracking-6"
    IF skill$(ii) = "" AND DEXTERITY(ii) < 13 THEN skill$(ii) = "Acrobatics-2, Stealth-4, Tracking-4"
    READ adv$(ii)
    READ INFO$(ii)

    IF g4(ii) = 1 GOTO 99
    'GOTO 99
    STRENGTH(ii) = INT(SQR(STRENGTH(ii) * 10)): REM G4 Originalformel
    REM STRENGTH(ii) = 2 * weight(ii) ^ .33333
    REM STRENGTH(ii) = 25 * (weight / 2217) ^ .33333
    stmax(ii) = CINT(STRENGTH(ii) * 1.25)
    hitpoints(ii) = STRENGTH(ii): hitmax(ii) = hitpoints(ii) * 1.25

    99
    IF hitpoints(ii) = 0 THEN hitpoints(ii) = STRENGTH(ii)
    REM dr(ii) = hitpoints(ii) / 10 - 1: PRINT dr(ii)

    IF ar(ii) = 1 OR speed(ii) = 0 THEN speed(ii) = (hitsave(ii) + DEXTERITY(ii)) / 4 * gravo(ii)
    IF ar(ii) = 1 THEN weight(ii) = weight(ii) / .451: wemax(ii) = wemax(ii) / .451
    IF dodge(ii) = 0 THEN dodge(ii) = INT(speed(ii) + 3)
    dodge = dodge(ii)

    IF ar(ii) = 1 THEN dodge(ii) = dodge
    gravo = gravo(ii): SQRT = .55
    wem = 1: IF wemax(ii) <> weight(ii) THEN wem = wemax(ii) / weight(ii)
    IF ar(ii) = 1 THEN STRENGTH(ii) = 3 + (weight(ii) * .451 * gravo) ^ SQRT / 2 / travl: stmax(ii) = STRENGTH(ii) * wem
    IF weight(ii) > 500 THEN zwei = 2
    IF hitpoints(ii) = 0 THEN hitpoints(ii) = 3 + (weight(ii) * .451 * gravo / zwei) ^ SQRT / 2: hitmax(ii) = hitpoints(ii) * wem

    ccskill = 0
    IF ATTACK(ii) > 10 THEN ccskill = 1
    IF ATTACK(ii) > 11 THEN ccskill = 2
    IF ATTACK(ii) > 12 THEN ccskill = 3
    IF ATTACK(ii) > 13 THEN ccskill = 4
    IF ATTACK(ii) > 15 THEN ccskill = 5
    IF ATTACK(ii) > 17 THEN ccskill = 6
    IF ccskill <> 0 THEN Attack$ = "Melee" + STR$(-ccskill) ELSE Attack$ = "Melee-0"
    IF skill$(ii) = "" THEN skill$(ii) = Attack$ ELSE skill$(ii) = skill$(ii) + ", " + Attack$
    value = DEXTERITY(ii): GOSUB 800
    ToHit = 8 - ccskill - modi: reach$(ii) = reach$(ii) + STR$(ToHit) + "+"
    st0(ii) = STRENGTH(ii)
    hits0(ii) = hitpoints(ii)
    we0(ii) = weight(ii)







    IF weight(ii) <> wemax(ii) THEN GOSUB 8000 ELSE GOSUB 5000
    Dmultz = 1
    IF damtype$(ii) = "cut" THEN Dmultz = 1.5
    IF damtype$(ii) = "imp" THEN Dmultz = 2
    damax(ii) = wdam(ii) * Dmultz * 3.5 + dmod(ii)


    IF endx$ = "XXX" THEN YY = ii - 1: ii = xx: GOTO 98
    98
NEXT: xx = YY: PRINT "Bisher"; xx; "Tiere eingegeben!": ii = 0: IF xx = 0 THEN RUN: 'GOSUB 4998

3950
'FOR wcc = 1 TO 200 STEP .5
FOR wcc = 55 TO 90
    FOR ii = 1 TO xx



        IF CHR$(wcc) <> LEFT$(anim$(ii), 1) GOTO 4999
        'IF INT(damax(ii)) <> wcc GOTO 4999




        3955
        3956
        uuu = 0
        IF skill$(ii) <> "" THEN uuu = 1
        IF adv$(ii) <> "" THEN uuu = uuu + 1
        IF INFO$(ii) <> "" THEN uuu = uuu + 1
        IF aqw = 1 AND nam$ <> LEFT$(anim$(ii), LEN(nam$)) THEN GOTO 4999
        aq$ = CHR$(hitsave(ii) + 55): IF hitsave(ii) < 10 THEN aq$ = CHR$(48 + hitsave(ii))

        'PRINT CINT(Dmultz * wdam(ii) * 3.5 + dmod(ii))

        nam$ = anim$(ii): save$ = nam$
        REM IF LEFT$(anim$(ii), 2) = "AR" THEN nam$ = RIGHT$(nam$, LEN(nam$) - 3)
        ww = 78
        n = LEN(nam$): n1 = CINT((ww - n) / 2): n2 = ww - n1 - n

        STRENGTH = INT(STRENGTH(ii))
        DEXTERITY = INT(DEXTERITY(ii))
        ENDURANCE = INT(hitpoints(ii))




        CLS: LOCATE 1, 1
        GOTO 2955
        PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
        IF uuu < 3 THEN PRINT #nnn, "³                                                                              ³"
        PRINT #nnn, "³"; SPC(n1); nam$; SPC(n2); "³"
        IF uuu < 3 THEN PRINT #nnn, "³                                                                              ³"
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
        'PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"

        2955
        PRINT #nnn, SPC(n1 + 1); nam$
        'PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
        PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄ¿"


        value = STRENGTH(ii): GOSUB 800
        PRINT #nnn, USING "³ STRENGTH   :###³##"; STRENGTH; modi;
        value = DEXTERITY(ii): GOSUB 800
        PRINT #nnn, USING "³ DEXTERITY  : ##³##"; DEXTERITY; modi;

        hits = (hitpoints(ii))
        hitsave = CINT(hitsave(ii))
        REM IF hits < hitsave THEN hitsave = hits
        hat = hits + 1 + 5 * hitsave
        hihi = 0: IF hits = hitsave THEN hihi = 1
        hihi = 1
        value = hits: GOSUB 800
        IF hihi = 1 THEN PRINT #nnn, USING "³ ENDURANCE  :###³##"; ENDURANCE; modi;
        IF hihi = 0 THEN PRINT #nnn, USING "³ ENDURANCE ##+:### "; hitsave; hits;
        value = INTELLIGENCE(ii): GOSUB 800
        PRINT #nnn, USING "³ INTELLIGENCE##³##³"; INTELLIGENCE(ii); modi

        '       PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄ¿"

        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄ´"

        'PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
        IF dr(ii) > 0 THEN PRINT #nnn, USING "³ ARMOR      :###   "; dr(ii); ELSE PRINT #nnn, "³      No Armor     ";
        PRINT #nnn, USING "³ Move       :###   "; speed(ii);

        weight = INT(weight(ii) * .451 / 5) * 5
        IF weight > 150 THEN weight = INT(weight(ii) * .451 / 10) * 10
        IF weight > 1000 THEN weight = INT(weight(ii) * .451 / 50) * 50
        IF weight > 5000 THEN weight = INT(weight(ii) * .451 / 100) * 100


        PRINT #nnn, USING "³ Weight: ######, kg"; weight;
        PRINT #nnn, "³ Range:"; SPC(10 - LEN(reach$(ii))); reach$(ii); " ³"
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄ´"


        hits = hitpoints(ii): hitsave = hitsave(ii): 'GOSUB 2001
        IF travl = 1.5 THEN hits = STRENGTH(ii) + DEXTERITY(ii) + hitpoints(ii)


        hits = CINT(hits): hitsave = CINT(hitsave)
        IF hits < hitsave THEN hitsave = hits
        hat = hits + 1 + funf * hitsave:
        hut = (hits + 1 + 5 * hitsave): 'IF hat < hut THEN hut = hat
        hut = hits
        wex = 5
        sizemod = 0
        IF weight(ii) <= 50 THEN sizemod = -1
        IF weight(ii) >= 400 THEN sizemod = 1
        IF weight(ii) >= 2000 THEN sizemod = 2
        IF weight(ii) > 9999 THEN sizemod = 3
        IF feet(ii) > 2 GOTO 4501
        IF LEFT$(nam$, 4) = "Shar" OR feet(ii) = 0 GOTO 4502
        ert = 8
        PRINT #nnn, USING "³   3,4   ³+## ³ Skull           ³ ###  ³"; INT(-7 + sizemod) / travl; hut;
        PRINT #nnn, USING "    12   ³+## ³ Left Arm       ³ ###  ³"; INT(-2 + sizemod) / travl; DEXTERITY

        PRINT #nnn, USING "³    5    ³+## ³ Face            ³ ###  ³"; INT(-5 + sizemod) / travl; hut;
        PRINT #nnn, USING "  13,14  ³+## ³ Left Leg       ³ ###  ³"; INT(-2 + sizemod) / travl; STRENGTH

        PRINT #nnn, USING "³   6,7   ³+## ³ Right Leg       ³ ###  ³"; INT(-2 + sizemod) / travl; STRENGTH;
        PRINT #nnn, USING "    15   ³+## ³ Hand           ³ ###  ³"; INT(-4 + sizemod) / travl; DEXTERITY

        PRINT #nnn, USING "³    8    ³+## ³ Right Arm       ³ ###  ³"; INT(-4 + sizemod) / travl; DEXTERITY;
        PRINT #nnn, USING "    16   ³+## ³ Foot           ³ ###  ³"; INT(-4 + sizemod) / travl; DEXTERITY

        PRINT #nnn, USING "³   9-11  ³+## ³ Torso 11 = Groin³ ###  ³"; INT(0 + sizemod) / travl; hits;
        PRINT #nnn, USING "  17,18  ³+## ³ Neck           ³ ###  ³"; INT(-5 + sizemod) / travl; hut
        GOTO 4997



        4501 REM Quadruped
        PRINT #nnn, USING "³   3,4   ³+## ³ Skull           ³ ###  ³"; INT(-7 + sizemod) / travl; hut;
        PRINT #nnn, USING "    12   ³+## ³ Groin          ³ ###  ³"; INT(-3 + sizemod) / travl; STRENGTH

        PRINT #nnn, USING "³    5    ³+## ³ Face            ³ ###  ³"; INT(-5 + sizemod) / travl; hut;
        PRINT #nnn, USING "  13,14  ³+## ³ Hindlegs       ³ ###  ³"; INT(-2 + sizemod) / travl; STRENGTH

        PRINT #nnn, USING "³    6    ³+## ³ Neck            ³ ###  ³"; INT(-5 + sizemod) / travl; hut;
        PRINT #nnn, USING "  15,16  ³+## ³ Foot           ³ ###  ³"; INT(-4 + sizemod) / travl; DEXTERITY

        PRINT #nnn, USING "³   7,8   ³+## ³ Forelegs        ³ ###  ³"; INT(-2 + sizemod) / travl; STRENGTH;
        PRINT #nnn, USING "  17,18  ³+## ³ Tail           ³ ###  ³"; INT(-4 + sizemod) / travl; STRENGTH

        PRINT #nnn, USING "³   9,11  ³+## ³ Torso           ³ ###  ³"; INT(0 + sizemod) / travl; hits;
        PRINT #nnn, USING "         ³+## ³ Vitals         ³ ###  ³"; INT(-3 + sizemod) / travl; hut
        GOTO 4997





        4502 REM Ichtyoid
        PRINT #nnn, USING "³   3,4   ³+## ³ Skull           ³ ###  ³"; INT(-7 + sizemod) / travl; hut;
        PRINT #nnn, USING "    12   ³+## ³ Torso          ³ ###  ³"; INT(0 + sizemod) / travl; hits

        PRINT #nnn, USING "³    5    ³+## ³ Face            ³ ###  ³"; INT(-5 + sizemod) / travl; hut;
        PRINT #nnn, USING "  13,14  ³+## ³ Torso          ³ ###  ³"; INT(0 + sizemod) / travl; hits

        PRINT #nnn, USING "³    6    ³+## ³ Fin             ³ ###  ³"; INT(-4 + sizemod) / travl; hut / 3;
        PRINT #nnn, USING "  15,16  ³+## ³ Torso          ³ ###  ³"; INT(0 + sizemod) / travl; hits

        PRINT #nnn, USING "³   7,8   ³+## ³ Neck            ³ ###  ³"; INT(-5 + sizemod) / travl; hut;
        PRINT #nnn, USING "  17,18  ³+## ³ Torso          ³ ###  ³"; INT(0 + sizemod) / travl; hits

        PRINT #nnn, USING "³   9,11  ³+## ³ Torso           ³ ###  ³"; INT(0 + sizemod) / travl; hits;
        PRINT #nnn, USING "         ³+## ³ Vitals         ³ ###  ³"; INT(-3 + sizemod) / travl; hut





        4997
        dmg = wdam(ii): dmod = dmod(ii): dmult = Dmultz
        'GOTO 2001
        'IF wdam(ii) > 5 GOTO 2001
        'IF dmod(ii) = 0 AND Dmultz = 1 THEN GOTO 2001


        2001 p0x = 78: funf = 1

        hits = CINT(hits): hitsave = CINT(hitsave)
        REM IF hits < hitsave THEN hitsave = hits
        hat = hits + 1 + funf * hitsave
        IF hits > p0x - 1 - funf * hitsave THEN hat = p0x: hits = p0x - 1 - funf * hitsave
        IF hat > p0x THEN PRINT #nnn, "ÀÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÙ";: GOTO 4998


        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄ´"
        4890
        IF travl = 1 GOTO 4991

        'STRENGTH = INT(STRENGTH(ii))
        'DEXTERITY = INT(DEXTERITY(ii))
        'ENDURANCE = INT(hitpoints(ii))


        PRINT #nnn, "³ MINOR   ";: value = ENDURANCE: GOSUB 890
        wound = STRENGTH: wound2 = DEXTERITY: IF DEXTERITY > STRENGTH THEN wound2 = STRENGTH: wound = DEXTERITY
        IF nnn <> 2 THEN PRINT #nnn, "³"; SPC(78); "³"
        PRINT #nnn, "³ WOUNDED ";: value = wound: GOSUB 890
        IF nnn <> 2 THEN PRINT #nnn, "³"; SPC(78); "³"
        PRINT #nnn, "³ SERIOUS ";: value = wound2: GOSUB 890
        GOTO 899

        890 w$ = "": FOR i = 1 TO value
            w$ = w$ + "o":
            IF value < 18 THEN w$ = w$ + " "
            IF value < 24 THEN w$ = w$ + " "
            IF value < 35 THEN w$ = w$ + " "
        NEXT
        wl0 = 79 - 10 - LEN(w$): wl1 = INT(wl0 / 2): wl2 = wl0 - wl1
        PRINT #nnn, SPC(wl1); w$; SPC(wl2); "³"

        RETURN

        4991
        stap = -1
        pex = INT((p0x - hat) / 2): pex2 = p0x - pex - hat
        PRINT #nnn, "³"; SPC(pex);: GOSUB 3300

        FOR i = hits TO qb STEP stap
            az = i: IF az < 0 THEN az = az * -1
            aa$ = " "
            IF INT(az / 10) = az / 10 THEN aa$ = MID$(STR$(az), 2, 1)
            PRINT #nnn, aa$;
        NEXT: PRINT #nnn, SPC(pex2); "³";

        PRINT #nnn, "³"; SPC(pex);: GOSUB 3300
        p3 = CINT(DEXTERITY)
        FOR i = hits TO qb STEP stap
            PRINT #nnn, RIGHT$(STR$(i), 1);
        NEXT: PRINT #nnn, SPC(pex2); "³";

        IF uuu = 2 GOTO 301
        PRINT #nnn, "³"; SPC(pex);
        FOR i = hits TO qb STEP stap
            aa$ = " "
            IF i = p3 THEN aa$ = "³"
            IF i = 0 THEN aa$ = "x"
            IF i = -hitsave THEN aa$ = "X"
            IF i = -hitsave - 5 THEN aa$ = "R": ww = -1
            IF i <= -hitsave - 5 THEN ww = ww + 1
            IF ww = 5 THEN ww = 0: aa$ = "D"
            IF aa$ <> " " THEN aa$ = "³" ELSE aa$ = " "
            PRINT #nnn, aa$;
        NEXT
        PRINT #nnn, SPC(pex2); "³";
        301




        PRINT #nnn, "³"; SPC(pex);
        wqr = hitsave + 1
        FOR i = hits TO qb STEP stap

            aa$ = RIGHT$(STR$(i), 1)
            IF hitsave < 10 THEN aq$ = CHR$(48 + hitsave)
            aa$ = " "
            IF i = p3 THEN aa$ = "R"
            IF i = 0 THEN aa$ = "C": aa$ = aq$

            IF i = -hitsave THEN ww = 5
            IF i = -hitsave - 5 THEN ww = 4
            IF i <= -hitsave - 5 THEN ww = ww + 1

            IF ww <> 5 GOTO 2002
            wqr = wqr - 1
            aqy$ = CHR$(wqr + 55)
            IF wqr < 10 THEN aqy$ = CHR$(48 + wqr)
            aqy$ = "Å": aqy$ = "D"
            aa$ = aqy$: ww = 0

            2002
            IF i = -hitsave * 5 THEN aa$ = "í"
            PRINT #nnn, aa$;
        NEXT: PRINT #nnn, SPC(pex2); "³";

        899
        IF uuu = 0 GOTO 4994
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´":
        2003
        IF skill$(ii) = "" THEN GOTO 4990
        nam$ = skill$(ii): GOSUB 9900
        4990
        IF adv$(ii) = "" GOTO 4994
        nam$ = adv$(ii): GOSUB 9900
        4994
        PRINT #nnn, "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
        REM Waffenschaden GURPS Weapons
        value = STRENGTH(ii): GOSUB 800: DAMADD = modi

        Dmultz = 1
        IF damtype$(ii) = "cut" THEN Dmultz = 1.5
        IF damtype$(ii) = "cru" THEN Dmultz = 1
        IF damtype$(ii) = "imp" THEN Dmultz = 2




        DamD = wdam(ii): DamA = dmod(ii)
        dmax = INT(((DamD * 6 + DamA) * Dmultz + DAMADD) / travl): 'PRINT DamD; DamA; kal, dmultz; dmax
        dax = (dmg * 3.5) + dmod
        REM 1W6
        IF DamD > 1 THEN GOTO 40002
        PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿"
        PRINT #nnn, "³    1D6     ³     1    ³     2    ³     3    ³     4    ³     5    ³     6    ³"
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍ´"
        'PRINT #nnn, "³     ³          ³          ³          ³          ³          ³          ³"
        'PRINT #nnn, USING "³ #.# "; dmultz;
        'PRINT #nnn, USING "³#.## "; kal;
        IF damtype$(ii) = "cut" THEN PRINT #nnn, "³   Claws    ";
        IF damtype$(ii) = "cru" THEN PRINT #nnn, "³   crush    ";
        IF damtype$(ii) = "imp" THEN PRINT #nnn, "³   Teeth    ";

        FOR uj = 1 TO 6: value = INT(uj * dmax / 6): IF uj = 6 THEN value = dmax
            PRINT #nnn, USING "³   ###    "; value;
        NEXT
        PRINT #nnn, "³"

        'PRINT #nnn, "³     ³          ³          ³          ³          ³          ³          ³"
        PRINT #nnn, "ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ";
        GOTO 4010

        40002 REM 2W6
        IF DamD > 2 THEN GOTO 40003
        PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿"
        PRINT #nnn, "³    2D6     ³  2  ³  3  ³  4  ³  5  ³  6  ³  7  ³  8  ³  9  ³ 10  ³ 11  ³ 12  ³"
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍ´"
        'PRINT #nnn, "³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³"
        'PRINT #nnn, USING "³#.## "; kal;
        IF damtype$(ii) = "cut" THEN PRINT #nnn, "³   Claws    ";
        IF damtype$(ii) = "cru" THEN PRINT #nnn, "³   crush    ";
        IF damtype$(ii) = "imp" THEN PRINT #nnn, "³   Teeth    ";




        FOR uj = 2 TO 12:
            value = INT((uj + dmod) * Dmultz): IF uj = 12 THEN value = dmax
            value = INT(dmax / 12 * uj): IF uj = 12 THEN value = dmax

            IF uj < 13 THEN PRINT #nnn, USING "³###  "; value;
            '    IF uj > 9 THEN PRINT #nnn, USING "³####  "; value;

        NEXT: PRINT #nnn, "³"


        'PRINT #nnn, "³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³"
        PRINT #nnn, "ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ";
        GOTO 4010
        40003 REM 3W6
        PRINT #nnn, "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿"
        PRINT #nnn, "³     3D6      ³ 3 ³ 4 ³ 5 ³ 6 ³ 7 ³ 8 ³ 9 ³10 ³11 ³12 ³13 ³14 ³15 ³16 ³17 ³18 ³"
        PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍØÍÍÍ´"
        'PRINT #nnn, "³       ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³"
        'PRINT #nnn, USING "³ #.##  "; kal;
        IF damtype$(ii) = "cut" THEN PRINT #nnn, "³    Claws     ";
        IF damtype$(ii) = "cru" THEN PRINT #nnn, "³    crush     ";
        IF damtype$(ii) = "imp" THEN PRINT #nnn, "³    Teeth     ";




        FOR uj = 3 TO 18: value = INT(dmax / 18 * uj): IF uj = 18 THEN value = dmax
            IF uj < 19 THEN PRINT #nnn, USING "³## "; value;
        NEXT: PRINT #nnn, "³"
        'PRINT #nnn, "³       ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³"
        PRINT #nnn, "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ";
        'IF dmt$ = "Exp" AND dax > -1 THEN GOTO 8000
        4010

        IF INFO$(ii) = "" GOTO 4995
        IF nnn = 1 THEN PRINT #nnn,: text$ = INFO$(ii): GOSUB 19999

        4995

        IF nnn = 1 THEN RUN




        4998 a$ = INKEY$: IF a$ = "" GOTO 4998
        IF a$ = "p" THEN nnn = 1: OPEN save$ + ".DOC" FOR OUTPUT AS #1: GOTO 3956
        IF a$ = "q" THEN END
        IF a$ = "r" THEN RUN
        IF a$ = "t" THEN GOSUB 9000: ii = 0: zwei = 1: GOTO 3955
        IF tier = 8 THEN GOTO 2000
        IF ii = 0 THEN RETURN
        aqw = 0: w = ASC(a$): IF w >= 65 AND w <= 90 THEN aqw = 1: ii = 0: wcc = 55: nam$ = a$
        IF a$ = " " AND we0(ii) <> weight(ii) THEN GOSUB 8000: GOTO 3956
    4999 NEXT
NEXT
aqw = 0: GOTO 3950

3300
qb = hitsave * (-1 * funf):
'qb = -DEXTERITY(ii)
oo = 80
IF hits + 1 + -qb > oo THEN qb = (oo - (hits + 1)) * -1
'IF hits + 1 + -qb > 80 THEN hits = -qb + hits - 81
RETURN



5000 REM IF STRENGTH(ii) > 20 THEN RETURN
stt = CINT(STRENGTH(ii)): IF remark$(ii) = "2" THEN GOTO 7000
IF damtype$(ii) = "cru" THEN stt = CINT(STRENGTH(ii) / 2)
IF damtype$(ii) = "imp" THEN stt = CINT(STRENGTH(ii) * 2)
5020 stt = stt + 5: wd = 1
IF stt < 3 + 5 THEN dm = -5: GOTO 5021
IF stt < 6 + 5 THEN dm = -4: GOTO 5021
IF stt < 9 + 5 THEN dm = -3: GOTO 5021
IF stt < 12 + 5 THEN dm = -2: GOTO 5021
IF stt < 16 + 5 THEN dm = -1: GOTO 5021
stt = stt - 1
wd = INT(stt / 20)
dx = (stt / 20) - wd
IF dx >= .75 THEN dm = -1: wd = wd + 1: GOTO 5021
IF dx >= .5 THEN dm = 2: GOTO 5021
IF dx >= .25 THEN dm = 1: GOTO 5021
dm = 0
5021 wd = CINT(wd): dm = CINT(dm)
5022 wdam(ii) = wd: dmod(ii) = dm
REM PRINT USING "ST###/### ##d+# "; STRENGTH(0); stt; wd; dm; : PRINT weapon$; : GOSUB 1000
RETURN








6000 'Thrust
REM IF stt < 5 THEN wd = 0: dm = 0: GOTO 5021

IF stt < 5 THEN wd = 1: dm = -5: GOTO 5021

IF stt = 5 THEN wd = 1: dm = -5: GOTO 5021
IF stt = 6 THEN wd = 1: dm = -4: GOTO 5021
IF stt = 7 THEN wd = 1: dm = -3: GOTO 5021
IF stt = 8 THEN wd = 1: dm = -3: GOTO 5021
IF stt = 9 THEN wd = 1: dm = -2: GOTO 5021
IF stt = 10 THEN wd = 1: dm = -2: GOTO 5021
rf = stt - 11
wd = INT(rf / 8) + 1: dm = INT((rf / 8 - wd + 1) * 4 - 1): GOTO 5022
GOTO 5021

7000 'Swing
REM IF stt < 5 THEN wd = 0: dm = 0: GOTO 5021

IF stt < 5 THEN wd = 1: dm = -5: GOTO 5021

IF stt = 5 THEN wd = 1: dm = -5: GOTO 5021
IF stt = 6 THEN wd = 1: dm = -4: GOTO 5021
IF stt = 7 THEN wd = 1: dm = -3: GOTO 5021
IF stt = 8 THEN wd = 1: dm = -2: GOTO 5021
IF stt = 9 THEN wd = 1: dm = -1: GOTO 5021
IF stt = 10 THEN wd = 1: dm = 0: GOTO 5021
IF stt > 9 THEN rf = stt - 9
wd = INT(rf / 4) + 1: dm = CINT((rf / 4 - wd + 1) * 4 - 1)
GOTO 5021













8000 rand = RND(1) + .05
'IF stmax(ii) = STRENGTH(ii) GOTO 8001
STRENGTH(ii) = (st0(ii) + rand * (stmax(ii) + 1 - st0(ii))) - 1

8001 aa = 0: IF hitpoints(ii) = hitsave(ii) THEN aa = 1

'IF hitmax(ii) = hitpoints(ii) GOTO 8002
hitpoints(ii) = (hits0(ii) + rand * (hitmax(ii) + 1 - hits0(ii))) - 1
IF aa = 1 THEN hitsave(ii) = hitpoints(ii)

8002
'IF wemax(ii) = weight(ii) GOTO 8003
weight(ii) = INT((we0(ii) + rand * (wemax(ii) + 1 - we0(ii))) / 10) * 10

8003
GOSUB 5000
RETURN

9000 'traveller

INPUT "SDEIES"; trav$
IF LEN(trav$) > 6 THEN trav$ = LEFT$(trav$, 6)
trav1$ = trav$
FOR qq = 1 TO 6
    aa$ = MID$(trav$, qq, 1)
    aa = VAL(aa$): IF VAL(aa$) = 0 THEN aa$ = UCASE$(aa$)
    IF aa$ = "A" OR aa$ = "a" THEN aa = 10
    IF aa$ = "B" OR aa$ = "b" THEN aa = 11
    IF aa$ = "C" OR aa$ = "c" THEN aa = 12
    IF aa$ = "D" OR aa$ = "d" THEN aa = 13
    IF aa$ = "E" OR aa$ = "e" THEN aa = 14
    IF aa$ = "F" OR aa$ = "f" THEN aa = 15
    'IF aa < 7 THEN aa = INT(aa * 1.5): GOTO 9001
    REM aa = INT(aa * 1.5 + RND)
    IF aa < 3 THEN aa = 3: GOTO 9001
    IF aa = 3 THEN aa = 5: GOTO 9001
    IF aa = 4 THEN aa = 8: GOTO 9001
    IF aa = 5 THEN aa = 9: GOTO 9001
    IF aa = 6 THEN aa = 10: GOTO 9001
    IF aa = 7 THEN aa = 10: GOTO 9001
    IF aa = 8 THEN aa = 11: GOTO 9001
    IF aa = 9 THEN aa = 12: GOTO 9001
    IF aa = 10 THEN aa = 13: GOTO 9001
    IF aa = 11 THEN aa = 14: GOTO 9001
    IF aa = 12 THEN aa = 15: GOTO 9001
    IF aa = 13 THEN aa = 16: GOTO 9001
    IF aa = 14 THEN aa = 17: GOTO 9001
    IF aa > 14 THEN aa = 18: GOTO 9001


    9001
    IF qq = 1 THEN STRENGTH(0) = aa: stmax(0) = aa
    IF qq = 2 THEN DEXTERITY(0) = aa
    IF qq = 3 THEN hitpoints(0) = aa: hitmax(0) = aa: hitsave(0) = aa
    IF qq = 4 THEN INTELLIGENCE(0) = aa
NEXT


feet(0) = 2: feet = 2
speed(0) = (hitpoints(0) + DEXTERITY(0)) / 4
dodge(0) = speed(0)
will(0) = 0
dr(0) = 0
wdam(0) = 0
dmod(0) = 0
damtype$(0) = "cru"
reach$(0) = "C,1"
asiz(0) = 1
weight(0) = 100 + (STRENGTH(0) + hitpoints(0) - DEXTERITY(0)) * 8
IF weight(0) < 130 THEN weight(0) = 130 + 10 * RND
wemax(0) = 0
feet(0) = 2
st0(0) = STRENGTH(0)
hits0(0) = hitpoints(0)
we0(0) = weight(0)
remark$(0) = "2"
GOSUB 5000
Dmultz = 1
IF damtype$(0) = "cut" THEN Dmultz = 1.5
IF damtype$(0) = "imp" THEN Dmultz = 2
damax(0) = wdam(0) * Dmultz * 3.5 + dmod(0)
anim$(0) = "TRAVELLER UPP : " + trav1$
RETURN

















2000 REM Gurps Traveller Animal encounters
DIM terrain$(15), enc(15), tm(15), sm(15)
DATA "Tropical Forest, Jungle",15,-3,1
DATA "Temperate Forest, Woodland",12,-4,-3
DATA "Polar Forest, Taiga",6,-4,-3
DATA "Scrub Forrest, Chaparral",9,-2,-2
DATA "Grassland, Savanna",12,+4,1
DATA "Polar Plains, Tundra",6,2,-1
DATA "Wetlands, Swamp",9,0,0
DATA "Desert, Dunes",6,3,-2
DATA "Mountain, Alpine",9,0,-2
DATA "Glacier, Ice Cap",6,0,-1
DATA "River, Stream",12,1,-1
DATA "Shoreline, Coast",12,3,1
DATA "Shallows",15,2,2
DATA "Deep Ocean",12,-4,3
DATA "Ocean Bottom",9,-2,1
RESTORE 2000
FOR i = 1 TO 15: READ terrain$(i), enc(i), tm(i), sm(i): NEXT
CLS
FOR i = 1 TO 15: PRINT USING "##. "; i;: PRINT terrain$(i); SPC(30 - LEN(terrain$(i)));
PRINT USING "E##  T##  S##"; enc(i); tm(i); sm(i): NEXT
PRINT
ttl = tt
INPUT " "; tt: IF tt = 0 THEN RUN
IF tt > 14 OR tt < 1 THEN tt = INT(RND * 14)
terrain$ = terrain$(tt): encounter = enc(tt)
skill$(0) = "Enc.:" + STR$(enc(tt)) + "-  *  Habitat: " + terrain$
antype = CINT(RND * 6 + RND * 6 + RND * 6)
carni = 0: omni = 0: herbi = 0
IF antype < 11 THEN type$ = "Herbivore ": herbi = 1: GOTO 2010
IF antype < 14 THEN type$ = "Omnivore ": omni = 1: GOTO 2010
type$ = "Carnivore ": carni = 1
2010 type$ = ""

fstyp = CINT(RND + RND) + tm(tt)
filt = 0: brow = 0: graz = 0
trap = 0: pounc = 0: herd = 0: scav = 0: chas = 0
gath = 0: eate = 0: hunt = 0
IF carni = 1 GOTO 2014

IF omni = 1 GOTO 2012

    
REM Herbivores


IF fstyp < 3 THEN type$ = type$ + "Filter": filt = 1: GOTO 2020
IF fstyp < 6 THEN type$ = type$ + "Browser": brow = 1: GOTO 2020
type$ = type$ + "Grazer": graz = 1: GOTO 2020

2012 REM Omnivores
REM PLAY "C9"

IF fstyp < 2 OR fstyp <= 3 OR fstyp = 5 OR fstyp = 9 OR fstyp > 11 THEN type$ = type$ + "Gatherer": gath = 1: GOTO 2020
IF fstyp = 2 OR fstyp = 4 OR fstyp = 10 THEN type$ = type$ + "Eater": eate = 1: GOTO 2020
IF fstyp = 6 OR fstyp = 7 OR fstyp = 8 OR fstyp = 11 THEN type$ = type$ + "Hunter": hunt = 1: GOTO 2020

2014 REM Carnivores

IF fstyp < 1 OR fstyp = 2 OR fstyp = 12 THEN type$ = type$ + "Trapper": trap = 1: GOTO 2020
IF fstyp = 1 OR fstyp = 3 OR fstyp = 6 THEN type$ = type$ + "Pouncer": pounc = 1: GOTO 2020
IF fstyp = 7 OR fstyp = 11 THEN type$ = type$ + "Herder": herd = 1: GOTO 2020
IF fstyp = 4 OR fstyp = 5 OR fstyp = 10 THEN type$ = type$ + "Scavenger": scav = 1: GOTO 2020
IF fstyp = 8 OR fstyp = 9 OR fstyp > 12 THEN type$ = type$ + "Chaser": chas = 1: GOTO 2020

2020 REM
social = CINT(RND + RND)
IF graz = 1 THEN social = social + 4
IF brow = 1 THEN social = social + 2
IF pounc = 1 THEN social = social - 3
IF trap = 1 THEN social = social - 2
IF herd = 1 THEN social = social + 2
IF gath = 1 THEN social = social + 2
IF hunt = 1 THEN social = social + 1
IF eate = 1 THEN social = social + 2
iqs = 0
IF social < 6 THEN soce$ = "solitary": iqs = 1: GOTO 2030
IF social > 5 AND social < 9 THEN soce$ = "pair bonding": iqs = 1: GOTO 2030
IF social > 8 AND social < 11 THEN soce$ = "small group": iqs = 1: GOTO 2030
IF social > 10 AND social < 13 THEN soce$ = "large group": iqs = 1: GOTO 2030
IF social = 13 THEN soce$ = "small herd": GOTO 2030
IF social = 14 THEN soce$ = "large herd": GOTO 2030
IF social > 14 THEN soce$ = "Hive": iqs = -2: GOTO 2030
2030
skill$(0) = skill$(0) + "  *  Social : " + soce$

ani$ = ""
sft = CINT(RND * 6 + RND * 6)
IF tt = 7 GOTO 2032
IF tt = 11 GOTO 2034
IF tt = 12 OR tt = 13 GOTO 2036
IF tt > 13 GOTO 2038
GOTO 2040

2032 REM Wetlands
IF sft < 3 THEN ani$ = "S-6"
IF sft = 3 THEN ani$ = "A+1"
IF sft = 4 THEN ani$ = "A+2"
IF sft = 11 THEN ani$ = "F-6"
IF sft = 12 THEN ani$ = "F-5"
IF sft = 13 THEN ani$ = "F-4"
IF sft > 13 THEN ani$ = "F-2"
GOTO 2050

2034 REM River
IF sft < 3 THEN ani$ = "S+1"
IF sft = 3 THEN ani$ = "A+1"
IF sft = 11 THEN ani$ = "F-6"
IF sft = 12 THEN ani$ = "F-5"
IF sft = 13 THEN ani$ = "F-4"
IF sft > 13 THEN ani$ = "F-2"
GOTO 2050

2036 REM Shore
IF sft < 3 THEN ani$ = "S+1"
IF sft = 3 THEN ani$ = "A+1"
IF sft = 11 THEN ani$ = "F-6"
IF sft = 12 THEN ani$ = "F-5"
IF sft = 13 THEN ani$ = "F-4"
IF sft > 13 THEN ani$ = "F-2"
GOTO 2050

2038 REM Ocean
IF sft < 5 THEN ani$ = "S+2"
IF sft = 5 THEN ani$ = "A+2"
IF sft = 6 THEN ani$ = "A+0"
IF sft = 7 THEN ani$ = "S+1"
IF sft = 8 THEN ani$ = "S-1"
IF sft = 9 THEN ani$ = "T-7"
IF sft = 10 THEN ani$ = "T-6"
IF sft = 11 THEN ani$ = "F-6"
IF sft = 12 THEN ani$ = "F-5"
IF sft = 13 THEN ani$ = "F-4"
IF sft > 13 THEN ani$ = "F-2"
GOTO 2050

2040 REM Other
IF sft = 10 THEN ani$ = "F-6"
IF sft = 11 THEN ani$ = "F-5"
IF sft = 12 THEN ani$ = "F-4"
IF sft = 13 THEN ani$ = "F-2"
IF sft > 13 THEN ani$ = "F+0"
2050
atx$ = LEFT$(ani$, 1)
IF atx$ = "A" THEN type$ = "Amphibian " + type$
IF atx$ = "F" THEN type$ = "Flying " + type$
IF atx$ = "S" THEN type$ = "Swimming " + type$
IF atx$ = "T" THEN type$ = "Triphibian " + type$

ww = CINT(RND * 6 + RND * 6): IF ww = 12 THEN ww = CINT(RND * 6 + RND * 6) + 6
size = ww + sm(tt) + VAL(RIGHT$(ani$, 2)) + graz + filt - gath - pounc - eate
iqm = 0: dxm = 0: aam = 0
size$ = " "
IF size < 1 THEN weight(0) = 1: STRENGTH(0) = 1: hitpoints(0) = 2: iqm = -4: dxm = 2: size$ = "Tiny "
IF size = 1 THEN weight(0) = 3: STRENGTH(0) = 1: hitpoints(0) = 3: iqm = -4: dxm = 2: size$ = "Very small "
IF size = 2 THEN weight(0) = 5: STRENGTH(0) = 2: hitpoints(0) = 3: iqm = -4: dxm = 2: size$ = "Very small "
IF size = 3 THEN weight(0) = 9: STRENGTH(0) = 2: hitpoints(0) = 4: iqm = -3: dxm = 1: size$ = "Small "
IF size = 4 THEN weight(0) = 18: STRENGTH(0) = 3: hitpoints(0) = 5: iqm = -3: dxm = 1: size$ = "Small "
IF size = 5 THEN weight(0) = 36: STRENGTH(0) = 4: hitpoints(0) = 6: iqm = -1: size$ = "Small "
IF size = 6 THEN weight(0) = 75: STRENGTH(0) = 6: hitpoints(0) = 8: iqm = -1
IF size = 7 THEN weight(0) = 150: STRENGTH(0) = 10: hitpoints(0) = 10: dxm = -1
IF size = 8 THEN weight(0) = 300: STRENGTH(0) = 16: hitpoints(0) = 13: dxm = -2
IF size = 9 THEN weight(0) = 600: STRENGTH(0) = 25: hitpoints(0) = 16: iqm = 1: dxm = -3: size$ = "Large "
IF size = 10 THEN weight(0) = 1200: STRENGTH(0) = 40: hitpoints(0) = 20: iqm = 1: dxm = -4: size$ = "Large ": aam = 1
IF size = 11 THEN weight(0) = 2400: STRENGTH(0) = 64: hitpoints(0) = 25: iqm = 1: dxm = -4: size$ = "Large ": aam = 1
IF size = 12 THEN weight(0) = 4800: STRENGTH(0) = 100: hitpoints(0) = 32: iqm = 1: dxm = -4: size$ = "Large ": aam = 1
IF size = 13 THEN weight(0) = 9000: STRENGTH(0) = 150: hitpoints(0) = 40: iqm = 1: dxm = -4: size$ = "Very large ": aam = 2
IF size = 14 THEN weight(0) = 18000: STRENGTH(0) = 240: hitpoints(0) = 50: iqm = 1: dxm = -4: size$ = "Very large ": aam = 2
IF size = 15 THEN weight(0) = 27000: STRENGTH(0) = 320: hitpoints(0) = 56: iqm = 1: dxm = -4: size$ = "Gigantic ": aam = 2
IF size = 16 THEN weight(0) = 36000: STRENGTH(0) = 390: hitpoints(0) = 62: iqm = 1: dxm = -4: size$ = "Gigantic ": aam = 3
IF size = 17 THEN weight(0) = 45000: STRENGTH(0) = 450: hitpoints(0) = 67: iqm = 1: dxm = -4: size$ = "Gigantic ": aam = 3
IF size = 18 THEN weight(0) = 54000: STRENGTH(0) = 510: hitpoints(0) = 71: iqm = 1: dxm = -4: size$ = "Gigantic ": aam = 3
IF size = 19 THEN weight(0) = 63000: STRENGTH(0) = 560: hitpoints(0) = 75: iqm = 1: dxm = -4: size$ = "Monstrous ": aam = 3
IF size > 19 THEN weight(0) = 72000: STRENGTH(0) = 610: hitpoints(0) = 78: iqm = 1: dxm = -4: size$ = "Monstrous ": aam = 3
type$ = size$ + type$



ww = CINT(RND * 6 + RND * 6)
abt = ww + graze
IF atx$ = "S" THEN abt = abt + 1
IF atx$ = "F" THEN abt = abt - 1
IF tt = 3 OR tt = 6 OR tt = 9 OR tt = 10 THEN abt = abt + 1
IF tt = 8 THEN abt = abt - 1

bone$ = ""
IF abt < 5 THEN bone$ = ", very flimsy": hitsave(0) = 13: hitpoints(0) = hitpoints(0) * .8: GOTO 2080
IF abt = 5 THEN bone$ = ", flimsy": hitsave(0) = 14: hitpoints(0) = hitpoints(0) * .9: GOTO 2080
IF abt > 5 AND abt < 9 THEN hitsave(0) = 15: GOTO 2080
IF abt = 9 THEN bone$ = ", robust": hitsave(0) = 16: hitpoints(0) = hitpoints(0) * 1.1: GOTO 2080
IF abt > 9 THEN bone$ = ", very robust": hitsave(0) = 17: hitpoints(0) = hitpoints(0) * 1.2: GOTO 2080

2080
type$ = type$ + bone$
weight(0) = weight(0) * (.75 + RND / 2)
hitpoints(0) = hitpoints(0) * (.75 + RND / 2)
STRENGTH(0) = CINT(STRENGTH(0) * (.75 + RND / 2))









iqt = CINT(RND * 6 + RND * 6 + RND * 6) + iqm + iqs
IF iqt < 6 THEN INTELLIGENCE(0) = 2: GOTO 2100
IF iqt < 9 THEN INTELLIGENCE(0) = 3: GOTO 2100
IF iqt < 13 THEN INTELLIGENCE(0) = 4: GOTO 2100
INTELLIGENCE(0) = 5
2100
awt = CINT(RND * 6 + RND * 6) - herbi * 2 + omni + carni * 2: PRINT awt;
IF atx$ = "A" THEN awt = awt + 2
IF atx$ = "S" THEN awt = awt + 2
IF weight(0) > 600 THEN awt = awt - 1

Dmultz = 1
IF awt < 0 THEN weapon$ = "big horns": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C,1": GOTO 2110

IF awt = 0 THEN weapon$ = "Tusks": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C,1": GOTO 2110

IF awt = 1 THEN weapon$ = "Spear": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C,1": GOTO 2110

IF awt = 2 THEN weapon$ = "smashing Tail": damtype$(0) = "cru": stt = STRENGTH(0): GOSUB 7000: reach$(0) = "C,1": GOTO 2110

IF awt = 3 THEN weapon$ = "butting horns": damtype$(0) = "cru": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C": GOTO 2110
IF awt = 4 THEN weapon$ = "Horns": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C": GOTO 2110
IF awt = 5 THEN weapon$ = "blunt teeth": damtype$(0) = "cru": stt = STRENGTH(0) / 2: GOSUB 5020: reach$(0) = "C": GOTO 2110
IF awt > 5 AND awt < 10 THEN weapon$ = "no weapons": damtype$(0) = "cru": stt = STRENGTH(0) / 2: GOSUB 5020: reach$(0) = "C": GOTO 2110
IF awt = 10 THEN weapon$ = "sharp teeth": damtype$(0) = "cut": stt = STRENGTH(0): GOSUB 5020: reach$(0) = "C": GOTO 2110
IF awt = 11 THEN weapon$ = "small claws": damtype$(0) = "cru": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C": GOTO 2110
IF awt = 12 THEN weapon$ = "Fangs": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C": GOTO 2110
IF awt = 13 THEN weapon$ = "large claws": damtype$(0) = "cut": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C,1": GOTO 2110
IF awt = 14 THEN weapon$ = "smashing tail": damtype$(0) = "cru": stt = STRENGTH(0): GOSUB 7000: reach$(0) = "C,1": GOTO 2110
IF awt >= 15 THEN weapon$ = "Spear": damtype$(0) = "imp": stt = STRENGTH(0): GOSUB 6000: reach$(0) = "C,1": GOTO 2110

2110 IF (carni = 1 OR hunt = 1) AND awt > 5 AND awt < 10 GOTO 2100
type$ = type$ + ", " + weapon$
adx = 0
ww = CINT(RND * 6 + RND * 6): IF ww = 12 THEN ww = CINT(RND * 6 + RND * 6) + 6

aat = ww - carni + scav * 2 + herbi * 2 + aam
IF atx$ = "A" OR atx$ = "S" THEN aat = aat - 4
IF atx$ = "F" OR atx$ = "T" THEN aat = aat - 2

IF aat > 4 GOTO 2111
will(0) = 0: dr(0) = 0
IF atx$ = "F" OR atx$ = "T" THEN armor$ = "oily feathers": GOTO 2130
armor$ = "skin with mucous"
GOTO 2130

2111 IF aat > 7 GOTO 2112
will(0) = 0: dr(0) = 0
IF atx$ = "F" OR atx$ = "T" THEN armor$ = "downy feathers": GOTO 2130
IF atx$ = "A" OR atx$ = "S" THEN armor$ = "skin": GOTO 2130
armor$ = "very thin fur": GOTO 2130

2112 IF aat > 11 GOTO 2113
will(0) = 0: dr(0) = 1
IF atx$ = "F" OR atx$ = "T" THEN armor$ = "feathers": GOTO 2130
IF atx$ = "A" OR atx$ = "S" THEN armor$ = "scales": GOTO 2130
armor$ = "fur": GOTO 2130

2113 IF aat > 14 GOTO 2114
will(0) = 1: dr(0) = 1
IF tt = 3 OR tt = 6 OR tt = 9 OR tt = 10 THEN armor$ = "thick fur": GOTO 2130
IF atx$ = "A" OR atx$ = "S" THEN armor$ = "heavy scales": GOTO 2130
zt = CINT(RND * 3)
IF zt = 1 THEN armor$ = "spiny fur (Quills)": GOTO 2130
IF zt = 2 THEN armor$ = "heavy scales": GOTO 2130
IF zt = 3 THEN armor$ = "thick fur": GOTO 2130

2114
IF aat = 15 OR aat = 16 THEN dr(0) = 2: armor$ = "Carapace": adx = -2: GOTO 2130
IF aat = 17 OR aat = 18 THEN dr(0) = 3: armor$ = "Armor plates": adx = -2: GOTO 2130
IF aat = 19 THEN dr(0) = 4: armor$ = "thick armor plates": adx = -4: GOTO 2130
IF aat > 19 THEN dr(0) = 5: armor$ = "armored shell": adx = -6: GOTO 2130

2130
type$ = type$ + ", " + armor$

ww = CINT(RND * 6 + RND * 6 + RND * 6)
adt = ww + dxm + hunt + carni * 2 + adx
IF adt < 4 THEN DEXTERITY(0) = 8: GOTO 2090
IF adt = 4 THEN DEXTERITY(0) = 9: GOTO 2090
IF adt > 4 AND adt < 7 THEN DEXTERITY(0) = 10: GOTO 2090
IF adt > 6 AND adt < 9 THEN DEXTERITY(0) = 11: GOTO 2090
IF adt > 8 AND adt < 13 THEN DEXTERITY(0) = 12: GOTO 2090
IF adt > 12 AND adt < 16 THEN DEXTERITY(0) = 13: GOTO 2090
IF adt > 15 AND adt < 18 THEN DEXTERITY(0) = 14: GOTO 2090
IF adt > 17 THEN DEXTERITY(0) = 15: GOTO 2090

2090









feet(0) = 4: zwei = 2
speed(0) = (hitpoints(0) + DEXTERITY(0)) / 3


IF atx$ = "F" THEN speed(0) = speed(0) * 2
dodge(0) = speed(0) / 2: IF DEXTERITY(0) / 2 > dodge(0) THEN dodge(0) = DEXTERITY(0) / 2
IF herd = 1 OR chas = 1 OR hunt = 1 THEN speed(0) = speed(0) * 2

REM wdam(0) = 0
REM dmod(0) = 0
asiz(0) = SQR(weight(0) / 200): IF asiz(0) < 1 THEN asiz(0) = 1
wemax(0) = 0

st0(0) = STRENGTH(0)
hits0(0) = hitpoints(0)
we0(0) = weight(0)
remark$(0) = "X"
anim$(0) = type$
GOTO 3955
GOSUB 5000
Dmultz = 1
IF damtype$(0) = "cut" THEN Dmultz = 1.5
IF damtype$(0) = "imp" THEN Dmultz = 2
damax(0) = wdam(0) * Dmultz * 3.5 + dmod(0)

GOTO 3955










10000
damall = CINT((wdam * 3.5 + dmod) / 3.5)
IF damall < 10 THEN PRINT #nnn, USING "##D"; wdam;: IF dmod <> 0 THEN PRINT #nnn, USING "+# "; dmod; ELSE PRINT #nnn, "   ";
IF damall < 10 THEN RETURN

mx = INT(damall / 2)
IF damall > 20 THEN mx = INT(damall / 3)
IF damall > 30 THEN mx = INT(damall / 4)
IF damall > 50 THEN mx = INT(damall / 5)
IF damall > 60 THEN damax = INT(damall / 6)
PRINT #nnn, USING "##Dx##"; damall / mx; mx;
RETURN

999 DATA 1,1,1,.9954,.9815,.9537,.9074,.8308,.7407,.625,.5,.375,.2593,.1628,.0926,.0463,.0185,4.6E-3
  
REM -Charakter
  
DATA "Perry Rhodan   ","++ ",2.9,"*TE",7,6,10,0,2,2,80,1,"Schwacher Telepath"
DATA "Atlan          ","++ ",2.8,"*AR",8,6,10,0,2,2,80,1,"Monoschirm"
DATA "Crest          ","---",2.1,"*AR",4,3,10,0,2,2,70,1,"Monoschirm"
DATA "Reginald Bull  ","+  ",2.1,"*TE",4,4,10,0,2,2,90,1,"-"
DATA "John Marshall  ","+  ",2.1,"*TE",4,3,10,0,2,2,85,1,"Telepath"
DATA "Ras Tschubai   ","+  ",2.2,"*TE",5,4,10,0,2,2,85,1,"Teleporter"
DATA "Tako Kakuta    ","+  ",2.1,"*TE",5,4,10,0,2,2,65,1,"Teleporter"
DATA "Gucky          ","+++",2.2,"*IL",3,0,5,0,1,1,20,1,"Telepath, Teleporter, Telekinet"
DATA "Ribald Corello ","+  ",1,"*TE",3,0,5,0,1,1,30,1,"Multimutant"
DATA "Goratschin     ","+  ",2.9,"*US",6,5,25,2,3,3,250,1,"Z}nder"
DATA "Lord Zwiebus   ","+++",3,"*PB",4,10,25,0,3,6,170,1,"Pseudo-Neandertaler"
DATA "Cart Rudo      ","+  ",4.5,"*EP",6,5,20,0,2,3,450,2.2,"Epsaler"
DATA "Melbar Kasom   ","+++",3.5,"*ER",10,10,40,0,3,6,800,3.4,"Mentalstabilisiert"
DATA "Lemy Danger    ","+++",6.9,"*SI",10,10,1,1,0,1,1,1.12,"Mentalstabilisiert"
DATA "Ovaron         ","+  ",2.7,"*TE",7,6,10,0,2,2,90,1,"Pedotransferer"
DATA "Takvorian      ","-  ",3.1,"*ZE",6,5,35,0,3,5,400,1,"Movator"
DATA "Omar Hawk      ","+  ",4.9,"*OX",6,8,25,1,2,7,1200,4.8,"Mentalstabilisiert"
DATA "Sherlock       ","+++",6.9,"*OK",0,4,15,1,1,10,1000,4.8,"Okrill"
DATA "Icho Tolot     ","+  ",5.5,"*HA",9,9,65,4,4,12,2000,3.6,"Impulskanone und PARATRON <6>"
'DATA "PALADIN I      ","+++",6.9,"HA",10,10,80,5,4,16,3450,5,"Impulskanone und Hš-Typ <5>"
DATA "Raumsoldat     ","   ",2.,"*TE",3,2,10,0,2,2,80,1,""
DATA "USO-Spezialist ","+++",2.5,"TE",10,10,10,0,2,2,85,1,""
DATA "Dalaimoc Rorvic","---",2.1,"*TE",4,4,15,0,2,1,150,.5,"Halbcyno"
DATA "Don Redhorse   ","+++",2.9,"*TE",7,5,10,0,2,2,80,1,""
DATA "Ronald Tekener ","+++",2.9,"*TE",10,10,10,0,2,2,95,1,"Mentalstabilisiert"
DATA "S.M. Kennon    ","---",1.9,"*TE",10,0,10,0,2,1,75,1,"Mentalstabilisiert"
DATA "S.M. Kennon II ","   ",3.9,"*RO",10,10,15,4,2,10,230,23,"Mentalstabilisiert"
DATA "GLADIATOR R1   ","   ",3,"RO",4,4,20,-2,3,12,2000,1,"Impulskanone und Typ <3> Schirm"
DATA "TRK-2400/III   ","   ",3,"RO",4,4,20,-2,3,15,1500,1.05,"Impulskanone und Typ <3> Schirm"
'DATA "TARA III UH    ","   ",4,"RO",10,10,20,1,3,20,3000,1,"Impulskanone und PARATRON Typ <6>"
DATA "VARIO-500      ","   ",5,"*RO",0,0,5,4,1,20,52,150,""
998 REM  -Car
    
DATA "Siganese       ","   ",6,"*SI",0,0,1,1,0,1,1,1.12,""
DATA "Mausbiber      ","   ",2,"*IL",0,0,5,0,1,1,20,1,"Telekinet"
DATA "Okefenokee     ","   ",2,"*OK",0,0,5,0,1,1,35,.98,"Teleporter"
DATA "Blue           ","   ",2,"BL",0,0,15,0,2,2,60,1,""
DATA "Ara            ","   ",2,"*AR",0,0,15,0,2,2,60,1.2,""
DATA "Springer       ","   ",2,"SP",0,0,20,0,2,2,100,1,""
DATA "Terraner       ","   ",2,"TE",0,0,10,0,2,2,80,1,""
DATA "Ferrone        ","   ",2,"*TE",0,0,15,0,2,2,90,1.4,""
DATA "Skoar          ","   ",2,"SK",0,0,20,0,2,3,170,1.2,""
DATA "Dumfrie        ","   ",2,"DU",0,0,15,1,2,3,150,1.2,""
DATA "Paddler        ","   ",2,"*PA",0,0,20,1,2,2,120,1.2,"Desintegrator"
DATA "Pseudo Neanderl","   ",2,"*PB",0,0,25,0,3,6,150,1,"Pr„bio"
DATA "Zentaur        ","   ",2,"*PB",0,0,35,0,3,10,400,1,"Pr„bio"
DATA "Uberschwerer   ","   ",3,"US",0,0,20,0,2,3,350,1.9,""
DATA "Epsaler        ","   ",4,"EP",0,0,20,0,2,3,450,2.1,""
DATA "Maahk          ","   ",3,"MA",0,0,25,0,2,3,500,3,""
DATA "Druuf          ","   ",2,"DR",0,0,45,0,3,3,1000,1.95,""
DATA "Kelosker       ","   ",1,"*KE",0,0,35,0,4,4,1200,1,""
DATA "Naat           ","   ",1,"NA",0,0,45,0,3,5,1300,2.8,""
DATA "Ertruser       ","   ",3,"ER",0,0,40,0,3,6,16.3*50,3.4,""
DATA "Oxtorner       ","   ",4,"OX",0,0,25,1,2,7,1200,4.8,""
DATA "Zyklop         ","   ",1,"*PB",0,0,25,1,2,7,3000,1,""
DATA "Haluter        ","   ",5,"HA",0,0,65,4,4,10,2000,3.6,""
DATA "Zeitpolizist   ","   ",5.5,"HA",0,0,70,4,4,11,2100,4,""
DATA "Pelewon        ","   ",5,"*HA",0,0,70,4,4,11,2100,1.1,""
DATA "Uleb           ","   ",6,"HA",0,0,70,4,4,12,2390,4.1,""
DATA "Tyrannosaurus  ","   ",1,"*PB",0,0,100,-1,8,3,8000,1,""
DATA "B„r            ","   ",2,"ER",0,0,40,-3,3,3,400,1,""
DATA "cru","",0,"",0,0,0,0,0,0,0,0,""
qx = 100: Rg = 10.5
' DIM Proz(18): RESTORE 999: FOR i = 1 TO 18: READ Proz(i): NEXT
DIM Lp(qx), Na$(qx), Pm$(qx), Ge(qx), Vo$(qx), Wk(qx), Nk(qx), Dmx(qx), Sv(qx), Hs(qx), Be(qx), Kg(qx), Gr(qx), re$(qx)
DIM Lp1(qx), Lp2(qx), Lp3(qx), Lp4(qx)
RESTORE 998: FOR qx = 1 TO 1000
    READ Na$(qx), Pm$(qx), Ge(qx), Vo$(qx), Wk(qx), Nk(qx), Dmx(qx)
    READ Sv(qx), Hs(qx), Be(qx), Kg(qx), Gr(qx), re$(qx)
    IF Na$(qx) = "cru" THEN Qz = qx - 1: qx = 1000
    Pm = 1
    IF Pm$(qx) = "---" THEN Pm = .7
    IF Pm$(qx) = "-- " THEN Pm = .8
    IF Pm$(qx) = "-  " THEN Pm = .9
    IF Pm$(qx) = "+  " THEN Pm = 1.3
    IF Pm$(qx) = "++ " THEN Pm = 1.5
    IF Pm$(qx) = "+++" THEN Pm = 1.7

    Lp4(qx) = ((Kg(qx) / 80 * Gr(qx) * Rg * Pm)): '^.5*8)/1.22:'.476
    Lp3(qx) = INT(Lp4(qx) / 2)
    Lp1(qx) = INT(Lp4(qx) / 6)
    Lp2(qx) = INT(Lp4(qx) / 6 * 2)

NEXT
  
  
  
9900
ww = 78
n = LEN(nam$): n1 = CINT((ww - n) / 2): n2 = ww - n1 - n
PRINT #nnn, "³"; SPC(n1); nam$; SPC(n2); "³"
RETURN



















800
IF value < 1 THEN modi = -3: RETURN
IF value < 3 THEN modi = -2: RETURN
IF value < 6 THEN modi = -1: RETURN
IF value < 9 THEN modi = 0: RETURN
modi = INT((value - 9) / 3) + 1: RETURN





IF value$ = "0" THEN value = 0: RETURN
IF VAL(value$) > 0 THEN value = VAL(value$): RETURN
IF value$ = "A" OR value$ = "a" THEN value = 10: RETURN
IF value$ = "B" OR value$ = "b" THEN value = 11: RETURN
IF value$ = "C" OR value$ = "c" THEN value = 12: RETURN
IF value$ = "D" OR value$ = "d" THEN value = 13: RETURN
IF value$ = "E" OR value$ = "e" THEN value = 14: RETURN
IF value$ = "F" OR value$ = "f" THEN value = 15: RETURN
RETURN


60
IF value < 1 THEN value$ = "0": RETURN
IF value = 1 THEN value$ = "1": RETURN
IF value = 2 THEN value$ = "2": RETURN
IF value = 3 THEN value$ = "3": RETURN
IF value = 4 THEN value$ = "4": RETURN
IF value = 5 THEN value$ = "5": RETURN
IF value = 6 THEN value$ = "6": RETURN
IF value = 7 THEN value$ = "7": RETURN
IF value = 8 THEN value$ = "8": RETURN
IF value = 9 THEN value$ = "9": RETURN
IF value = 10 THEN value$ = "A": RETURN
IF value = 11 THEN value$ = "B": RETURN
IF value = 12 THEN value$ = "C": RETURN
IF value = 13 THEN value$ = "D": RETURN
IF value = 14 THEN value$ = "E": RETURN
IF value = 15 THEN value$ = "F": RETURN
IF value = 16 THEN value$ = "G": RETURN
IF value = 17 THEN value$ = "H": RETURN
IF value = 18 THEN value$ = "J": RETURN
IF value = 19 THEN value$ = "K": RETURN
IF value = 20 THEN value$ = "L": RETURN
IF value = 21 THEN value$ = "M": RETURN
IF value = 22 THEN value$ = "N": RETURN
IF value = 23 THEN value$ = "P": RETURN
IF value = 24 THEN value$ = "Q": RETURN
IF value = 25 THEN value$ = "R": RETURN
IF value = 26 THEN value$ = "S": RETURN
IF value = 27 THEN value$ = "T": RETURN
IF value = 28 THEN value$ = "U": RETURN
IF value = 29 THEN value$ = "V": RETURN
IF value = 30 THEN value$ = "W": RETURN
IF value = 31 THEN value$ = "X": RETURN
IF value = 32 THEN value$ = "Y": RETURN
IF value > 32 THEN value$ = "Z": RETURN


IF damtype$(ii) = "cut" THEN PRINT #nnn, "³ Claws :";
IF damtype$(ii) = "cru" THEN PRINT #nnn, "³ crush :";
IF damtype$(ii) = "imp" THEN PRINT #nnn, "³ Teeth :";
IF remark$(ii) = "2" THEN PRINT #nnn, "³ Thrust:";: stt = CINT(STRENGTH(ii)): GOSUB 6000
IF remark$(ii) = "" THEN GOSUB 5000
wdam = wdam(ii): dmod = dmod(ii): GOSUB 10000
weq = 0
IF damtype$(ii) = "cut" THEN PRINT #nnn, "x1.5³";: Dmultz = 1.5: weq = 1
IF damtype$(ii) = "cru" THEN Dmultz = 1
IF damtype$(ii) = "imp" THEN PRINT #nnn, "x 2 ³";: Dmultz = 2: weq = 1
IF weq = 0 THEN PRINT #nnn, "    ³";
PRINT #nnn,
PRINT #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"




IF remark$(ii) <> "2" THEN PRINT #nnn, "                  ³";: GOTO 3952
stt = CINT(STRENGTH(ii)): GOSUB 7000
PRINT #nnn, " Swing :";: wdam = wd: dmod = dm: GOSUB 10000
PRINT #nnn, "    ³";
GOTO 3952
3951
IF damtype$(ii) = "cru" THEN GOTO 3952
stt = CINT(STRENGTH(ii) / 2): GOSUB 5020
PRINT #nnn, "   ³   crush :";: wdam = wdam(ii): dmod = dmod(ii): GOSUB 10000
PRINT #nnn, "    ³";
3952 PRINT #nnn,
'print #nnn, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´";





19999 ' Druckausgabe
s78 = 78
s782 = s78 - 2
PRINT #nnn, "Ú";
FOR I2 = 1 TO s78: PRINT #nnn, "Ä";: NEXT
PRINT #nnn, "¿"

FOR I2 = 0 TO 10: text$(I2) = "Ä": NEXT

tabu0 = s782 + 1: tabu = tabu0: tx = 0:
text$(0) = text$: IF LEN(text$(0)) <= tabu THEN GOTO 10004

10001 IF tabu > 1 AND MID$(text$(tx), tabu, 1) <> " " THEN tabu = tabu - 1: GOTO 10001
leng = LEN(text$(tx)): l1 = leng - tabu
text$(tx + 1) = RIGHT$(text$(tx), l1)
text$(tx) = LEFT$(text$(tx), tabu)
tx = tx + 1
tabu = tabu0
IF LEN(text$(tx)) > tabu THEN GOTO 10001



10002 FOR I2 = 0 TO tx - 1: space0 = tabu0 - LEN(text$(I2)): work1$ = ""

    10003 work$ = text$(I2): work1$ = "":
    FOR zz = 1 TO LEN(work$): space0$ = MID$(work$, zz, 1)
        IF space0$ = " " AND space0 > 0 THEN space0$ = "  ": space0 = space0 - 1
        work1$ = work1$ + space0$
    NEXT
    text$(I2) = work1$
    IF space0 > 0 AND tx <> I2 THEN GOTO 10003

NEXT

10004 FOR I2 = 0 TO tx: 'IF I2 = 0 THEN PRINT #nnn, "³";
    IF nnn = 1 THEN PRINT #nnn, "³ ";
    text$(I2) = LEFT$(text$(I2), LEN(text$(I2)) - 1)
    IF I2 = tx THEN text$(I2) = text$(I2) + SPC(s782 - LEN(text$(I2)))
    IF nnn = 1 THEN PRINT #nnn, text$(I2); " ³":
    IF nnn = 0 THEN PRINT " "; text$(I2)
NEXT
PRINT #nnn, "À";
FOR I2 = 1 TO s78: PRINT #nnn, "Ä";: NEXT
PRINT #nnn, "Ù"
RETURN




GOTO 40001
fz = 25
CLS: PRINT "   ";
FOR i = 1 TO fz
PRINT USING " ##"; i;: NEXT
PRINT: PRINT: PRINT

PRINT "-« ";
FOR i = 1 TO fz
    aa = -INT(i / 2)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT

PRINT "-¬ ";
FOR i = 1 TO fz
    aa = -INT(i / 4)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT

PRINT "+¬ ";
FOR i = 1 TO fz
    aa = INT(i / 4)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT
PRINT "+« ";
FOR i = 1 TO fz
    aa = INT(i / 2)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT
PRINT "3/4";
FOR i = 1 TO fz
    aa = INT(i * 3 / 4)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT
PRINT "x2 ";
FOR i = 1 TO fz
    aa = INT(i * 4 / 4)
PRINT USING " ##"; i + aa;: NEXT
PRINT: PRINT
GOSUB 1000




'GOTO 40000

1000 a$ = INKEY$: IF a$ = "" GOTO 1000
IF a$ = "q" THEN END
IF a$ = "r" THEN RUN
RETURN

'GOTO 3
40001
CLS

max = 15964.5 * .451
gravo = 1: travl = 1.5: SQRT = .55
'max = 2000
FOR i = 45.1 TO max STEP 451: REM 22.505
    PRINT USING "####kg"; i;
    ton = 0: po = i / .451
    IF po > 2000 THEN ton = po / 2000
    IF ton = 0 THEN PRINT USING "#####p="; po;
    IF ton > 0 THEN PRINT USING "##.##t="; ton;


    stre = i ^ .7 / 2
    stre = 3 + (i * .451 * gravo) ^ SQRT / 2 / travl

    PRINT USING "### ST "; stre;
NEXT
'END

'GOTO 3
CLS: FOR stt = 4 TO 21
    GOSUB 6000
    PRINT USING "##. ### +#"; stt; wd; dm
NEXT: 'END
3




