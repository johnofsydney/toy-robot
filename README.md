# Toy Robot - John's Solution


## Running and testing the code
This app uses ruby version 2.7.3 as specified in `.ruby-version`
To install: clone the repo and
- install the correct ruby version if required
- `$ bundle install` to install necessary gems
  - the specified bundler version is 2.1.4

### to run the tests
#### Unit Tests
`$ bundle exec rspec`

#### Integration Tests
`$ ruby spec/integration/integration_test.rb`
As per the instruction below, the robot will announce itself for ANY of the REPORT instructions in the list. The final call to `robot.report` will report it's finishing place.
## to run the code
- run `ruby src/conductor.rb` from within the root level of the folder
- the app will pull comands from the file 'commands.txt' and output the final location
- the final location report should be "0,0,SOUTH"
- add or change commands to the file to have the robot make extra moves

## Project Breakdown
### Step 1
Add / configure rspec
Set up rough file structure
Check that spec file can read from code file and provide expected results
### Step 2
Consider the overall project structure
- A conductor to provide overall direction
- A file ingestor
- The Robot itself

Create the necessary files, and make the minimum test required to check the plumbing is connnected

### Step 3
Write test file and code for the Ingestor. Requirement is to be able to read a text file from the current directory, parse it for the instruction words provided in the readme, and output a list of `instructions` ready for the input to the Robot class

### Step 4
Come back to the robot.
After writing the ingestor, I feel the robot should be instantiated with the entire command sequence.
This will allow the robot to be entirely self contained, and allows easier extention for many robots

### Step 5
Revisit the Conductor, mainly to cater for the fact that now we instantiate a robot with it's entire instruction list.

## Step 6
Refactor, look at test contexts without tests, add running instructions



# Toy Robot

#### What is this ?

Toy Robot is a ruby coding exercise that we get our potential candidates  complete for us (Mable) to understand their capabilities.

#### What do I need to do ?

## Specification

### Description
- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.
- Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until a
  valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently
  facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but
  standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints
The toy robot must not fall off the table during movement. This also includes
the initial placement of the toy robot. Any move that would cause the robot
to fall must be ignored.

### Example Input and Output
a)
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output: `0,1,NORTH`

b)
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output: `0,0,WEST`

c)
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output: `3,3,NORTH`

#### Why am I doing this ?

At Mable we belive these kind of coding challenges will give us more visibility on the candidate's strengths. On the other have, candidates can show their
capabilities by applying what they already know.

#### What’s next ?

- clone this repo
- Do your changes
- Email us the link to your public git repo with the solution


#### What do We expect as deliveries?

While we love to see a working code, the most important aspects we are looking in to is,

- How you would approach a problem
- How you approach around testing
- Any other related documents (E.g README) that will help someone to set up and run this project.

#### What are the next steps ?

Once you completed the exercise and let us know, we'll go through your code and if we are happy with your code, we'll contact you for the next step, which is a
discussion on this code and your thinking / approach to this problem.

#### Toy robot is a very common coding test and I can find heaps of sample code ?

Yes, true, this is a very famous common test. However, we sincerely hope that you'll not just copy and paste a code from internet :).

In Fact the author of this test himself has described, why this test is still relevant, even though there are many examples out there

[Toy Robot Coding Puzzle](https://joneaves.wordpress.com/2014/07/21/toy-robot-coding-test/)

All the very best !!!
