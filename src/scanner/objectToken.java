
package scanner;

import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author erosh
 */
public class objectToken {
    String value;
    Token type;
    TreeMap<Integer, Integer> row; //#Linea key, AparicionesXLinea Value
    ArrayList<TreeMap> rowsArray = new ArrayList<>();  //Conjunto de apariciones por línea 
    
    public objectToken(String inputValue, Token inputType, TreeMap inputRow) {
        this.value = inputValue;
        this.type = inputType;
        this.row = inputRow;
        this.rowsArray.add((TreeMap) row);
    }
}