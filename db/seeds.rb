puts "Clearing old data..."

Battle.destroy_all
Pokemon.destroy_all
Move.destroy_all

moves = [
  { name: "Tackle", element: "", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Tail Whip", element: "", power: 0, accuracy: 3, status: "defence-", special: "" },
  { name: "Poison Powder", element: "", power: 0, accuracy: 2, status: "poison", special: "" },
  { name: "Vine Whip", element: "grass", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Scratch", element: "", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Growl", element: "", power: 0, accuracy: 3, status: "attack-", special: "" },
  { name: "Ember", element: "fire", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Leer", element: "", power: 0, accuracy: 3, status: "defence-", special: "" },
  { name: "Bubble", element: "water", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Water Gun", element: "water", power: 3, accuracy: 3, status: "", special: "" },
  { name: "Gust", element: "air", power: 2, accuracy: 3, status: "", special: "" },
  { name: "Sand Attack", element: "", power: 0, accuracy: 2, status: "accuracy-", special: "" },
  { name: "Quick Attack", element: "", power: 1, accuracy: 4, status: "", special: "quick" },
  { name: "Wing Attack", element: "", power: 3, accuracy: 3, status: "", special: "" },
  { name: "Screech", element: "", power: 0, accuracy: 2, status: "defence<", special: "" },
  { name: "Sonic Boom", element: "", power: 2, accuracy: 4, status: "", special: "" }
]

puts "Adding moves..."

moves.each do |m|
  move = Move.new(name: m[:name], element: m[:element], power: m[:power], accuracy: m[:accuracy], status: m[:status], special: m[:special])
  move.save!
end

puts "Moves created successfully"

seeds = [
  { name: "Bulbasaur", element: "grass", attack: 5, sp_attack: 5, evasion: 4, hp: 5, moves: ["Tackle", "Tail Whip", "Poison Powder", "Vine Whip"] },
  { name: "Charmander", element: "fire", attack: 6, sp_attack: 4, evasion: 5, hp: 4, moves: ["Scratch", "Growl", "Ember", "Leer"] },
  { name: "Squirtle", element: "water", attack: 4, sp_attack: 5, evasion: 3, hp: 6, moves: ["Tackle", "Tail Whip", "Bubble", "Water Gun"] },
  { name: "Pidgey", element: "normal", attack: 3, sp_attack: 3, evasion: 8, hp: 2, moves: ["Gust", "Sand Attack", "Quick Attack", "Wing Attack"] },
  { name: "Voltorb", element: "electric", attack: 2, sp_attack: 7, evasion: 5, hp: 4, moves: ["Screech", "Tackle", "Sonic Boom"] }
]

puts "Seeding pokemon..."

seeds.each do |pok|
  pokemon = Pokemon.new(name: pok[:name], element: pok[:element], attack: pok[:attack], sp_attack: pok[:sp_attack], evasion: pok[:evasion], hp: pok[:hp] * 11, max_hp: pok[:hp] * 11)
  pokemon.save!
  pok[:moves].each { |move| pokemon.moves << Move.find_by(name: move) }
  puts "#{pokemon.name} created"
end

puts "Finished!"
