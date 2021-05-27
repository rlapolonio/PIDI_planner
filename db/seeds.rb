Category.create([ { name: "Urgent", description: "Need now, do now." },
  { name: "Groceries", description: "The other line always moves faster." }])

category = Category.last
category.tasks.create([ { name: "first_task", description: "first_task_description", deadline: DateTime.now.tomorrow },
                       { name: "second_task", description: "second_task_description", deadline: DateTime.now.tomorrow } ])
