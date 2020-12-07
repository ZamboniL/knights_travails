<p align="center">
  <img src="https://i.imgur.com/y7YKev9.png" height = '300px'/>
</p>

# Knights Travails

Knights Travails is the solution to a programming challenge given to me through the [Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/knights-travails), where I had to use a pathfinding algorithm to get the minum amount of moves a knight should take to go from point A to point B.

My algorthim of choice was the A\* since it is optimized to find the result where there is only one exit, on the A\* I used the manhattan heuristic formula only a bit modified to better suit the movements of a Knight.

## Installation

Use the git clone [git](https://git-scm.com/about) to install Knights Travails.

```bash
git clone https://github.com/ZamboniL/knights_travail.git
```

You should also have [ruby](https://www.ruby-lang.org/en/about/) installed in your pc for that check ruby's official [installation guide](https://www.ruby-lang.org/en/documentation/installation/).

## Usage

Execute:

```bash
ruby lib/knights_travail.rb
```

With the Knighst_Travail folder open in you terminal.

You will then be asked to insert the coordinates for the starting condition, where the knight will start on the board, and the end position, where the knight should get at the end.

```bash
What is the start position?
Give a X (from 1 to 8) position: 
Give a Y (from 1 to 8) position: 
What is the end position?
Give a X (from 1 to 8) position: 
Give a Y (from 1 to 8) position: 
```

After this the program will calculate the necessary moves and output to the terminal a chess board with each movement the knight made

## Repl Terminal

You can also test the code on this [repl](https://repl.it/@ZamboniL1/knights_travail#README.md) without installing anything!

# What I learned

* A better understanding of pathfinding algorithms

* Ruby project organization

* Even more understanding of OOP

* How to better plan my projects before starting to code

# Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

# License

[MIT](https://choosealicense.com/licenses/mit/)
