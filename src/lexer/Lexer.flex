package lexer;
import static scanner.Token.*;
import scanner.Token;


%%
%public
%class Lexer
%type Token
%line
%8bit
%caseless




%{
public String lexeme;
public Integer line;
%}


/*Macros y Comentarios */

FinalLinea = \r|\n|\r\n
CaracterValido = [^\r\n]
WhiteSpace     = {FinalLinea} | [ \t\f]

ComentarioTradicional   = "(*" [^*] ~"*)" | "(*" "*"+ ")" | "{" [^{] ~"}" 
ComentarioLinea     = "//" {CaracterValido}* {FinalLinea}?

Comment = {ComentarioTradicional} | {ComentarioLinea} 

Letters = [a-zA-Z_]
Digits = [0-9]
FLit1    = [-]?[Digits]+ \. [Digits]* 
FLit2    = \. [Digits]+ 
FLit3    = [-]?[Digits]+ 
Exponent = [eE] [+-]? [Digits]+
CaracterString = [^\"\\]
CaracterChar = [^\r\n\'\\]
Caracter = "#"[Digits][Digits][Digits]? 



%%


{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}


/* Separadores*/ 

"," {lexeme=yytext(); line=yyline; return COMMA;}
";" {lexeme=yytext(); line=yyline; return SEMICOLON;}
"("     ")" {lexeme=yytext(); line=yyline; return PARENT;}
"["     "]" {lexeme=yytext(); line=yyline; return COL;}

/* Operadores */ 

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
"/" {lexeme=yytext(); line=yyline; return DIV;}
":=" {lexeme=yytext(); line=yyline; return COLON_ASSIGN;}
"\." {lexeme=yytext(); line=yyline; return PERIOD;}
":" {lexeme=yytext(); line=yyline; return COLON;}
"+=" {lexeme=yytext(); line=yyline; return SUM_ASSIGN;}
"-=" {lexeme=yytext(); line=yyline; return MINUS_ASSIGN;}
"*=" {lexeme=yytext(); line=yyline; return TIMES_ASSIGN;}
"/=" {lexeme=yytext(); line=yyline; return DIV_ASSIGN;}
">>" {lexeme=yytext(); line=yyline; return LEFT;}
"<<" {lexeme=yytext(); line=yyline; return RIGHT;}
"<<=" {lexeme=yytext(); line=yyline; return RIGHT_ASSIGN;}
">>=" {lexeme=yytext(); line=yyline; return LEFT_ASSIGN;}

/* Palabras reservadas  */ 
"ARRAY"~{WhiteSpace} {lexeme=yytext(); line=yyline; return ARRAY;}
"BEGIN"~{WhiteSpace} {lexeme=yytext(); line=yyline; return BEGIN;}
"BOOLEAN"~{WhiteSpace} {lexeme=yytext(); line=yyline; return BOOLEAN;}
"BYTE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return BYTE;}
"CASE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return CASE;}
"CHAR"~{WhiteSpace} {lexeme=yytext(); line=yyline; return CHAR;}
"CONST"~{WhiteSpace} {lexeme=yytext(); line=yyline; return CONST;}
"DO"~{WhiteSpace} {lexeme=yytext(); line=yyline; return DO;}
"DOWNTO"~{WhiteSpace} {lexeme=yytext(); line=yyline; return DOWNTO;}
"ELSE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return ELSE;}
"END"~{WhiteSpace} {lexeme=yytext(); line=yyline; return END;}
"FALSE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return FALSE;}
"FILE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return FILE;}
"FOR"~{WhiteSpace} {lexeme=yytext(); line=yyline; return FOR;}
"FORWARD"~{WhiteSpace} {lexeme=yytext(); line=yyline; return FORWARD;}
"FUNCTION"~{WhiteSpace} {lexeme=yytext(); line=yyline; return FUNCTION;}
"GOTO"~{WhiteSpace} {lexeme=yytext(); line=yyline; return GOTO;}
"IF"~{WhiteSpace} {lexeme=yytext(); line=yyline; return IF;}
"IN"~{WhiteSpace} {lexeme=yytext(); line=yyline; return IN;}
"INLINE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return INLINE;}
"INT"~{WhiteSpace} {lexeme=yytext(); line=yyline; return INT;}
"LABEL"~{WhiteSpace} {lexeme=yytext(); line=yyline; return LABEL;}
"LONGINT"~{WhiteSpace} {lexeme=yytext(); line=yyline; return LONGINT;}
"NIL"~{WhiteSpace} {lexeme=yytext(); line=yyline; return NIL;}
"OF"~{WhiteSpace} {lexeme=yytext(); line=yyline; return OF;}
"PACKED"~{WhiteSpace} {lexeme=yytext(); line=yyline; return PACKED;}
"PROCEDURE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return PROCEDURE;}
"PROGRAM"~{WhiteSpace} {lexeme=yytext(); line=yyline; return PROGRAM;}
"READ"~{WhiteSpace} {lexeme=yytext(); line=yyline; return READ;}
"REAL"~{WhiteSpace} {lexeme=yytext(); line=yyline; return REAL;}
"RECORD"~{WhiteSpace} {lexeme=yytext(); line=yyline; return RECORD;}
"REPEAT"~{WhiteSpace} {lexeme=yytext(); line=yyline; return REPEAT;}
"SET"~{WhiteSpace} {lexeme=yytext(); line=yyline; return SET;}
"SHORTINT"~{WhiteSpace} {lexeme=yytext(); line=yyline; return SHORTINT;}
"STRING"~{WhiteSpace} {lexeme=yytext(); line=yyline; return STRING;}
"THEN"~{WhiteSpace} {lexeme=yytext(); line=yyline; return THEN;}
"TO"~{WhiteSpace} {lexeme=yytext(); line=yyline; return TO;}
"TRUE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return TRUE;}
"TYPE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return TYPE;}
"UNTIL"~{WhiteSpace} {lexeme=yytext(); line=yyline; return UNTIL;}
"VAR"~{WhiteSpace} {lexeme=yytext(); line=yyline; return VAR;}
"WHILE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return WHILE;}
"WITH"~{WhiteSpace} {lexeme=yytext(); line=yyline; return WITH;}
"WRITE"~{WhiteSpace} {lexeme=yytext(); line=yyline; return WRITE;}

/* Palabras reservadas para Operadores */ 
"NOT"~{WhiteSpace} {lexeme=yytext(); line=yyline; return NOT;}
"OR"~{WhiteSpace} {lexeme=yytext(); line=yyline; return OR;}
"AND"~{WhiteSpace} {lexeme=yytext(); line=yyline; return AND;}
"XOR"~{WhiteSpace} {lexeme=yytext(); line=yyline; return XOR;}
"DIV"~{WhiteSpace} {lexeme=yytext(); line=yyline; return DIV_WORD;}
"MOD"~{WhiteSpace} {lexeme=yytext(); line=yyline; return MOD;}



/*Identificadores */ 

{Letters}({Letters}|{Digits})*~{WhiteSpace} {lexeme=yytext(); line=yyline; if(yylength()<128){ return ID;}else{ return ERROR_ID;}}

/*Literales */ 

{Caracter} {lexeme=yytext(); line=yyline; return CHAR_MADE_INT_LITERAL;}
"'"{CaracterChar}"'" {lexeme=yytext(); line=yyline; return CHAR_LITERAL;}

"\""{CaracterString}*"\"" {lexeme=yytext(); line=yyline; return STRING_LITERAL;}

[-]?(Digits)+ {lexeme=yytext(); line=yyline; return INT_LITERAL;}
({FLit1}|{FLit2}|{FLit3}) {Exponent}? {lexeme=yytext(); line=yyline; return FLOAT_LITERAL;}

/* ERROR */
.+~{WhiteSpace} {lexeme=yytext(); line=yyline;return ERROR;}








