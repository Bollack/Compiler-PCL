package Scanner;
import static Token.*;
%%
%class Lexer
%type Token
Letters = [a-zA-Z_]
Digits = [0-9]
WHITE=[ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"//".* {/*Ignore*/} 
"," {return COMMA;}
";" {return SEMICOLON;}
"++" {return PLUS_PLUS;}
"--" {return MINUS_MINUS;}
">=" {return GREATER_OR_EQUAL_THAN;}
">" {return GREATER_THAN;}
"<=" {return LESS_OR_EQUAL_THAN;}
">" {return LESS_THAN;}
"<>" {return LESS_GREATER;}
"=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return TIMES;}
"/" {return DIV;}
"("     ")" {return PARENT;}
"["     "]" {return COL;}
":=" {return COLON_ASSIGN;}
"." {return PERIOD;}
":" {return COLON;}
"+=" {return SUM_ASSIGN;}
"-=" {return MINUS_ASSIGN;}
"*=" {return TIMES_ASSIGN;}
"/=" {return DIV_ASSIGN;}
">>" {return LEFT;}
"<<" {return RIGHT;}
"<<=" {return RIGHT_ASSIGN;}
">>=" {return LEFT_ASSIGN;}
{Letters}({Letters}|{Digits})* {lexeme=yytext(); return ID;}
 ("(-"{Digits}+")")|{Digits}+ {lexeme=yytext(); return INT;}
. {return ERROR;}








