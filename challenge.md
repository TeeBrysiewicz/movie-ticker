You have been hired to automate the scheduling process for a movie theater. 

The end goal is for the theater's supervisor to run one command in the terminal, which will output movie schedules. 

something like: ruby movieGEN1.rb input-file.txt

The command should take in a text file, like the one below: 

Movie Title, Release Year, MPAA Rating, Run Time
There's Something About Mary, 1998, R, 2:14
How to Lose a Guy in 10 Days, 2003, PG-13, 1:56
Knocked Up, 2007, R, 2:08
The Wedding Singer, 1998, PG-13, 1:36
High Fidelity, 2000, R, 1:54
Sleepless in Seattle, 1993, PG, 1:46
The Proposal, 2009, PG-13, 1:48

Things to note: 
Expect the text file to have any number of movies.
Assume the theater has one screen dedicated to each movie. 
The theater opens at 10am, and closes at midnight. 
The theater takes 1 hour to set up in the morning. 
The theater employees need 35 minutes in between each movie to clean up. 
No movie can go past midnight. 

Bonus! 
Schedule prime times first, starting at 4pm. 