/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ABS
 */
public class Transaction {
    private int t_id;
    private Timestamp time;
    private String payer_id;
    private String payee_id;
    private String is_rollbacked;

    public int getT_id() {
        return t_id;
    }

    public String getIs_rollbacked() {
        return is_rollbacked;
    }

    public void setIs_rollbacked(String is_rollbacked) {
        this.is_rollbacked = is_rollbacked;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getPayer_id() {
        return payer_id;
    }

    public void setPayer_id(String payer_id) {
        this.payer_id = payer_id;
    }

    public String getPayee_id() {
        return payee_id;
    }

    public void setPayee_id(String payee_id) {
        this.payee_id = payee_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getTot_amt() {
        return tot_amt;
    }

    public void setTot_amt(int tot_amt) {
        this.tot_amt = tot_amt;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }
    private String type;
    private int tot_amt;
    private int order_id;
    private ArrayList<Item> items;    
}
