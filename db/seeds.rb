idea1 = Idea.create(title: "do the thing", body: "you could probably try doing the thing.")
puts "'#{idea1.title}' created!"
idea2 = Idea.create(title: "don't do the thing", body: "you could probably try not doing the thing.", quality: 1)
puts "'#{idea2.title}' created!"
idea3 = Idea.create(title: "forget the thing you meant to do", body: "you could probably try forgetting about doing the thing.", quality: 2)
puts "'#{idea3.title}' created!"
