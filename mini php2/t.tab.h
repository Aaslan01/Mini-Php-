
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AND = 258,
     AS = 259,
     DO = 260,
     IF = 261,
     FOR = 262,
     BREAK = 263,
     CASE = 264,
     CONST = 265,
     echo = 266,
     ELSE = 267,
     WHILE = 268,
     THEN = 269,
     ELSEIF = 270,
     GLOBEL = 271,
     RETURN = 272,
     FUNCTION = 273,
     BR = 274,
     NUM = 275,
     ID = 276,
     NL = 277,
     SB = 278,
     EB = 279,
     EQ = 280,
     LOB = 281,
     MOB = 282,
     SOB = 283,
     SCB = 284,
     MCB = 285,
     LCB = 286,
     COMMA = 287,
     SEMICOLON = 288,
     STRING = 289,
     Concatination = 290,
     CHARS = 291,
     FunName = 292,
     MINUS = 293,
     PLUS = 294,
     MOD = 295,
     POWER = 296,
     DIVISON = 297,
     MULTIPLY = 298,
     NE = 299,
     EE = 300,
     GE = 301,
     LE = 302,
     GT = 303,
     LT = 304
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


