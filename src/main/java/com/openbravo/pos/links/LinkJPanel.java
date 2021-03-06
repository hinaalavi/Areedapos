/*
 * Integrating Jmaali and Areed apos application
 */
package com.openbravo.pos.links;

import com.openbravo.basic.BasicException;
import com.openbravo.data.loader.Session;
import com.openbravo.pos.forms.AppProperties;
import com.openbravo.pos.forms.AppView;
import com.openbravo.pos.forms.AppViewConnection;
import com.openbravo.pos.forms.DataLogicSystem;
import com.openbravo.pos.forms.JPanelView;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JComponent;


/**
 *
 * @author Hina
 */
public class LinkJPanel extends javax.swing.JPanel implements JPanelView{
   
    private Session s;
    private Connection con;
    protected DataLogicSystem dlSystem;
    private String linkTitle;
    private AppView app_view;
    private final AppProperties app_props;

    /**
     * Creates new form LinkJPanel
     * @param oApp
     */
    public LinkJPanel(AppView oApp) {
        this(oApp.getProperties());
        app_view = oApp;
        dlSystem = (DataLogicSystem) oApp.getBean("com.openbravo.pos.forms.DataLogicSystem");

    }
     @SuppressWarnings("empty-statement")
    public LinkJPanel(AppProperties props) {
        app_props = props;
        initComponents();
        try {
            s = AppViewConnection.createSession(props);
            con = s.getConnection();
        } catch (BasicException | SQLException e) {;
        }        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();

        setLayout(new java.awt.BorderLayout());

        jPanel1.setLayout(new java.awt.BorderLayout());
        add(jPanel1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables

    @Override
    public String getTitle() {
        return linkTitle;
    }

    @Override
    public void activate() throws BasicException {
         linkTitle = app_view.getAppUserView().getLinkTitle();
         LinkIntegration browser = new LinkIntegration();
         browser.loadFile(jPanel1, dlSystem,linkTitle);
         jPanel1.setVisible(true);       
    }
    @Override
    public boolean deactivate() {
        System.out.println("JPAnelLink++++++++++++++++= deactivate");
        jPanel1.remove(0);
        this.getComponent().setEnabled(false);
        
        return true;   
    }

    @Override
    public JComponent getComponent() {        
        return this; //To change body of generated methods, choose Tools | Templates.
    }
}
