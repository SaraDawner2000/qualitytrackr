# Create the initial user
User.create!(
  email: "ndworknstudy@gmail.com",
  password: "password",
  username: "natalie_super_admin",
  admin: true,
  roles: "quality_manager"
)
