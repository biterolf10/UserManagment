require "./src/main.rb"

user_mngr = UserManager.new

user_mngr.add_user("Test1", "ASD")
user_mngr.show_users