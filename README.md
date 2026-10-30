# Rock Paper Scissors

You against the computer. Click rock, paper or scissors. The computer picks its move at random, and the app shows both moves side by side. It also counts how many rounds you have played.

There's one big thing missing. The app can spot a tie, but when the moves are different it only says "Someone won". It doesn't know who! Rock beats scissors, scissors beats paper, and paper beats rock. Teaching the app those rules is up to you.

## How to run the game

1. Open the game's folder and double-click **RockPaperScissors.xcodeproj**. Xcode opens.
2. At the top of the Xcode window, find the menu that names a device. Make sure it says **My Mac**.
3. Press **Command-R**, or click the triangle-shaped **Run** button.

The first run takes a minute while Xcode builds the app. After that, the game opens in its own window on your Mac and you can play.

To read the code, click **RockPaperScissorsView.swift** in the list of files on the left. Most of the game lives in that one file.


## Testing
Play any amount of rounds, then add up the ties, playerWins, and computerWins. They should add up to number of rounds played. 
See line 201 and change 202 to test the result of set moves
## Credits

I wrote this starter game for my ICS3U course at Lakefield College School.

When you make the game your own, add to this list. Name any AI tool you used and what you used it for. Name any code, images or sounds that came from somewhere else, and say where they came from.

- Starter game: Mr. Gordon, ICS3U
