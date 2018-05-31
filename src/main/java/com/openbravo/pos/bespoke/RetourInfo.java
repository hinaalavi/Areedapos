/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.openbravo.pos.bespoke;

import com.openbravo.basic.BasicException;
import com.openbravo.data.loader.DataRead;
import com.openbravo.data.loader.IKeyed;
import com.openbravo.data.loader.SerializableRead;
import com.openbravo.data.loader.SerializerRead;

/**
 *
 * @author aurelien escartin
 *
 */
public class RetourInfo implements SerializableRead, IKeyed {

    private static final long serialVersionUID = 8906929819402L;
    private Integer idret;

    public RetourInfo() {
        idret = null;
    }

    public Object getKey() {
        return idret;
    }

    public void readValues(DataRead dr) throws BasicException {
        idret = dr.getInt(1);
    }

    public void setId(Integer id) {
        idret = id;
    }

    public Integer getId() {
        return idret;
    }

    public static SerializerRead getSerializerRead() {
        return new SerializerRead() {
            public Object readValues(DataRead dr) throws BasicException {
                return new RetourInfo(
                        dr.getInt(1));
            }
        };
    }

    public RetourInfo(Integer id) {
        this.idret = id;
    }

}
