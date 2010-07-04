/**
 *
 */
package com.example.client.models;


import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;

import de.saumya.gwt.session.client.models.UserFactory;

public class BoardFactory extends ResourceFactory<Board> {

    private final UserFactory userFactory;

    public BoardFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
    }

    @Override
    public Board newResource(final int id) {
        return new Board(this.repository, this, this.userFactory, id);
    }

    @Override
    public String storageName() {
        return "board";
    }

    @Override
    public String defaultSearchParameterName() {
        return null;
    }

}
