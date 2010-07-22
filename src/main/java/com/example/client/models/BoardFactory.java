/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.persistence.client.ResourceNotifications;
import de.saumya.gwt.session.client.models.UserFactory;

public class BoardFactory extends ResourceFactory<Board> {

    private final UserFactory    userFactory;

    private final ListingFactory listingFactory;

    public BoardFactory(final Repository repository,
            final ResourceNotifications notifications,
            final UserFactory userFactory, final ListingFactory listingFactory) {
        super(repository, notifications);
        this.userFactory = userFactory;
        this.listingFactory = listingFactory;
        listingFactory.boardFactory = this;
    }

    @Override
    public Board newResource(final int id) {
        return new Board(this.repository,
                this,
                this.userFactory,
                this.listingFactory,
                id);
    }

    @Override
    public String storageName() {
        return "board";
    }
}