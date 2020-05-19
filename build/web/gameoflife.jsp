<%-- 
    Document   : gameoflife
    Created on : 19-May-2020, 13:07:43
    Author     : apolo234
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<% 
   Boolean[][] cells = new Boolean[24][24];
   
%>
<%@ page import = "java.util.Map" %>
<%@ page import = "java.util.ArrayList" %>
<% Map<String, String[]> parameters = request.getParameterMap();
class Cell {
            int number = 0;
            int numberOfAdjacent = 0;
            int status = 1;
            public Cell(int number) {
            this.number = number;
            }
        }
ArrayList<Cell> values = new ArrayList<Cell>();
for(String parameter : parameters.keySet()) {
        values.add(new Cell(Integer.parseInt(parameter)));  
}
for(Cell cell : values) {
    for (Cell cellular : values) {
        if (cell.number == cellular.number+24) {
            cell.numberOfAdjacent += 1;
            out.println("one 24 lower");
        }
        if (cell.number == cellular.number+25) {
            cell.numberOfAdjacent += 1;
            out.println("one 25 lower");
        }
        if (cell.number == cellular.number+23) {
            cell.numberOfAdjacent += 1;
            out.println("one 23 lower");
        }
        if (cell.number == cellular.number+1) {
            cell.numberOfAdjacent += 1;
            out.println("one 1 lower");
        }
        if (cell.number == cellular.number-24) {
            cell.numberOfAdjacent += 1;
            out.println("one 24 higher");
        }
        if (cell.number == cellular.number-25) {
            cell.numberOfAdjacent += 1;
            out.println("one 25 higher");        
        }
        if (cell.number == cellular.number-23) {
            cell.numberOfAdjacent += 1;
            out.println("one 23 higher");
        }
        if (cell.number == cellular.number-1) {
            cell.numberOfAdjacent += 1;
            out.println("one 1 higher");
        }
    }
    if (cell.numberOfAdjacent == 2 ||  cell.numberOfAdjacent == 3) {
        cell.status = 1;
        out.println(cell.number + " alive ");
    } else {
        cell.status = 0;
        out.println(cell.number + " dead");
    }
    out.println(" | ");
}
%>
<%
    if (request.getParameterMap().isEmpty()) {
    for (Boolean[] row: cells) {
        Arrays.fill(row, false);
    }
    } else {
       int counterHeight = 0;
       int counterWidth = 0;
       int counterCells = 0;
       int counter = 0;
       while (counterHeight < cells.length) {
        while (counterWidth < cells[counterHeight].length) {
            cells[counterHeight][counterWidth] = false;
            if (counterCells < values.size()) {
                if (counter == values.get(counterCells).number) {
                if (values.get(counterCells).status == 1) {
                  cells[counterHeight][counterWidth] = true;
                  out.println("" + counterHeight + " " + counterWidth + " es true");
                  counterCells++;
                } else {
                    counterCells++;
                }
            } 
          }
        int numberOfAdjacent = 0;
        for (Cell cellular : values) {
        if (counter == cellular.number+24) {
            numberOfAdjacent += 1;
            out.println("one 24 lower ");
        }
        if (counter == cellular.number+25) {
            numberOfAdjacent += 1;
            out.println("one 25 lower ");
        }
        if (counter == cellular.number+23) {
            numberOfAdjacent += 1;
            out.println("one 23 lower ");
        }
        if (counter == cellular.number+1) {
            numberOfAdjacent += 1;
            out.println("one 1 lower ");
        }
        if (counter == cellular.number-24) {
            numberOfAdjacent += 1;
            out.println("one 24 higher ");
        }
        if (counter == cellular.number-25) {
            numberOfAdjacent += 1;
            out.println("one 25 higher ");        
        }
        if (counter == cellular.number-23) {
            numberOfAdjacent += 1;
            out.println("one 23 higher ");
        }
        if (counter == cellular.number-1) {
            numberOfAdjacent += 1;
            out.println("one 1 higher ");
        }
        }
        if (numberOfAdjacent == 3) {
            cells[counterHeight][counterWidth] = true;
        }
        numberOfAdjacent = 0;
            counter++;
            counterWidth++;
        }
        counterHeight++;
        counterWidth = 0;
       }
    }
   int counterHeight = 0;
   int counterWidth = 0;
   int counter = 0;
   out.println("<p>Conway's Game of Life</p>\n<br>\n");
   out.println("<form action='gameoflife.jsp' method='POST'>\n");
   out.println("<input type='submit'></input><br>\n");
   while (counterHeight < cells.length) {
       while (counterWidth < cells[counterHeight].length) {
           if (cells[counterHeight][counterWidth] == true) {
           out.println("<input type='checkbox' name='"+ counter + "' checked></input>");
           } else {
           out.println("<input type='checkbox' name='"+ counter + "'></input>");
           }
           counterWidth++;
           counter++;
       }
       out.println("<br>\n");
       counterWidth = 0;
       counterHeight++;
   }
   out.println("</form>");
%>
