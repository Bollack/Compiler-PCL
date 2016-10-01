/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    Map<Integer, Integer> row;
    ArrayList<Map> rowsArray = new ArrayList<>();
    
    public objectToken(String inputValue, String inputType, Map inputRow) {
        this.value = inputValue;
        this.type = inputType;
        this.row = inputRow;
        this.rowsArray.add((Map) row);
    }
}