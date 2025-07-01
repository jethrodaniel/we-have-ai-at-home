User.find_by(email_address: "admin@example.test") || User.create!(
  email_address: "admin@example.test",
  password: "password"
)
