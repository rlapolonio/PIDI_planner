category = Category.create({ name: "Urgent", description: "Need now, do now." })
category = Category.first
category.tasks.create([ { name: "Pay electricity bill", description: "24/7 aircon pa more.", deadline: Date.tomorrow },
                      { name: "Pay internet bill", description: "Kahit bayaran mo mabagal pa din.", deadline: Date.tomorrow } ])


category = Category.create({ name: "Groceries", description: "The other line always moves faster." })
category = Category.last
category.tasks.create([ { name: "Meat and Fish", description: "Buy at local grocery.", deadline: Date.today },
                      { name: "Basic Necessities", description: "Buy at local supermarket.", deadline: Date.today } ])