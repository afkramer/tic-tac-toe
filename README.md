# tic-tac-toe
My solution to the tic-tac-toe project in The Odin Project Ruby path.
To play the game, go to https://replit.com/@afkramer/tic-tac-toe#.replit

## What I learned
This project was to highlight working with OOP in Ruby. My focus was on creating classes to represent various features of the game (Board, Player, Game, Gui).

Using the RuboCop extension was seriously helpful, as it tipped me off to many small mistakes that I was making. It was good practice to try to make methods as small and clean as possible, so that they only perform one task. I think this is still an area where I can improve, however.

I also tried to practice using the different enumerators in Ruby. Since I have mostly worked with Java so far, it is difficult for me to break the habit of using "for" loops. This is discouraged in Ruby because of the other powerful possibilities that can be used.

## Room to grow
One issue that I still have but couldn't come up with a cleaner solution was how I display the board. RuboCop wasn't happy with my show_board method. 

I also ended up using two "loop do" loops. According to the curriculum this loop type is not used often, so I think perhaps I overlooked a better alternative.

In addition, I am having trouble remembering to commit to Git often. In a team working with other developers this can really lead to problems. I tend to jump around and work on different methods in different classes at the same time, which makes it even more important to commit often.

## Testing
I revisited this project to add tests using Rspec. It was a great way to learn the syntax of Rspec and concentrate on what kinds of tests are necessary to have a good test suite. I ended up changing a few things here and there to be able to test more easily. All in all I think it will be a good basis for the next project, which is to implement Connect 4 using TDD principles.