/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

public class ListingFactory extends ResourceFactory<Listing> {

    BoardFactory boardFactory;

    public ListingFactory(final Repository repository,
            final ResourceNotifications notifications) {
        super(repository, notifications);
    }

    @Override
    public Listing newResource(final int id) {
        return new Listing(this.repository, this, id, this.boardFactory);
    }

    @Override
    public String storageName() {
        return "listing";
    }

    @Override
    public boolean isImmutable() {
        return true;
    }
}
