/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weighted;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author GKV
 */
public class WeightedGraph {

  public static class Edge {
        String source=null;
        int destination;
        int weight;

        public Edge(String source, int destination, int weight) {
            this.source = source;
            this.destination = destination;
            this.weight = weight;
        }
    }

   public  class WGraph {
        int vertices;
        
        LinkedList<Edge> [] adjacencylist;

        public WGraph(int vertices) {
            this.vertices = vertices;
            adjacencylist = new LinkedList[vertices];
            //initialize adjacency lists for all the vertices
            for (int i = 0; i <vertices ; i++) {
                adjacencylist[i] = new LinkedList<>();
            }
        }

        public void addEgde(String source, int destination, int weight) {
           
            Edge edge = new Edge(source, destination, weight);
            adjacencylist[source.length()].addFirst(edge); //for directed graph
        }

        public List<String> printGraph(){
           List<String> l=new ArrayList<String>();;
            for (int i = 0; i <vertices ; i++) {
                LinkedList<Edge> list = adjacencylist[i];
                for (int j = 0; j <list.size() ; j++) {
                    String data="vertex "+i+" is connected to " +list.get(j).destination + " with weight " +  list.get(j).weight;
                    l.add(data);
            
                }

            }
             return l;
        }
    }
     
}
