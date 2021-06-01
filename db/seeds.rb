current_user = User.create(email: 'test@123.com', password: '123456')

category = current_user.categories.create({ name: "Urgent", description: "Need now, do now." })
category = current_user.categories.first
category.tasks.create([ { name: "Pay electricity bill", description: "24/7 aircon pa more.", deadline: Date.tomorrow },
                      { name: "Pay internet bill", description: "Kahit bayaran mo mabagal pa din.", deadline: Date.tomorrow } ])


category = current_user.categories.create({ name: "Groceries", description: "The other line always moves faster." })
category = current_user.categories.last
category.tasks.create([ { name: "Meat and Fish", description: "Buy at local grocery.", deadline: Date.today },
                      { name: "Basic Necessities", description: "Buy at local supermarket.", deadline: Date.today } ])