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
    

    
}
