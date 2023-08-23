/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author PHUC
 */
public class Cart {
    private Map<String, Fruits> cart;

    public Cart() {
    }

    public Cart(Map<String, Fruits> cart) {
        this.cart = cart;
    }

    public Map<String, Fruits> getCart() {
        return cart;
    }

    public void setCart(Map<String, Fruits> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Fruits fruits) {
        
        boolean check =false;
        try{
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(id)){
            int currentQuantity = this.cart.get(id).getQuantity();
            fruits.setQuantity(currentQuantity+ fruits.getQuantity());
        }
          this.cart.put(id, fruits);
          check=true;
        }catch(Exception e){
        }
        return check;
    }

    public boolean remove(String id){
        boolean check =false;
        try{
            if(this.cart !=null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                    check= true;
                }
            }
        }catch(Exception e){
        }
        return check;
    }
    
    public boolean edit(String id, Fruits fruits){
        boolean check =false;
        try{
            if(this.cart !=null){
                if(this.cart.containsKey(id)){
                    this.cart.replace(id,fruits);
                    check= true;
                }
            }
        }catch(Exception e){
        }
        return check;
    }
    
    // new
    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }
    
    
    public void addCart(String fruitId, int quantity) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }//items are not existed
        //item are existed
        if(this.items.containsKey(fruitId)){
            quantity = this.items.get(fruitId) + quantity;
        }
        System.out.println(fruitId + " " + quantity);
        //update quantity in Map
        this.items.put(fruitId, quantity);
    }
    
    public void removeCart(String fruitId) {
        if(this.items==null) {
            return;
        }
        //item have existed
        if(this.items.containsKey(fruitId)) {
            this.items.remove(fruitId);
            if(this.items.isEmpty()) {
                this.items = null; //cancel cart
            }
        }
    }
}
