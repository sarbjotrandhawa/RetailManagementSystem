/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package vmm;

/**
 *
 * @author Hp
 */
public class BillDetails {
    public String productname;
    public int qty;
    public double price;
    public double tprice;
    public String barcode;
    public BillDetails(String barcode,String pn,int qty, double pr, double tpr)
    {
        this.barcode = barcode;
        productname = pn;
        this.qty = qty;
        price = pr;
        tprice = tpr;
    }
}
