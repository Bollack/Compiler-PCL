/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scanner;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author erosh
 */
public class Scanner {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        File f1 = new File("src/lexer/Lexer.flex");
        String path = f1.getAbsolutePath();
        //filePath+="src/lexer/Lexer.flex";
        System.out.println(path);
        generateLexer(path);
    }
    
    public static void generateLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
    }
    
    class Token {
        String value;
        String type;
        Map<Integer, Integer> row = new TreeMap<Integer, Integer>();
        ArrayList<TreeMap> rowsArray = new ArrayList<TreeMap>();
        
        public Token() {
            // Constructor
        }
        
        
    }
    
    public Scanner(String result){
        
    }
    
}
