package scanner;


import java.util.ArrayList;

import static scanner.Token.*;

public class TokensTypes {
    

    private static ArrayList<Token> operators = new ArrayList();
    private static ArrayList<Token> reservedWords = new ArrayList();
    private static ArrayList<Token> literals = new ArrayList();
    private static ArrayList<Token> separatos = new ArrayList();
         
    //Se asignan los tokens a cada lista/categoria
    private static void initializeOperators(){
        operators.add(PLUS_PLUS); 
        operators.add(MINUS_MINUS); 
        operators.add(GREATER_OR_EQUAL_THAN); 
        operators.add(GREATER_THAN); 
        operators.add(LESS_OR_EQUAL_THAN); 
        operators.add(LESS_THAN); 
        operators.add(LESS_GREATER); 
        operators.add(ASSIGN); 
        operators.add(PLUS); 
        operators.add(MINUS); 
        operators.add(TIMES); 
        operators.add(DIV);
        operators.add(COLON_ASSIGN); 
        operators.add(PERIOD); 
        operators.add(COLON);
        operators.add(SUM_ASSIGN); 
        operators.add(MINUS_ASSIGN); 
        operators.add(TIMES_ASSIGN); 
        operators.add(DIV_ASSIGN); 
        operators.add(LEFT); 
        operators.add(RIGHT); 
        operators.add(RIGHT_ASSIGN); 
        operators.add(LEFT_ASSIGN); 
        
        operators.add(NOT);
        operators.add(OR);
        operators.add(AND);
        operators.add(XOR);
        operators.add(DIV_WORD);
        operators.add(MOD);
        
    }
    private static void initializeReservedWords(){
        reservedWords.add(ARRAY); 
        reservedWords.add(BEGIN); 
        reservedWords.add(BOOLEAN); 
        reservedWords.add(BYTE); 
        reservedWords.add(CASE);
        reservedWords.add(CHAR);
        reservedWords.add(CONST); 
        reservedWords.add(DO); 
        reservedWords.add(DOWNTO); 
        reservedWords.add(ELSE); 
        reservedWords.add(END); 
        reservedWords.add(FALSE);
        reservedWords.add(FILE); 
        reservedWords.add(FOR); 
        reservedWords.add(FORWARD); 
        reservedWords.add(FUNCTION); 
        reservedWords.add(GOTO); 
        reservedWords.add(IF);
        reservedWords.add(IN); 
        reservedWords.add(INLINE); 
        reservedWords.add(INT); 
        reservedWords.add(LABEL); 
        reservedWords.add(LONGINT); 
        reservedWords.add(MOD);
        reservedWords.add(NIL);
        reservedWords.add(OF); 
        reservedWords.add(PACKED); 
        reservedWords.add(PROCEDURE); 
        reservedWords.add(PROGRAM); 
        reservedWords.add(READ); 
        reservedWords.add(REAL);
        reservedWords.add(RECORD); 
        reservedWords.add(REPEAT); 
        reservedWords.add(SET); 
        reservedWords.add(SHORTINT); 
        reservedWords.add(STRING); 
        reservedWords.add(THEN);
        reservedWords.add(TO); 
        reservedWords.add(TRUE); 
        reservedWords.add(TYPE); 
        reservedWords.add(UNTIL); 
        reservedWords.add(VAR);
        reservedWords.add(WHILE); 
        reservedWords.add(WITH); 
        reservedWords.add(WRITE); 
    }
    private static void initializeLiterals(){
        literals.add(STRING_LITERAL);
        literals.add(CHAR_LITERAL);
        literals.add(FLOAT_LITERAL);
        literals.add(INT_LITERAL);  
        literals.add(CHAR_MADE_INT_LITERAL); 
    }
    private static void initializeSeparatos(){
        separatos.add(COMMA);
        separatos.add(SEMICOLON);
        separatos.add(PARENT);
        separatos.add(COL);  

    }
    
    public static void initialize(){  
        initializeOperators();
        initializeReservedWords();
        initializeLiterals();
        initializeSeparatos();
    }
    
    
    
        
    public static int whichTypeIsIt(Token tokenActual){
    /*Devuelve:
        1 = operador
        2 = palabra reservada
        3 = identificador
        4 = literal
        5 = Separador
        31 = Error ID (Largo)
        0 = Error
    */
        if (tokenActual == ID){
            return 3;
        }else if(operators.contains(tokenActual)){
            return 1;
        }else if(reservedWords.contains(tokenActual)){
            return 2;
        }else if(literals.contains(tokenActual)){
            return 4;
        }else if(separatos.contains(tokenActual)){
            return 5;
        }else if(tokenActual == ERROR_ID){
            return 31;
        }else{
        return 0;
        }
    }

    
    public static String whichTypeStringIsIt(Token tokenActual){
    /*Devuelve el string que identifica el tipo de token que es
    */
        if (tokenActual == ID){
            return "Identificador";
        }else if(operators.contains(tokenActual)){
            return "Operador";
        }else if(reservedWords.contains(tokenActual)){
            return "Palabra reservada";
        }else if(literals.contains(tokenActual)){
            return "Literal";
        }else if(separatos.contains(tokenActual)){
            return "Separador";
        }else{
        return "NULL"; //Nunca debería devolver esto
        }
    }
    
    
    /*No se utiliza en el scanner*/
    public static String itoa(String hilera){
        //Int to char  
        String charMadeIntString=hilera.substring(1,hilera.length()-1); //Se quita el #
        int codigoAscii = Integer.parseInt(charMadeIntString);
        char ch = (char) codigoAscii;
        return Character.toString(ch);
    }
}
