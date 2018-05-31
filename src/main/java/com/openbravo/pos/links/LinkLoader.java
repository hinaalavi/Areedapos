/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.openbravo.pos.links;

import com.openbravo.data.loader.LocalRes;
import com.openbravo.pos.forms.DataLogicSystem;
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
 * @author Hina
 */
public class LinkLoader extends DefaultHandler{
    
    private LinkIntegration browser;
    private static SAXParser m_sp = null;
    private boolean titleName = false;
    private boolean webLink = false;
    private String txtURL;
    private String name = null;
                 

    public LinkLoader(){       
    }
    
    public void loadBrowser(LinkIntegration brows, String txURL, DataLogicSystem dlSystem){
        browser = brows;
        txtURL = txURL;
        String script = dlSystem.getResourceAsXML("Link.Jamali");
        try {
            loadWebPage(new StringReader(script));
        } catch (TicketPrinterException ex) {
            Logger.getLogger(LinkLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
            
    
     public void loadWebPage(Reader in) throws TicketPrinterException  {
        
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
        webLink = false;
        
    }
    @Override
    public void endDocument() throws SAXException {
    }
    
    
    @Override
       public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{    
            if (qName.equalsIgnoreCase("titlename")) {
		titleName = true;
            }

            if (qName.equalsIgnoreCase("websitelink")) {
		webLink = true;
            }
	}

    @Override
	public void endElement(String uri, String localName,
		String qName) throws SAXException {
	}

    @Override
	public void characters(char ch[], int start, int length) throws SAXException {
            
		if (titleName) {
                    name = new String(ch, start, length);
                    titleName = false;
		}

		if (webLink) {
                    if(txtURL.equals(name)){
                        browser.loadURL(new String(ch, start, length));
                    }
                    webLink = false;

		}
	}

    
        
   

    
}

