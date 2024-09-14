/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR money = 10
VAR intelligence = 0

->player

==player==
*[No Ability]
    -> main
*[Start with the Ability to Lose Less Money]
    ~intelligence = intelligence + 0.5
    ->main
*[Start with More Money]
    ~money = money + 5 
    -> main

== main ==
You are in front of HW casino. {not homeMoney: There is $5 at your home.}
+[Enter the Casino] -> casino
*[Pick Up a Casino Book] -> casinoBook
+[Go Back Home] -> home
-> DONE

==casino==
Would you like to play roulette dice game?
+[Play the game] -> game
+[How to Play Roulette Dice Game] -> how
+[Exit the Casino] -> main
-> DONE

==home==
*[Take the money] -> homeMoney
+[Go Back] -> main
-> DONE

==homeMoney==
~money = money + 5
You get $5. Now You have {money}
-> home

==game==
~temp dice = RANDOM(1,6)
The number on the dice is {dice}.
{
    -dice >= 3: 
        you get $ {dice - 3}
        ~money = money + dice - 3
        
    -dice <= 3:
        {
        -intelligence > 0:
        Your intelligence help you lose less money.
        }
        You lose  $ {dice - intelligence}
        ~money = money - dice + intelligence
}
{ 
    -money <= 0:
        -> money0
     }
     
{
    -money >= 50:
        -> money50
}
Now you have {money}.
-> casino

==how==
Roll the dice with numbers 1 to 6 written on it.
If you get 1 to 3, you lose the amount of money that came out.
If you roll 4 to 6, you win. If it's 4 you get $1, 5 you get $2, 6 get $3.
+[Go Back] -> casino
->DONE

==casinoBook==
~intelligence = intelligence + 0.5
Intelligence has increased. Intelligence help you play the game.
-> main

== money0 ==
You lost all money. {not homeMoney: Eventhough you have money at home, you are being dragged to a scary place by strangers because you do not have money right now.} Game Over
-> END

== money50 ==
Now you have {money}.
You reach your $50 goal.
-> END







