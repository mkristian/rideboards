/**
 *
 */
package com.example.client.views.listings;

import com.example.client.models.Board;
import com.example.client.models.BoardFactory;
import com.example.client.models.Listing;
import com.example.client.views.boards.LinkBinding;

import de.saumya.gwt.persistence.client.TimestampFactory;
import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.HyperlinkFactory;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.gui.client.bindings.CheckBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class ListingFields extends ResourceFields<Listing> {

    public ListingFields(final GetTextController getTextController,
            final ResourceBindings<Listing> bindings, final Session session,
            final BoardFactory factory, final HyperlinkFactory hyperlinkFactory) {
        super(getTextController, bindings);

        addHuge("board", new LinkBinding<Listing, Board>(session,
                factory,
                hyperlinkFactory) {

            @Override
            public void pullFrom(final Listing resource) {
                if (resource.board != null) {
                    pullFrom(resource.board);
                }
            }

        });

        add("ridedate", new TextBoxBinding<Listing>() {

            @Override
            public void pullFrom(final Listing resource) {
                setValue(resource.ridedate.toString());
            }

            @Override
            public void pushInto(final Listing resource) {
                resource.ridedate = new TimestampFactory(getText()).toDate();
            }
        }, true, 64);
        add("name", new TextBoxBinding<Listing>() {

            @Override
            public void pullFrom(final Listing resource) {
                setText(resource.name);
            }

            @Override
            public void pushInto(final Listing resource) {
                resource.name = getText();
            }
        }, true, 64);
        add("email", new TextBoxBinding<Listing>() {

            @Override
            public void pullFrom(final Listing resource) {
                setText(resource.email);
            }

            @Override
            public void pushInto(final Listing resource) {
                resource.email = getText();
            }
        }, true, 64);
        add("location", new TextBoxBinding<Listing>() {

            @Override
            public void pullFrom(final Listing resource) {
                setText(resource.location);
            }

            @Override
            public void pushInto(final Listing resource) {
                resource.location = getText();
            }
        }, true, 64);
        add("driver", new CheckBoxBinding<Listing>() {

            @Override
            public void pullFrom(final Listing resource) {
                setValue(resource.driver);
            }

            @Override
            public void pushInto(final Listing resource) {
                resource.driver = getValue();
            }
        });
    }
}
