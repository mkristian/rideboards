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

public class VenueConfig extends Resource<VenueConfig> {

    private final UserFactory userFactory;

    protected VenueConfig(final Repository repository, final VenueConfigFactory factory,
				final UserFactory userFactory, final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
    }

    public int       localeId;
    public int       venueId;
    public String    dateFormat;
    public String    homeUrl;
    public String    scheduleUrl;
    public String    checklistUrl;
    public String    iframeUrl;
    public Timestamp createdAt;
    public Timestamp updatedAt;
    public User      createdBy;
    public User      updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "locale_id", this.localeId);
        appendXml(buf, "venue_id", this.venueId);
        appendXml(buf, "date_format", this.dateFormat);
        appendXml(buf, "home_url", this.homeUrl);
        appendXml(buf, "schedule_url", this.scheduleUrl);
        appendXml(buf, "checklist_url", this.checklistUrl);
        appendXml(buf, "iframe_url", this.iframeUrl);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "created_by", this.createdBy);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.localeId = getInt(root, "locale_id");
        this.venueId = getInt(root, "venue_id");
        this.dateFormat = getString(root, "date_format");
        this.homeUrl = getString(root, "home_url");
        this.scheduleUrl = getString(root, "schedule_url");
        this.checklistUrl = getString(root, "checklist_url");
        this.iframeUrl = getString(root, "iframe_url");
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
        this.createdBy = this.userFactory.getChildResource(root, "created_by");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "locale_id", this.localeId);
        toString(indent, buf, "venue_id", this.venueId);
        toString(indent, buf, "date_format", this.dateFormat);
        toString(indent, buf, "home_url", this.homeUrl);
        toString(indent, buf, "schedule_url", this.scheduleUrl);
        toString(indent, buf, "checklist_url", this.checklistUrl);
        toString(indent, buf, "iframe_url", this.iframeUrl);
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "created_by", this.createdBy);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder("VenueConfig");
        builder.append("(").append(this.id).append(")");
        return builder.toString();
    }

}
