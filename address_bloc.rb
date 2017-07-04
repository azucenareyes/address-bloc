require_relative 'controllers/menu_controllers'
# menu is a variable that holds an object which is an
# instance of a class. The class in this case is MenuController
menu = MenuController.new
#system is from Ruby
#system talks to bash then bash just clears the screen
system "clear"
puts "Welcome to AddressBloc!"
#here MenuController's method: main_menu is being called on menu,
#which is a variable that holds an object which is an instance of MenuController.
menu.main_menu
