# OCaml Assignment 2: Implementing WHILE Language Semantics


## Overview

This assignment, completed as part of the "Programming Languages" course (קורס שפות תכנות), involves the implementation of the semantics for a simplified version of the WHILE programming language using OCaml. The WHILE language consists of arithmetic expressions, boolean expressions, and commands, each of which can be represented by variants in OCaml.

## Files

- `ast.ml`: Contains the abstract syntax tree (AST) definitions for variables, arithmetic expressions, boolean expressions, and commands.
- `semantics.ml`: Provides the semantics implementation, essentially the functions that define how WHILE language constructs behave.

## Part A: Defining the Syntax

### 1. Variables
Defined the variant `Var` to represent a variable in the WHILE language.

### 2. Natural Numbers and State Functions
Introduced variants for natural numbers and a type for state functions, which map variables to integers.

### 3. Arithmetic and Boolean Expressions
Defined syntax for arithmetic (`a`) and boolean (`b`) expressions, including:
- `Num`, `Var`, `Add`, `Mult`, `Sub` for arithmetic operations.
- `TT`, `FF`, `Aeq`, `Beq`, `Leq`, `Neg`, `And` for boolean operations and comparisons.

### 4. Commands
Outlined the syntax for commands (`stm`), including assignment (`Ass`), no-operation (`Skip`), composition (`Comp`), conditional (`If`), and loops (`While`).

## Part B: Implementing the Semantics

### Initial State Function
Implemented the `default_state` function to map every variable to zero, establishing the initial state of a program.

### State Update Function
Created `create_state` to update the state given a variable and its new value, influenced by an arithmetic expression.

### Semantic Functions
Developed recursive functions `arithmetic_semantic`, `boolean_semantic`, and `nos` to interpret arithmetic expressions, boolean expressions, and commands, respectively, within a given state.

## Objective

The goal is to faithfully implement the semantics of the WHILE language as described, enabling the evaluation and execution of WHILE programs. This involves mapping variables to values, evaluating expressions, and executing commands according to the rules defined in the `semantics.ml` file.
