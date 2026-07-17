// 
// JDX (version: 05.18) reverse engineered class
// JDX is a product of Software Tree, LLC.
// 
// DBURL=jdbc:sap://<your-hana-host>:443?encrypt=true&validateCertificate=true, Database=HDB, Version: 4.00.000.00.1782206579
// Date: Fri Jul 17 15:09:52 IST 2026
// 
package com.poc.hana.model;

import org.json.JSONException;
import org.json.JSONObject;

import com.softwaretree.jdx.JDX_JSONObject;

public class Suppliers extends JDX_JSONObject {
    public  Products[]  listProducts;

    public Suppliers() {
        super();
    }

    public Suppliers(JSONObject jsonObject) throws JSONException {
        super(jsonObject);
    }
}
