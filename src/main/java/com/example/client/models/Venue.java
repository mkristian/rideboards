/**
 *
 */
package com.example.client.models;

import java.sql.Timestamp;

import com.google.gwt.xml.client.Element;

import de.saumya.gwt.persistence.client.Repository;
import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.session.client.models.User;
import de.saumya.gwt.session.client.models.UserFactory;

public class Venue extends Resource<Venue> {

    private final UserFactory userFactory;

    protected Venue(final Repository repository, final VenueFactory factory,
				final UserFactory userFactory, final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
    }

    public String    fullname;
    public String    email;
    public String    password;
    public boolean   bcc;
    public boolean   enabled;
    public Timestamp createdAt;
    public Timestamp updatedAt;
    public User      createdBy;
    public User      updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "fullname", this.fullname);
        appendXml(buf, "email", this.email);
        appendXml(buf, "password", this.password);
        appendXml(buf, "bcc", this.bcc);
        appendXml(buf, "enabled", this.enabled);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "created_by", this.createdBy);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.fullname = getString(root, "fullname");
        this.email = getString(root, "email");
        this.password = getString(root, "password");
        this.bcc = getBoolean(root, "bcc");
        this.enabled = getBoolean(root, "enabled");
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
        this.createdBy = this.userFactory.getChildResource(root, "created_by");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "fullname", this.fullname);
        toString(indent, buf, "email", this.email);
        toString(indent, buf, "password", this.password);
        toString(indent, buf, "bcc", this.bcc);
        toString(indent, buf, "enabled", this.enabled);
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "created_by", this.createdBy);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder("Venue");
        builder.append("(").append(this.id).append(")");
        return builder.toString();
    }

}
