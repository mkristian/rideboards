/**
 *
 */
package com.example.client.models;


import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

import de.saumya.gwt.session.client.models.UserFactory;

public class ListingFactory extends ResourceFactory<Listing> {

    private final UserFactory userFactory;

    public ListingFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public Listing newResource(final int id) {
        return new Listing(this.repository, this, this.userFactory, id);
    }

    @Override
    public String storageName() {
        return "listing";
    }

    @Override
    public String defaultSearchParameterName() {
        return null;
    }

}
