/**
 *
 */
package com.example.client.models;

import java.sql.Date;
import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.Resource;

public class Listing extends Resource<Listing> {

    private final BoardFactory boardFactory;

    protected Listing(final Repository repository,
            final ListingFactory factory, final int id,
            final BoardFactory boardFactory) {
        super(repository, factory, id);
        this.boardFactory = boardFactory;
    }

    public String    location;
    public String    email;
    public String    name;
    public Date      ridedate;
    public boolean   driver;
    public Board     board;
    public Timestamp createdAt;
    public Timestamp updatedAt;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "location", this.location);
        appendXml(buf, "email", this.email);
        appendXml(buf, "name", this.name);
        appendXml(buf, "ridedate", this.ridedate);
        appendXml(buf, "driver", this.driver);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
    }

    @Override
    protected void fromElement(final Element root) {
        this.location = getString(root, "location");
        this.email = getString(root, "email");
        this.name = getString(root, "name");
        this.ridedate = getDate(root, "ridedate");
        this.driver = getBoolean(root, "driver");
        this.board = this.boardFactory.getChildResource(root, "board");
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "location", this.location);
        toString(indent, buf, "email", this.email);
        toString(indent, buf, "name", this.name);
        toString(indent, buf, "ridedate", this.ridedate);
        toString(indent, buf, "driver", this.driver);
        if (this.board != null) {
            toString(indent, buf, "board.name", this.board.name);
        }
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder(this.ridedate.toString());
        builder.append(": ")
                .append(this.name)
                .append(" <")
                .append(this.email)
                .append("> - - ")
                .append(this.board.fullname);
        return builder.toString();
    }

}
