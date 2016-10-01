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
"ARRAY" {lexeme=yytext(); line=yyline; return ARRAY;}
"BEGIN" {lexeme=yytext(); line=yyline; return BEGIN;}
"BOOLEAN" {lexeme=yytext(); line=yyline; return BOOLEAN;}
"BYTE" {lexeme=yytext(); line=yyline; return BYTE;}
"CASE" {lexeme=yytext(); line=yyline; return CASE;}
"CHAR" {lexeme=yytext(); line=yyline; return CHAR;}
"CONST" {lexeme=yytext(); line=yyline; return CONST;}
"DO" {lexeme=yytext(); line=yyline; return DO;}
"DOWNTO" {lexeme=yytext(); line=yyline; return DOWNTO;}
"ELSE" {lexeme=yytext(); line=yyline; return ELSE;}
"END" {lexeme=yytext(); line=yyline; return END;}
"FALSE" {lexeme=yytext(); line=yyline; return FALSE;}
"FILE" {lexeme=yytext(); line=yyline; return FILE;}
"FOR" {lexeme=yytext(); line=yyline; return FOR;}
"FORWARD" {lexeme=yytext(); line=yyline; return FORWARD;}
"FUNCTION" {lexeme=yytext(); line=yyline; return FUNCTION;}
"GOTO" {lexeme=yytext(); line=yyline; return GOTO;}
"IF" {lexeme=yytext(); line=yyline; return IF;}
"IN" {lexeme=yytext(); line=yyline; return IN;}
"INLINE" {lexeme=yytext(); line=yyline; return INLINE;}
"INT" {lexeme=yytext(); line=yyline; return INT;}
"LABEL" {lexeme=yytext(); line=yyline; return LABEL;}
"LONGINT" {lexeme=yytext(); line=yyline; return LONGINT;}
"NIL" {lexeme=yytext(); line=yyline; return NIL;}
"OF" {lexeme=yytext(); line=yyline; return OF;}
"PACKED" {lexeme=yytext(); line=yyline; return PACKED;}
"PROCEDURE" {lexeme=yytext(); line=yyline; return PROCEDURE;}
"PROGRAM" {lexeme=yytext(); line=yyline; return PROGRAM;}
"READ" {lexeme=yytext(); line=yyline; return READ;}
"REAL" {lexeme=yytext(); line=yyline; return REAL;}
"RECORD" {lexeme=yytext(); line=yyline; return RECORD;}
"REPEAT" {lexeme=yytext(); line=yyline; return REPEAT;}
"SET" {lexeme=yytext(); line=yyline; return SET;}
"SHORTINT" {lexeme=yytext(); line=yyline; return SHORTINT;}
"STRING" {lexeme=yytext(); line=yyline; return STRING;}
"THEN" {lexeme=yytext(); line=yyline; return THEN;}
"TO" {lexeme=yytext(); line=yyline; return TO;}
"TRUE" {lexeme=yytext(); line=yyline; return TRUE;}
"TYPE" {lexeme=yytext(); line=yyline; return TYPE;}
"UNTIL" {lexeme=yytext(); line=yyline; return UNTIL;}
"VAR" {lexeme=yytext(); line=yyline; return VAR;}
"WHILE" {lexeme=yytext(); line=yyline; return WHILE;}
"WITH" {lexeme=yytext(); line=yyline; return WITH;}
"WRITE" {lexeme=yytext(); line=yyline; return WRITE;}
"NOT" {lexeme=yytext(); line=yyline; return NOT;}
"OR" {lexeme=yytext(); line=yyline; return OR;}
"AND" {lexeme=yytext(); line=yyline; return AND;}
"XOR" {lexeme=yytext(); line=yyline; return XOR;}
"DIV" {lexeme=yytext(); line=yyline; return DIV;}
"MOD" {lexeme=yytext(); line=yyline; return MOD;}

{Letters}({Letters}|{Digits})* {lexeme=yytext(); line=yyline; return ID;}
("(-"{Digits}+")")|{Digits}+ {lexeme=yytext(); line=yyline; return INT;}
. {return ERROR;}








