[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/B2U6ZLFM)
# :wave: Welcome to the parallelization assignment in BAN400!
The assignments in BAN400 are organized through Github and Github Classroom. By accepting this assignment, the repository will be copied to your Github user so that you can clone it to your own personal machine and work on it. Then, you simply commit your changes and push back to Github when you are done. You can commit and push as much as you want before the deadline.

**Date:**

**Name:**

**Student number:**

## :information_source: Problem 1
Update the personal information above.

## :milky_way: Problem 2

In Ban420 we worked with an assignment related to the tweedie distribution. See the folder `ban420 homework 4\` for the assignment used in Ban420 and the solution. 

In *this* assignment however, we are interested in executing the script *faster* using parallel computing. Compare the time it takes to solve the problem using the following three different methods: 

1. The solution script as it is now
2. The solution script where you rewrite lines 29-35 (i.e. the final loop) to use parallel computing.
3. The solution script where you rewrite the function MTweedieTests to split the M simulations in more than one core, and otherwise let the original script remain unchanged. 

Organize your solution in the following way: 
- Create a folder `scripts\`, containing three `r`-files: one for each of the three solution methods above. 
- Create a file `timer.r` in the root folder (i.e. the same folder as this README-file). The `timer.r`-file should source the files in `scripts\`, and use tictoc to time them. 

Include a comment in your final script on which method is fastest, and any idea you might have that explains the result. 
