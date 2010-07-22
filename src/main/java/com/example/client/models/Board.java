/**
 *
 */
package com.example.client.models;

import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceCollection;
import de.saumya.gwt.session.client.models.User;
import de.saumya.gwt.session.client.models.UserFactory;

public class Board extends Resource<Board> {

    private final UserFactory    userFactory;
    private final ListingFactory listingFactory;

    protected Board(final Repository repository, final BoardFactory factory,
            final UserFactory userFactory, final ListingFactory listingFactory,
            final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
        this.listingFactory = listingFactory;
    }

    public String                      name;
    public String                      fullname;
    public int                         position;
    public boolean                     enabled;
    public ResourceCollection<Listing> listings;
    public Timestamp                   createdAt;
    public Timestamp                   updatedAt;
    public User                        createdBy;
    public User                        updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "name", this.name);
        appendXml(buf, "fullname", this.fullname);
        appendXml(buf, "position", this.position);
        appendXml(buf, "enabled", this.enabled);
        appendXml(buf, "listings", this.listings);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "created_by", this.createdBy);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.name = getString(root, "name");
        this.fullname = getString(root, "fullname");
        this.position = getInt(root, "position");
        this.enabled = getBoolean(root, "enabled");
        this.listings = this.listingFactory.getChildResourceCollection(root,
                                                                       "listings",
                                                                       this.listings);
        for (final Listing l : this.listings) {
            l.board = this;
        }
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
        this.createdBy = this.userFactory.getChildResource(root, "created_by");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "name", this.name);
        toString(indent, buf, "fullname", this.fullname);
        toString(indent, buf, "position", this.position);
        toString(indent, buf, "enabled", this.enabled);
        toString(indent, buf, "listings", this.listings);
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "created_by", this.createdBy);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder(this.fullname);
        builder.append(" (").append(this.name).append(")");
        builder.append(this.enabled ? " - - enabled - -" : " - - disabled - -")
                .append(" listings[")
                .append(this.listings.size())
                .append("]");
        return builder.toString();
    }

}
