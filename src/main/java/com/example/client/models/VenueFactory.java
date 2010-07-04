/**
 *
 */
package com.example.client.models;


import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

import de.saumya.gwt.session.client.models.UserFactory;

public class VenueFactory extends ResourceFactory<Venue> {

    private final UserFactory userFactory;

    public VenueFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public Venue newResource(final int id) {
        return new Venue(this.repository, this, this.userFactory, id);
    }

    @Override
    public String storageName() {
        return "venue";
    }

    @Override
    public String defaultSearchParameterName() {
        return null;
    }

}
