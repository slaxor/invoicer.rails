Factory.define :random_user, :class => User do |f|
  f.login { Faker::Name.name }
  f.email { Faker::Internet.email }
  # pw: "password"
  f.crypted_password '69657bcb139a0c3c2fb90a1381c5d38744c825db1551dd12121a26b17c17b2b0ccc02d557e99852c40c15aabfc79043cfcdc3bf1b5613285e1fdc856e59d9927'
  f.password_salt 'Qb0bSilf5DUbW37k1Uoy'
  f.persistence_token 'a23fbe7bc32e967d24f0bc0a2179a87f39f45582b20aa0642a5ca182131a4740d9b921b64fa693230d8a40250c2ea4664e19df3c871c1fd385b90cd14d66af58'
  f.single_access_token 'cPgPxhhv1f5QbtuVRYv'
  f.perishable_token 'JBfrbn6Zoe0iwisiDhY'
  f.login_count 0
  f.failed_login_count 0
end

