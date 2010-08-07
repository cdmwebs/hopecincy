require 'machinist/active_record'

Organization.blueprint do
  name { 'Test' }
end

User.blueprint do
  name { 'Test User' }
  email { "email-#{sn}@email.com" }
  password { 'password' }
  password_confirmation { 'password' }
end
