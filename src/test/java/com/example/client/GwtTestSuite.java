package com.example.client;

import com.example.client.models.BoardTestGwt;

import com.example.client.models.BoardConfigTestGwt;

import com.example.client.models.VenueConfigTestGwt;

import com.example.client.models.VenueTestGwt;

import junit.framework.Test;
import junit.framework.TestSuite;

import com.google.gwt.junit.tools.GWTTestSuite;

public class GwtTestSuite extends GWTTestSuite {

    public static Test suite() {
        final TestSuite suite = new TestSuite("Test for GWT Application");
        suite.addTestSuite(VenueTestGwt.class);
        suite.addTestSuite(VenueConfigTestGwt.class);
        suite.addTestSuite(BoardConfigTestGwt.class);
        suite.addTestSuite(BoardTestGwt.class);
        return suite;
    }
}
