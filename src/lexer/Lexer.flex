package lexer;
import static scanner.Token.*;
import scanner.Token;


%%
%public
%class Lexer
%type Token
%line
%8bit




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

Letters = [a-zA-Z]
Digits = [0-9]
FLit1    = [-]?{Digits}+ \. {Digits}* 
FLit2    = \. {Digits}+ 
FLit3    = [-]?{Digits}+ 
Exponent = [eE] [+-]? {Digits}+
CaracterString = [^\"\\]
CaracterChar = [^\r\n\'\\]
Caracter = "#"{Digits}{Digits} | "#"{Digits} | "#"{Digits}{Digits}{Digits}
Operadores = "," |";"| "++"| "--" |">=" |">" |"<="| "<" |"<>" |"=" |"+"| "-"| "*"| "/"|"("| ")" |"[" |"]"| ":=" |"."| ":"| "+=" |"-=" |"*="| "/="| ">>" |"<<"| "<<="|">>="
CaracteresValidosIdentificadores = {Operadores}|{Digits}|{Letters}|{WhiteSpace}
CaracteresNoValidosIdentificadores = "\"" |"$" | "%" |"&" |"'" |"\\" |"!" 
|"?" |"¡" |"¿" |"^"|"~"|"_"


%%


{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}


/* Separadores*/ 

"," {lexeme=yytext(); line=yyline; return COMMA;}
";" {lexeme=yytext(); line=yyline; return SEMICOLON;}
"("|")" {lexeme=yytext(); line=yyline; return PARENT;}
"["|"]" {lexeme=yytext(); line=yyline; return COL;}

/* Operadores */ 

"++" {lexeme=yytext(); line=yyline; return PLUS_PLUS;}
"--" {lexeme=yytext(); line=yyline; return MINUS_MINUS;}
">=" {lexeme=yytext(); line=yyline; return GREATER_OR_EQUAL_THAN;}
">" {lexeme=yytext(); line=yyline; return GREATER_THAN;}
"<=" {lexeme=yytext(); line=yyline; return LESS_OR_EQUAL_THAN;}
"<" {lexeme=yytext(); line=yyline; return LESS_THAN;}
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
"ARRAY" {lexeme=yytext(); line=yyline; return ARRAY;}
"BEGIN"  {lexeme=yytext(); line=yyline; return BEGIN;}
"BOOLEAN"  {lexeme=yytext(); line=yyline; return BOOLEAN;}
"BYTE"  {lexeme=yytext(); line=yyline; return BYTE;}
"CASE"  {lexeme=yytext(); line=yyline; return CASE;}
"CHAR"  {lexeme=yytext(); line=yyline; return CHAR;}
"CONST"  {lexeme=yytext(); line=yyline; return CONST;}
"DO"  {lexeme=yytext(); line=yyline; return DO;}
"DOWNTO"  {lexeme=yytext(); line=yyline; return DOWNTO;}
"ELSE"  {lexeme=yytext(); line=yyline; return ELSE;}
"END"  {lexeme=yytext(); line=yyline; return END;}
"FALSE"  {lexeme=yytext(); line=yyline; return FALSE;}
"FILE"  {lexeme=yytext(); line=yyline; return FILE;}
"FOR"  {lexeme=yytext(); line=yyline; return FOR;}
"FORWARD"  {lexeme=yytext(); line=yyline; return FORWARD;}
"FUNCTION"  {lexeme=yytext(); line=yyline; return FUNCTION;}
"GOTO"  {lexeme=yytext(); line=yyline; return GOTO;}
"IF"  {lexeme=yytext(); line=yyline; return IF;}
"IN"  {lexeme=yytext(); line=yyline; return IN;}
"INLINE"  {lexeme=yytext(); line=yyline; return INLINE;}
"INT"  {lexeme=yytext(); line=yyline; return INT;}
"LABEL"  {lexeme=yytext(); line=yyline; return LABEL;}
"LONGINT"  {lexeme=yytext(); line=yyline; return LONGINT;}
"NIL"  {lexeme=yytext(); line=yyline; return NIL;}
"OF"  {lexeme=yytext(); line=yyline; return OF;}
"PACKED"  {lexeme=yytext(); line=yyline; return PACKED;}
"PROCEDURE"  {lexeme=yytext(); line=yyline; return PROCEDURE;}
"PROGRAM"  {lexeme=yytext(); line=yyline; return PROGRAM;}
"READ"  {lexeme=yytext(); line=yyline; return READ;}
"REAL"  {lexeme=yytext(); line=yyline; return REAL;}
"RECORD"  {lexeme=yytext(); line=yyline; return RECORD;}
"REPEAT"  {lexeme=yytext(); line=yyline; return REPEAT;}
"SET"  {lexeme=yytext(); line=yyline; return SET;}
"SHORTINT"  {lexeme=yytext(); line=yyline; return SHORTINT;}
"STRING"  {lexeme=yytext(); line=yyline; return STRING;}
"THEN"  {lexeme=yytext(); line=yyline; return THEN;}
"TO"  {lexeme=yytext(); line=yyline; return TO;}
"TRUE"  {lexeme=yytext(); line=yyline; return TRUE;}
"TYPE"  {lexeme=yytext(); line=yyline; return TYPE;}
"UNTIL"  {lexeme=yytext(); line=yyline; return UNTIL;}
"VAR"  {lexeme=yytext(); line=yyline; return VAR;}
"WHILE"  {lexeme=yytext(); line=yyline; return WHILE;}
"WITH"  {lexeme=yytext(); line=yyline; return WITH;}
"WRITE"  {lexeme=yytext(); line=yyline; return WRITE;}

/* Palabras reservadas para Operadores */ 
"NOT"  {lexeme=yytext(); line=yyline; return NOT;}
"OR"  {lexeme=yytext(); line=yyline; return OR;}
"AND"  {lexeme=yytext(); line=yyline; return AND;}
"XOR"  {lexeme=yytext(); line=yyline; return XOR;}
"DIV"  {lexeme=yytext(); line=yyline; return DIV_WORD;}
"MOD"  {lexeme=yytext(); line=yyline; return MOD;}



/*Identificadores */ 

{Letters}({Letters}|{Digits})* {lexeme=yytext(); line=yyline; if(yylength()<128){ return ID;}else{ return ERROR_ID;}}

/*Literales */ 

{Caracter} {lexeme=yytext(); line=yyline; return CHAR_MADE_INT_LITERAL;}
"'"{CaracterChar}"'" {lexeme=yytext(); line=yyline; return CHAR_LITERAL;}

"\""{CaracterString}*"\"" {lexeme=yytext(); line=yyline; return STRING_LITERAL;}

[-]?{Digits}+ {lexeme=yytext(); line=yyline; return INT_LITERAL;}
({FLit1}|{FLit2}|{FLit3}) {Exponent}? {lexeme=yytext(); line=yyline; return FLOAT_LITERAL;}

/* ERROR */
. {lexeme=yytext(); line=yyline;return ERROR;}
{Letters}({Letters}|{Digits})*{CaracteresNoValidosIdentificadores}+({Letters}|{Digits})* {lexeme=yytext(); line=yyline;return ERROR;}  //Error identificador





