Config = {}

Config.ElektrikerModel = 's_m_m_gaffer_01' -- Her vælger du modellen til din NPC | Here you choose the model for the NPC
Config.ElektrikerPed = vector4(677.5333, 74.0320, 83.1171, 261.7535) -- Hvor NPC'en vil spawne | Where the NPC will spawn
Config.ElektrikerVehicle = vector4(687.0752, 72.2318, 83.5108, 156.1302) -- Hvor køretøjet vil spawne | Where the vehicle will spawn

Config.RewardMin = 1000 -- Min kontanter/bank konto pr udført job | Max cash/bank account per complted job
Config.RewardMax = 5000 -- Max kontater/bank konto pr udført job | Max cash/bank account per completed job
Config.RewardType = 'item' -- item eller bank | item or bank

Config.GiveKeys = true -- Sæt den til false hvis du ikke vil give nøgler | Set to false if you don't want to give keys

Config.AllowedDistance = 10.0 -- Distancen skal have .0 | The distance must have .0
Config.DropPlayer = true -- Sæt til true hvis spilleren skal kickes for snyd | Set to true if the player should be kicked for cheating
Config.DiscordWebhookUrl = "https://discord.com/api/webhooks/YOUR_WEBHOOK_URL" -- Her sætter du dit webhook for discord logging | Here you set your webhook for discord logging

-- Her kan du selv tilføjet flere lokationer | Here you can add more locations yourself
Config.ElektrikerLokationer = {
	{
		Label = 'Downtown Vinewood',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272274753515819191/image.png?ex=66ba61b2&is=66b91032&hm=2af82963eb318e2d58e24843231b769f7f3dd18103953e26a18e4b55ab934208&=&format=webp&quality=lossless&width=550&height=268',
		Coords = vector3(203.7326, 237.7354, 105.5484)
	},
	{
		Label = 'Mirror Park',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272619156889534645/image.png?ex=66bba273&is=66ba50f3&hm=d688bffb2f84c3e6ad4fff5cbd1c4b7f88d8c63d7b7d3599d10c3ce2f4ff6505&=&format=webp&quality=lossless&width=550&height=281',
		Coords = vector3(1294.4695, -543.7612, 70.2847)
	},
	{
		Label = 'Murrieta Heights',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272619637712093266/image.png?ex=66bba2e5&is=66ba5165&hm=08e79534bc7cd7b1617268a57f23631bc26206a6903c55edb3798b17d4a8ef78&=&format=webp&quality=lossless&width=1275&height=671',
		Coords = vector3(959.5810, -1003.2989, 40.0144)
	},
	{
		Label = 'La Mesa',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272619990624895016/image.png?ex=66bba339&is=66ba51b9&hm=26b64eafd26e2a760834a18e78057286b3b4ba11a03fa836786664c922b062b9&=&format=webp&quality=lossless&width=550&height=244',
		Coords = vector3(934.2521, -1774.6630, 31.2160)
	},
	{
		Label = 'Chamberlain Hills',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272620346306199573/image.png?ex=66bba38e&is=66ba520e&hm=1fb0114738ff741bcad3848daaa2507f7252e88b1a98f6980ea0484bb8d9e779&=&format=webp&quality=lossless&width=550&height=264',
		Coords = vector3(-150.9713, -1706.6407, 30.4962)
	},
	{
		Label = 'La Puerta',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272620668814364702/image.png?ex=66bba3db&is=66ba525b&hm=97d1b05157c7d870dd92dc20ec613b157b9b505b7c8259751aa737c2c1201743&=&format=webp&quality=lossless&width=550&height=260',
		Coords = vector3(-1068.8129, -1507.1869, 5.0863)
	},
	{
		Label = 'Del Perro',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272621023803473971/image.png?ex=66bba430&is=66ba52b0&hm=79492f1b794da60dfcdd570abe8e7bb4c3dd387788aa79030daeea2354af8099&=&format=webp&quality=lossless&width=1429&height=671',
		Coords = vector3(-1490.0242, -645.2689, 30.0001)
	},
	{
		Label = 'Rockford Hills',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272621332840054955/image.png?ex=66bba479&is=66ba52f9&hm=5e61ca8d09dee5b929599afe0bcd92fd978ba4c4701195135860e5ea60d987ed&=&format=webp&quality=lossless&width=550&height=260',
		Coords = vector3(-962.9764, -334.8332, 37.8151)
	},
	{
		Label = 'Burton',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272621561672892519/image.png?ex=66bba4b0&is=66ba5330&hm=dc31b2688ba32ceb3d6de6e8c20c345cd7f2980594a4c1052914b3584a8e8da4&=&format=webp&quality=lossless&width=1415&height=671',
		Coords = vector3(-525.3777, -15.6148, 44.4686)
	},
	{
		Label = 'Downtown Vinewood',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272621873980510228/image.png?ex=66bba4fa&is=66ba537a&hm=f47c6111fe1d12a7347f6f096b682cbc79390524c8e30f5898617ba2e4cf85cc&=&format=webp&quality=lossless&width=1409&height=671',
		Coords = vector3(62.3339, 229.1477, 109.2048)
	},
	{
		Label = 'Vinewood',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272622111323586560/image.png?ex=66bba533&is=66ba53b3&hm=1e12f2c82ab957d76b55133c050247fcf1a7e2384bc8e17544232b81751353e2&=&format=webp&quality=lossless&width=1407&height=671',
		Coords = vector3(-50.3693, -456.8943, 40.4160)
	},
	{
		Label = 'Pillbox hill',
		Description = 'Lønen vil være mellem ' .. Config.RewardMin .. ',-DKK og ' .. Config.RewardMax .. ',-DKK',
		Icon = 'fa-solid fa-image',
		Image = 'https://media.discordapp.net/attachments/609502609224630272/1272622376227569749/image.png?ex=66bba572&is=66ba53f2&hm=cb946268c68e7a55de6a6497e6a8376f2ee7e471d05a8b6e656b6525a6d2c9b2&=&format=webp&quality=lossless&width=550&height=258',
		Coords = vector3(195.2108, -1046.5382, 29.2891)
	},
}