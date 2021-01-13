# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  [
    {
     name: "動物(どうぶつ)",
    },
    {
     name: "植物(しょくぶつ)",
    },
    {
     name: "自然(しぜん)",
    },
    {
     name: "宇宙(うちゅう)",
    },
    {
     name: "体(からだ)",
    },
    {
     name: "機械(きかい)",
    },
    {
     name: "工作(こうさく)",
    },
    {
     name: "社会(しゃかい)",
    },
    {
     name: "歴史(れきし)",
    },
    {
     name: "その他(そのた)",
    },
  ]
)

User.create!(
  name: '管理者',
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD_CONFIRMATION'],
  admin: true
)