package scanner;


import java.util.ArrayList;

import static scanner.Token.*;

public class TokensTypes {
    

    public static ArrayList<Token> operators = new ArrayList();
    public static ArrayList<Token> reservedWords = new ArrayList();
    
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
        operators.add(SUM_ASSIGN); 
        operators.add(MINUS_ASSIGN); 
        operators.add(TIMES_ASSIGN); 
        operators.add(DIV_ASSIGN); 
        operators.add(LEFT); 
        operators.add(RIGHT); 
        operators.add(RIGHT_ASSIGN); 
        operators.add(LEFT_ASSIGN); 
    }
    
    private static void initializeReservedWords(){
        
    }
    
    public static void initialize(){  
        initializeOperators();
        initializeReservedWords();
    }
    
    
    
    /*Devuelve:
        1 = operador
        2 = palabra reservada
        3 = identificador
        4 = literal
    */    
    public int whichTypeIsIt(Token tokenActual){
        if (tokenActual == ID ){
            return 3;
        }else if(operators.contains(tokenActual)){
            return 1;
        }else if(reservedWords.contains(tokenActual)){
            return 2;
        }
        return 0; 
    }

}
