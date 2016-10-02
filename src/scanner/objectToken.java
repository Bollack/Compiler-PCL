
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
    String type;
    TreeMap<Integer, Integer> row; //#Linea key, AparicionesXLinea Value
    ArrayList<TreeMap> rowsArray = new ArrayList<>(); 
    
    public objectToken(String inputValue, String inputType, TreeMap inputRow) {
        this.value = inputValue;
        this.type = inputType;
        this.row = inputRow;
        this.rowsArray.add((TreeMap) row);
    }
}