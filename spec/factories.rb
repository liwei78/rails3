Factory.define :user do |user|
  user.email  "liwei@123.com"
  user.name   "liwei"
  user.password "liwei"
  user.password_confirmation "liwei"
end

Factory.define :tag do |tag|
  tag.name "ATag"
end