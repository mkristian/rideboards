package com.example.client.models;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.session.client.AbstractUserResourceTestGwt;

abstract class AbstractApplicationResourceTestGwt<E extends Resource<E>>
        extends AbstractUserResourceTestGwt<E> {

    @Override
    public String getModuleName() {
        return "com.example.Application";
    }
}
