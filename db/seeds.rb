require 'faker'

User.create(email: 'rhen@123.com', password: '123456')
current_user = User.create(email: 'test@123.com', password: '123456')

category = current_user.categories.create({ name: "Urgent", description: "Need now, do now." })
category = current_user.categories.first
category.tasks.create([ { name: "Pay electricity bill", description: "24/7 aircon pa more.", deadline: Date.tomorrow },
                      { name: "Pay internet bill", description: "Kahit bayaran mo mabagal pa din.", deadline: Date.tomorrow }])


category = current_user.categories.create({ name: "Groceries", description: "The other line always moves faster." })
category = current_user.categories.last
category.tasks.create([ { name: "Meat and Fish", description: "Buy at local grocery.", deadline: Date.today },
                      { name: "Basic Necessities", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Chips", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Softdrinks", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Condiments", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Bread", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Nuts", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Cookies", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Soap", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Detergent", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Girl Stuff", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Coffee", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Pad Paper", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Batteries", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Charger", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Broom", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Underwear", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Bedsheets", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Lotion", description: "Buy at local supermarket.", deadline: Date.today },
                      { name: "Headphones", description: "Buy at local supermarket.", deadline: Date.today }])

20.times do
  category = current_user.categories.create({ name: Faker::Games::Witcher.character, description: Faker::Games::Witcher.quote })
end                 
                  
                      