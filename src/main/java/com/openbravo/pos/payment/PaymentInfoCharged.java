/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.openbravo.pos.payment;

/**
 *
 * @author Rishad
 */
public class PaymentInfoCharged extends PaymentInfo{
    private double m_dTotal;
    private double m_dTendered;
    private String m_dCardName =null;
//    private double m_dTip;    
   
    /** Creates a new instance of PaymentInfoFree
     * @param dTotal */
    public PaymentInfoCharged(double dTotal) {
        m_dTotal = dTotal;
    }

    public PaymentInfo copyPayment(){
        return new PaymentInfoFree(m_dTotal);
    }    
    public String getTransactionID(){
        return "no ID";
    }
    public String getName() {
        return "charged";
    }   
    public double getTotal() {
        return m_dTotal;
    }
    public double getPaid() {
        return (0.0); 
    }

/**
 * 
    public double getTip() {
        return m_dTip;
    }
*/
    
    public double getChange(){
       return (0.00);
   }
    public double getTendered() {
       return m_dTendered;
   }
    public String getCardName() {
       return m_dCardName;
   } 

/**    
    public boolean getIsProcessed() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public void setIsProcessed(boolean value) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getReturnMessage() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
*/
    
    public String getVoucher() {
        return null;
    }    

    
}
