# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	User.create(first_name: 'Admin',last_name: "Admin", timezone: "-8", email: 'admin@power-minute.com', password: '12345678')

	User.create(first_name: 'Beni',last_name: "Shpringer", timezone: "-8", email: 'bshpringer@gmail.com', password: '12345678', phone_number: "+14152333355")

	User.create(first_name: 'Ryan', last_name: "Ho", timezone: "-8", email: 'ryan@power-minute.com', password: '12345678', phone_number: "+14156194486")

	User.create(first_name: 'Sean', last_name: "From Iran", timezone: "-8", email: 'sean@power-minute.com', password: '12345678', phone_number: "+15106129959")

	User.create(first_name: 'Josh', last_name: "Kim", timezone: "-8", email: 'josh@power-minute.com', password: '12345678', phone_number: "+12136634691")

	User.create(first_name: 'Cole', last_name: "Kent", timezone: "-6", email: 'cole@power-minute.com', password: '12345678', phone_number: "+19254374085")

	User.all.each do |user|
		schedule = Schedule.create(user_id: user.id)
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    days.each do |day|
      Day.create(name: day, schedule_id: schedule.id)
    end
	end

	Category.create(name: 'Power')
	Category.create(name: 'Cardio')
	Category.create(name: 'Yoga')

	20.times do
		WorkoutTemplate.create(title: Faker::Company.name, description: Faker::Company.catch_phrase, creator_id: rand(2..6), category_id: rand(1..3), private_status: false)
	end

	200.times do
		Workout.create(user_id: rand(2..6), workout_template_id: rand(1..20), reps: rand(0..25), created_at: DateTime.new(2016,1,rand(1..31),4,5,6,'+7'))
	end

	100.times do
		Workout.create(user_id: rand(2..6), workout_template_id: rand(1..20), reps: rand(0..25), created_at: DateTime.new(2016,2,rand(1..18),4,5,6,'+7'))
	end


	1.upto(5) do |count|
		Group.create(name: Faker::Company.name, admin_id: count)
		GroupsUser.create(member_id: count, group_id: count)
	end

	30.times do
		GroupComment.create(member_id: rand(2..6), group_id: rand(1..5), comment_text: Faker::Hacker.say_something_smart)
	end

#Third argument for workout_template_seed_hash is as follows:
# Stayed up all night making these gifs! But we're good!
# category_id 1 = Power Calenthetics
# category_id 2 = Cardio
# category_id 3 = Yoga Pilates Stretches

workout_template_seed_hash =
 {
  ["Half Push Up to Childs Pose", "https://zippy.gfycat.com/ReadySphericalIndianhare.webm",3 ],
  ["Shoulder Shrugs", "https://zippy.gfycat.com/CostlyImperturbableGermanshorthairedpointer.webm", 3 ],
  ["Cross Legged Hug Stretch","https://zippy.gfycat.com/ConsiderateHappygoluckyErin.webm", 3],
  ["Opposite Elbow Knee Torso Twist", "https://zippy.gfycat.com/GreatFamiliarGar.webm", 3],
  ["Butterfly Stretch", "https://zippy.gfycat.com/FaroffAggravatingBluewhale.webm", 3],
  ["Knee Hug Stretch", "https://zippy.gfycat.com/MealySerpentineHoverfly.webm", 3],
  ["Knee Hug Circles", "https://zippy.gfycat.com/DecentKeyKissingbug.webm", 3],
  ["Bridge Press Pullover", "https://zippy.gfycat.com/LastingPeskyArgusfish.webm", 3],
  ["Cat to Cow", "https://zippy.gfycat.com/LeadingGregariousCat.webm", 3],
  ["Cobra Tricep Pushup", "https://zippy.gfycat.com/AnotherWastefulCopperhead.webm", 3],
  ["Bird Dog", "https://zippy.gfycat.com/BitesizedInfamousBettong.webm", 3],
  ["Leg Extention + Stretch", "https://zippy.gfycat.com/MadeupIlliterateIridescentshark.webm", 3],
  ["Full Body Stretch", "https://zippy.gfycat.com/GenerousRightGreatargus.webm", 3],
  ["Triceps Stretch", "https://zippy.gfycat.com/BrokenFirmCowrie.webm", 3],
  ["Cobra", "https://zippy.gfycat.com/PowerfulKnobbyConey.webm", 3],
  ["Modified Pigeon", "https://zippy.gfycat.com/WindingPitifulDromedary.webm", 3],
  ["Downward Dog", "https://zippy.gfycat.com/WeeUntriedIndianglassfish.webm", 3],
  ["Toe Touch Triangle", "https://zippy.gfycat.com/ThoseIncredibleFrillneckedlizard.webm", 3],
  ["Pilates Walk Ups", "https://zippy.gfycat.com/GlisteningGargantuanAtlanticbluetang.webm", 3],
  ["Outside Leg Raises", "https://zippy.gfycat.com/MiniaturePaleDairycow.webm", 3],
  ["High Knees", "https://zippy.gfycat.com/PotableJoyousAntbear.webm", 2],
  ["Jump Squats", "https://zippy.gfycat.com/SecondhandCavernousAmmonite.webm", 1],
  ["Pilates Bridge", "https://zippy.gfycat.com/AdmirableMerryDairycow.webm", 3],
  ["Lunging Hamstring Stretch", "https://zippy.gfycat.com/SpitefulFlatAnteater.webm", 3],
  ["Toe Touch Kicks", "https://zippy.gfycat.com/RigidOddballCob.webm", 2],
  ["High Knee Jacks", "https://zippy.gfycat.com/ZanyUnselfishAngwantibo.webm", 2],
  ["Fly Jacks", "https://zippy.gfycat.com/FineDimwittedFlycatcher.webm", 2],
  ["Plank Slaps", "https://zippy.gfycat.com/ObesePastIndigobunting.webm", 1],
  ["Ventral Jacks", "https://zippy.gfycat.com/DefiantAdeptGermanpinscher.webm", 2],
  ["Jumping Jacks", "https://zippy.gfycat.com/UnsungPoshAzurevase.webm", 2],
  ["Slow Burpees", "https://zippy.gfycat.com/ThinUnhealthyBlueshark.webm", 1],
  ["Squats", "https://zippy.gfycat.com/HappyAllAustrianpinscher.webm", 1],
  ["Row + Lateral Steps", "https://zippy.gfycat.com/BlueSlowCrocodile.webm", 2],
  ["Thigh Stretch", "https://zippy.gfycat.com/WelcomeWindingAmericanshorthair.webm", 3],
  ["Jog In Place", "https://zippy.gfycat.com/ForkedCorruptDuckbillcat.webm", 2],
  ["Warrior Pose", "https://gfycat.com/OptimalSizzlingBrahmancow", 3],
  ["Center Hops", "https://zippy.gfycat.com/DaringHiddenAmbushbug.webm", 2],
  ["Jab Cross Kick", "https://zippy.gfycat.com/RawImpureBinturong.webm", 2],
  ["Jab Elbow", "https://zippy.gfycat.com/SecondWeeGemsbuck.webm", 2],
  ["Flyjacks", "https://zippy.gfycat.com/DishonestMenacingDrafthorse.webm", 2],
  ["Uppercut Hook Knee", "https://zippy.gfycat.com/HonestEnormousKookaburra.webm", 2],
  ["Jumping Jacks + Uppercuts", "https://zippy.gfycat.com/SplendidPettyIndiancow.webm", 2],
  ["Knees + Uppercuts", "https://zippy.gfycat.com/GlumPolishedIrukandjijellyfish.webm", 2],
  ["Boxer Shuffle", "https://zippy.gfycat.com/DenseHiddenBlowfish.webm", 2],
  ["Uppercut + Hook Stance Switch", "https://zippy.gfycat.com/FlippantLimpingCommabutterfly.webm", 2],
  ["Butt Kicker Squat Drops", "https://zippy.gfycat.com/ThirdGorgeousFossa.webm", 1],
  ["Switchfoots + Squat", "https://zippy.gfycat.com/AmpleUnhealthyGiantschnauzer.webm", 1],
  ["Bicycle Crunches", "https://zippy.gfycat.com/SlushyElatedDobermanpinscher.webm", 1],
  ["Lateral Lunge Pops", "https://zippy.gfycat.com/PoshRawAntarcticgiantpetrel.webm", 2],
  ["Toe Touch Circles", "https://zippy.gfycat.com/WavyDefiantFireant.webm", 3],
  ["High Knee Hold", "https://zippy.gfycat.com/QuerulousImpracticalIceblueredtopzebra.webm", 2],
  ["Reclined Punches", "https://zippy.gfycat.com/EuphoricColorlessAntelope.webm", 1],
  ["Oblique Crunches", "https://zippy.gfycat.com/BountifulBoilingArchaeocete.webm", 1],
  ["Reverse Crunches", "https://zippy.gfycat.com/CheapYellowishGangesdolphin.webm", 1],
  ["Knee Tuck Crunches", "https://zippy.gfycat.com/WarlikeFelineDanishswedishfarmdog.webm", 1],
  ["Toe Touch Crunches", "https://zippy.gfycat.com/FlamboyantLankyGelada.webm", 1],
  ["Russian Twists", "https://zippy.gfycat.com/ShimmeringJampackedIberianlynx.webm", 1],
  ["Reaching Oblique Crunches", "https://zippy.gfycat.com/WeeHighAxisdeer.webm", 1],
  ["Flutter Kicks", "https://zippy.gfycat.com/SlightCaringHalicore.webm", 1],
  ["Toe Touch Jacks", "https://zippy.gfycat.com/ShamefulAngelicBeagle.webm", 2],
  ["Squat + Side Lifts", "https://zippy.gfycat.com/LividThoughtfulKarakul.webm", 1],
  ["Plank Jacks + Lifts", "https://zippy.gfycat.com/PositiveRawAfricanclawedfrog.webm", 1],
  ["Supine Plank Reach", "https://zippy.gfycat.com/ImportantLittleHyena.webm", 3],
  ["Lunge + Bow", "https://zippy.gfycat.com/SoulfulPastGibbon.webm", 1]
}



