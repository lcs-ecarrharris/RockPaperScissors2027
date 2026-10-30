//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  WHAT THIS GAME DOES NOW
//  You pick rock, paper or scissors. The computer picks one at random.
//  It can keep score
//  It can tell when a round is a tie.
//
//  Rock beats scissors, scissors beats paper, and paper beats rock.
//
import SwiftUI

// The picture for each move. These are emoji, so they are just text.
// TRY: Change these to other emoji to give the game a new theme.
let rockEmoji: String = "🪨"
let paperEmoji: String = "📄"
let scissorsEmoji: String = "✂️"

// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct RockPaperScissorsView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The name of each move, such as "Rock", and the emoji that shows it.
    // Before the first round, nobody has picked a move yet.
    @State var playerMove: String = "No move yet"
    @State var playerEmoji: String = "❓"
    @State var computerMove: String = "No move yet"
    @State var computerEmoji: String = "❓"
    
    // What happened in the last round.
    @State var result: String = "Let's play!"
    
    // How many rounds have been played.
    @State var roundsPlayed: Int = 0
    
    // How many times has the player won
    @State var playerWins: Int = 0
    //How many times has the computer won
    @State var computerWins: Int = 0
    //How many there
    @State var ties: Int = 0
    
    // MARK: - Computed properties
    
    
    
    var body: some View {
        VStack(spacing: 24) {
            
            // The title at the top of the screen.
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.teal)
            // Shrink the title a little if it does not fit on one line.
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            // The two moves, side by side.
            HStack {
                VStack(spacing: 8) {
                    Label("You", systemImage: "person.fill")
                        .font(.headline)
                    Text(playerEmoji)
                        .font(.system(size: 90))
                    Text(playerMove)
                        .font(.title3)
                    Text("Player wins: \(playerWins)")
                        .font(.system(size: 10))
                }
                .frame(maxWidth: .infinity)
                
                
                VStack {
                    Spacer()
                    
                    Text("vs")
                        .font(.title)
                        .foregroundStyle(Color.secondary)
                    
                    Spacer()
                    
                    Text("Ties: \(ties)")
                        .font(.system(size: 10))
                        .padding(.bottom, 6)
                }
                
                
                VStack(spacing: 8) {
                    Label("Computer", systemImage: "desktopcomputer")
                        .font(.headline)
                    Text(computerEmoji)
                        .font(.system(size: 90))
                    Text(computerMove)
                        .font(.title3)
                    Text("Computer wins: \(computerWins)")
                        .font(.system(size: 10))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .background(Color.teal.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // The result of the round.
            Text(result)
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            // One button for each move the player can make.
            // The code inside the braces runs when that button is clicked.
            Text("Choose your move")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            
            HStack(spacing: 12) {
                Button {
                    chooseRock()
                } label: {
                    VStack {
                        Text(rockEmoji)
                            .font(.system(size: 44))
                        Text("Rock")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    choosePaper()
                } label: {
                    VStack {
                        Text(paperEmoji)
                            .font(.system(size: 44))
                        Text("Paper")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseScissors()
                } label: {
                    VStack {
                        Text(scissorsEmoji)
                            .font(.system(size: 44))
                        Text("Scissors")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .font(.headline)
            // TRY: Change teal to another colour. Change it in the title and the moves box too.
            .tint(Color.teal)
            
            Text("Rounds played: \(roundsPlayed)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 520, minHeight: 640)
    }
    
    // MARK: - Functions
    
    // The player picked rock.
    func chooseRock() {
        playerMove = "Rock"
        playerEmoji = rockEmoji
        playRound()
    }
    
    // The player picked paper.
    func choosePaper() {
        playerMove = "Paper"
        playerEmoji = paperEmoji
        playRound()
    }
    
    // The player picked scissors.
    func chooseScissors() {
        playerMove = "Scissors"
        playerEmoji = scissorsEmoji
        playRound()
    }
    
    // The computer picks its move at random.
    func chooseComputerMove() {
        
        // Pick 1, 2 or 3. Each number stands for one move.
        // Change 202 for testing, replace "Int.random(in: 1...3)" with 1, 2, or 3 to get a set move
        let randomNumber: Int = Int.random(in: 1...3)
        
        if randomNumber == 1 {
            computerMove = "Rock"
            computerEmoji = rockEmoji
        } else if randomNumber == 2 {
            computerMove = "Paper"
            computerEmoji = paperEmoji
        } else {
            computerMove = "Scissors"
            computerEmoji = scissorsEmoji
        }
    }
    
    // Plays one round, once the player has picked a move.
    func playRound() {
        chooseComputerMove()
        roundsPlayed += 1
        
        if playerMove == computerMove {
            // TRY: Change what the game says when there is a tie.
            result = "It's a tie!"
            ties += 1
        } else if playerMove == "Scissors" && computerMove == "Paper" {
            result = "You won"
            playerWins += 1
        } else if playerMove == "Rock" && computerMove == "Scissors" {
            result = "You won"
            playerWins += 1
        } else if playerMove == "Paper" && computerMove == "Rock" {
            result = "You won"
            playerWins += 1
        } else {
            result = "You lose"
            computerWins += 1
        }
    }
}

#Preview {
    RockPaperScissorsView()
}
