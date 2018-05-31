/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.openbravo.pos.forms;

import com.openbravo.data.loader.LocalRes;
import com.openbravo.pos.printer.TicketPrinterException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Hina_Alavi
 */
public class LinkParser extends DefaultHandler{
    private static SAXParser m_sp = null;
    private boolean titleName = false;
    JPrincipalApp.ScriptGroup group;
              

    public LinkParser(JPrincipalApp.ScriptGroup grp){
        group = grp;        
    }
    
    public void createSideMenu(DataLogicSystem dlSystem){
        String script = dlSystem.getResourceAsXML("Link.Jamali");
        try {
            printSideMenu(new StringReader(script));
        } catch (TicketPrinterException ex) {
            Logger.getLogger(LinkParser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
            
    
     private void printSideMenu(Reader in) throws TicketPrinterException  {       
        try {
            if (m_sp == null) {
                SAXParserFactory spf = SAXParserFactory.newInstance();
                m_sp = spf.newSAXParser();
            }
            m_sp.parse(new InputSource(in), this);
                        
        } catch (ParserConfigurationException ePC) {
            throw new TicketPrinterException(LocalRes.getIntString("exception.parserconfig") , ePC);
        } catch (SAXException eSAX) {
            throw new TicketPrinterException(LocalRes.getIntString("exception.xmlfile") , eSAX);
        } catch (IOException eIO) {
            throw new TicketPrinterException(LocalRes.getIntString("exception.iofile") , eIO);
        }
     }
     @Override
    public void startDocument() throws SAXException {
        // inicalizo las variables pertinentes
        titleName = false;        
    }
    @Override
    public void endDocument() throws SAXException {
    }
    
    
    @Override
       public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{    
		if (qName.equalsIgnoreCase("titlename")) {
			titleName = true;
		}
	}

    @Override
	public void endElement(String uri, String localName,
		String qName) throws SAXException {
	}

    @Override
	public void characters(char ch[], int start, int length) throws SAXException {
		if (titleName) {   
                    group.addPanel("/com/openbravo/images/location.png", new String(ch, start, length), "com.openbravo.pos.links.LinkJPanel");
                }
			titleName = false;
	}
        

}

    
        
   

    


