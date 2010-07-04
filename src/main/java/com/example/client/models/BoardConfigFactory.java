/**
 *
 */
package com.example.client.models;


import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

import de.saumya.gwt.session.client.models.UserFactory;

public class BoardConfigFactory extends ResourceFactory<BoardConfig> {

    private final UserFactory userFactory;

    public BoardConfigFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public BoardConfig newResource(final int id) {
        return new BoardConfig(this.repository, this, this.userFactory, id);
    }

    @Override
    public String storageName() {
        return "board_config";
    }

    @Override
    public String defaultSearchParameterName() {
        return null;
    }

}
