# Simon Says
A game that the player must repeat the sequence of signals defined by Simon. 
Simon will give the first signal by flashing one of the buttons. The player must repeat that signal by clicking the same button. 
Simon will repeat the first signal and then add one more. The player must repeat those two signals in the same order. 
Simon and the player then repeat this process until the player enters the wrong sequence.

## UI/UX Design
Clear and straightforward design to layout all labels and buttons.

- Element Used
  - Title: title as "Simon Says" on custom font
  - High Score: highest score during gameplays. Will reset by terminate the game.
  - Score: A number in the middle of the page, indicate the current score. Count up after each successful repeat of the sequence.
  - Four Buttons: Four interactive buttons will simulate the glow effect to indicate Simon's and player's sequence when tap.
  - Start Button: Show "Start". Tap on the button to start the game with a countdown of 3 seconds.
  - Game Over Button: Show "Game Over, Tap to try again!". Tap on the button to start a new game with a countdown of 3 seconds.
  
- Flow
  - Tap on "Start" to start the game right after a count down by 3 seconds, 
    - Simon will start the sequence, add one new signal at the end of each new round, 
       and the player needs to repeat the sequence right after Simon finished.
    - Repeat the above process until the player enters the wrong sequence.
  
## Technical Design
- MVC
  Basic MVC design to separate view and viewController

- Protocol/Delegate 
  Use to trigger the start of the game between two viewController
  
- Extension
  For better readability
  - separate and group the viewController's functions by the setting of the view and game process.
  
- Other
  For better management and maintenance
  - Arrange files into folders
  - Keep the related view and view controller under the same folder.
  
  ## Testing
  - Manual testing
    Manual testing during the development
  
  
  
## Improvement
- UX/UI
  - Can specify when the turn change between Simon and the player.
  - Add sound to better indicate a button is tapped
  - Add vibration to indicate a button is tapped.

- Feature
  - Implement GameCenter to better recording player's scores and compete with another user.
  - Award user by some visual/sound effects when beat highscore.
  
- Technical
  - Improve random generated sequence
  
- Testing
  - Unit test
  
