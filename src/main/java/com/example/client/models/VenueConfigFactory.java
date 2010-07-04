/**
 *
 */
package com.example.client.models;


import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

import de.saumya.gwt.session.client.models.UserFactory;

public class VenueConfigFactory extends ResourceFactory<VenueConfig> {

    private final UserFactory userFactory;

    public VenueConfigFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public VenueConfig newResource(final int id) {
        return new VenueConfig(this.repository, this, this.userFactory, id);
    }

    @Override
    public String storageName() {
        return "venue_config";
    }

    @Override
    public String defaultSearchParameterName() {
        return null;
    }

}
