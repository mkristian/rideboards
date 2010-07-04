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

public class BoardConfig extends Resource<BoardConfig> {

    private final UserFactory userFactory;

    protected BoardConfig(final Repository repository, final BoardConfigFactory factory,
				final UserFactory userFactory, final int id) {
        super(repository, factory, id);
        this.userFactory = userFactory;
    }

    public int       boardId;
    public int       localeId;
    public String    mapUrl;
    public String    directionsUrl;
    public Timestamp createdAt;
    public Timestamp updatedAt;
    public User      createdBy;
    public User      updatedBy;

    @Override
    protected void appendXml(final StringBuilder buf) {
        appendXml(buf, "board_id", this.boardId);
        appendXml(buf, "locale_id", this.localeId);
        appendXml(buf, "map_url", this.mapUrl);
        appendXml(buf, "directions_url", this.directionsUrl);
        appendXml(buf, "created_at", this.createdAt);
        appendXml(buf, "updated_at", this.updatedAt);
        appendXml(buf, "created_by", this.createdBy);
        appendXml(buf, "updated_by", this.updatedBy);
    }

    @Override
    protected void fromElement(final Element root) {
        this.boardId = getInt(root, "board_id");
        this.localeId = getInt(root, "locale_id");
        this.mapUrl = getString(root, "map_url");
        this.directionsUrl = getString(root, "directions_url");
        this.createdAt = getTimestamp(root, "created_at");
        this.updatedAt = getTimestamp(root, "updated_at");
        this.createdBy = this.userFactory.getChildResource(root, "created_by");
        this.updatedBy = this.userFactory.getChildResource(root, "updated_by");
    }

    @Override
    public void toString(final String indent, final StringBuilder buf) {
        toString(indent, buf, "board_id", this.boardId);
        toString(indent, buf, "locale_id", this.localeId);
        toString(indent, buf, "map_url", this.mapUrl);
        toString(indent, buf, "directions_url", this.directionsUrl);
        toString(indent, buf, "created_at", this.createdAt);
        toString(indent, buf, "updated_at", this.updatedAt);
        toString(indent, buf, "created_by", this.createdBy);
        toString(indent, buf, "updated_by", this.updatedBy);
    }

    @Override
    public String display() {
        final StringBuilder builder = new StringBuilder("BoardConfig");
        builder.append("(").append(this.id).append(")");
        return builder.toString();
    }

}
