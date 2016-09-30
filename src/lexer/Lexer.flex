package Scanner;
import static Token.*;
%%
%class Lexer
%type Token
%line
Letters = [a-zA-Z_]
Digits = [0-9]
WHITE=[ \t\r\n]
%{
public String lexeme;
public Integer line;
%}
%%
{WHITE} {/*Ignore*/}
"//".* {/*Ignore*/} 
"," {lexeme=yytext(); line=yyline; return COMMA;}
";" {lexeme=yytext(); line=yyline; return SEMICOLON;}
"++" {lexeme=yytext(); line=yyline; return PLUS_PLUS;}
"--" {lexeme=yytext(); line=yyline; return MINUS_MINUS;}
">=" {lexeme=yytext(); line=yyline; return GREATER_OR_EQUAL_THAN;}
">" {lexeme=yytext(); line=yyline; return GREATER_THAN;}
"<=" {lexeme=yytext(); line=yyline; return LESS_OR_EQUAL_THAN;}
">" {lexeme=yytext(); line=yyline; return LESS_THAN;}
"<>" {lexeme=yytext(); line=yyline; return LESS_GREATER;}
"=" {lexeme=yytext(); line=yyline; return ASSIGN;}
"+" {lexeme=yytext(); line=yyline; return PLUS;}
"-" {lexeme=yytext(); line=yyline; return MINUS;}
"*" {lexeme=yytext(); line=yyline; return TIMES;}
"/" {lexeme=yytext(); line=yyline; return DIVISION;}
"("     ")" {lexeme=yytext(); line=yyline; return PARENT;}
"["     "]" {lexeme=yytext(); line=yyline; return COL;}
":=" {lexeme=yytext(); line=yyline; return COLON_ASSIGN;}
"." {lexeme=yytext(); line=yyline; return PERIOD;}
":" {lexeme=yytext(); line=yyline; return COLON;}
"+=" {lexeme=yytext(); line=yyline; return SUM_ASSIGN;}
"-=" {lexeme=yytext(); line=yyline; return MINUS_ASSIGN;}
"*=" {lexeme=yytext(); line=yyline; return TIMES_ASSIGN;}
"/=" {lexeme=yytext(); line=yyline; return DIV_ASSIGN;}
">>" {lexeme=yytext(); line=yyline; return LEFT;}
"<<" {lexeme=yytext(); line=yyline; return RIGHT;}
"<<=" {lexeme=yytext(); line=yyline; return RIGHT_ASSIGN;}
">>=" {lexeme=yytext(); line=yyline; return LEFT_ASSIGN;}
"NOT" {lexeme=yytext(); line=yyline; return NOT;}
"OR" {lexeme=yytext(); line=yyline; return OR;}
"AND" {lexeme=yytext(); line=yyline; return AND;}
"XOR" {lexeme=yytext(); line=yyline; return XOR;}
"DIV" {lexeme=yytext(); line=yyline; return DIV;}
"MOD" {lexeme=yytext(); line=yyline; return MOD;}
{Letters}({Letters}|{Digits})* {lexeme=yytext(); line=yyline; return ID;}
("(-"{Digits}+")")|{Digits}+ {lexeme=yytext(); line=yyline; return INT;}
. {return ERROR;}








