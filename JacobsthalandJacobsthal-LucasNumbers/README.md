# Jacobsthal and Jacobsthal-Lucas numbers
The Jacobsthal sequence is an additive sequence similar to the Fibonacci sequence, defined by the recurrence relation Jn = Jn-1 + 2Jn-2, with initial terms J0 = 0 and J1 = 1. A number in the sequence is called a Jacobsthal number. They are a specific type of Lucas sequence Un(P, Q) for which P = 1 and Q = -2.
The first Jacobsthal numbers are:
0, 1, 1, 3, 5, 11, 21, 43, 85, 171, 341, 683, 1365, 2731, 5461, 10923, 21845, 43691, ……


Jacobsthal-Lucas numbers
Jacobsthal-Lucas numbers represent the complementary Lucas sequence Vn(1, -2). 


Given a positive integer n. The task is to find nth Jacobsthal and Jacobsthal-Lucas numbers.

Examples :

Input : n = 5
Output :
Jacobsthal number: 11
Jacobsthal-Lucas number: 31

Input : n = 4
Output :
Jacobsthal number: 5
Jacobsthal-Lucas number: 17
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to find the nth Jacobsthal and Jacobsthal-Lucas numbers. n is up to 14.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/JacobsthalandJacobsthal-LucasNumbers.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd JacobsthalandJacobsthal-LucasNumbers
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 9, then y = 5:

    ```sh
    $ vsim work.tb
    ```
