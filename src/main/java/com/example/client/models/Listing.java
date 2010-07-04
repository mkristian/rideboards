/**
 *
 */
package com.example.client.models;

import java.sql.Date;
import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.session.client.models.User;
import de.saumya.gwt.session.client.models.UserFactory;

public class Listing extends Resource<Listing> {

    private final UserFactory userFactory;

    protected Listing(final Repository repository, final ListingFactory factory,
				final UserFactory userFactory, final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
    }

    public String    location;
    public String    email;
    public String    name;
    public Date      ridedate;
    public boolean   driver;
    public String    password;
    public Timestamp createdAt;
    public Timestamp updatedAt;
    public User      createdBy;
    public User      updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "location", this.location);
        appendXml(buf, "email", this.email);
        appendXml(buf, "name", this.name);
        appendXml(buf, "ridedate", this.ridedate);
        appendXml(buf, "driver", this.driver);
        appendXml(buf, "password", this.password);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "created_by", this.createdBy);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.location = getString(root, "location");
        this.email = getString(root, "email");
        this.name = getString(root, "name");
        this.ridedate = getDate(root, "ridedate");
        this.driver = getBoolean(root, "driver");
        this.password = getString(root, "password");
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
        this.createdBy = this.userFactory.getChildResource(root, "created_by");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "location", this.location);
        toString(indent, buf, "email", this.email);
        toString(indent, buf, "name", this.name);
        toString(indent, buf, "ridedate", this.ridedate);
        toString(indent, buf, "driver", this.driver);
        toString(indent, buf, "password", this.password);
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "created_by", this.createdBy);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder("Listing");
        builder.append("(").append(this.id).append(")");
        return builder.toString();
    }

}
