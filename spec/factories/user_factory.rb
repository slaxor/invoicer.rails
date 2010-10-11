Factory.define :random_user, :class => User do |f|
  f.login { Faker::Name.name }
  f.email { Faker::Internet.email }
  # pw: "password"
  f.password 'password'
  f.password_confirmation 'password'
end

