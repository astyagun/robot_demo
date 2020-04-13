# Robot

## Description

Robot simulator script. It accepts a list of commands in a file and produces output if needed.

Available commands are:

* `PLACE`: accepts 3 comma separated arguments, `x` position, `y` position and `direction`, that the robot should be facing
* `LEFT` and `RIGHT`: change direction, that the robot is facing
* `MOVE`: moves the robot 1 unit forward in direction it's currently facing
* `REPORT`: prints current position

The table is rectangular 5 units wide. `x` and `y` are 0 based. `direction` can be one of `NORTH`, `EAST`, `SOUTH` and `WEST`. Any command, that would put the robot outside the table, is ignored. Any commands, that are executed before the first `PLACE` commands, are ignored as well.

## Usage

    $ robot commands.txt
    0,1,NORTH

### Example Input and Output

* Example 1

      PLACE 0,0,NORTH
      MOVE
      REPORT

  Output: `0,1,NORTH`

* Example 2

      PLACE 0,0,NORTH
      LEFT
      REPORT

  Output: `0,0,WEST`

* Example 3

      PLACE 1,2,EAST
      MOVE
      MOVE
      LEFT
      MOVE
      REPORT

  Output: `3,3,NORTH`

## Development

[Docker development environment](DOCKER.LOCAL.md)
