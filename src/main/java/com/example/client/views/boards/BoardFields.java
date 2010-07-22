/**
 *
 */
package com.example.client.views.boards;

import com.example.client.models.Board;
import com.example.client.models.Listing;
import com.example.client.models.ListingFactory;

import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.HyperlinkFactory;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionListing;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings.Binding;
import de.saumya.gwt.translation.gui.client.bindings.CheckBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class BoardFields extends ResourceFields<Board> {

    public BoardFields(final GetTextController getTextController,
            final ResourceBindings<Board> bindings,
            final ListingFactory factory, final Session session,
            final HyperlinkFactory hyperlinkFactory) {
        super(getTextController, bindings);
        add("name", new TextBoxBinding<Board>() {

            @Override
            public void pullFrom(final Board resource) {
                setText(resource.name);
            }

            @Override
            public void pushInto(final Board resource) {
                resource.name = getText();
            }
        }, true, 64);
        add("fullname", new TextBoxBinding<Board>() {

            @Override
            public void pullFrom(final Board resource) {
                setText(resource.fullname);
            }

            @Override
            public void pushInto(final Board resource) {
                resource.fullname = getText();
            }
        }, true, 64);
        add("position", new IntegerTextBoxBinding<Board>() {

            @Override
            public void pullFrom(final Board resource) {
                setText(resource.position);
            }

            @Override
            public void pushInto(final Board resource) {
                resource.position = getTextAsInt();
            }
        }, 0, 123456);
        addSmall("enabled", new CheckBoxBinding<Board>() {

            @Override
            public void pullFrom(final Board resource) {
                setValue(resource.enabled);
            }

            @Override
            public void pushInto(final Board resource) {
                resource.enabled = getValue();
            }
        });

        addBig("listings", new ListingWidget(session,
                factory,
                getTextController,
                hyperlinkFactory));
    }

    static class ListingWidget extends ResourceCollectionListing<Listing>
            implements Binding<Board> {

        public ListingWidget(final Session session,
                final ListingFactory factory,
                final GetTextController getTextController,
                final HyperlinkFactory hyperlinkFactory) {
            super(session, factory, getTextController, hyperlinkFactory);
            setPathFactory(hyperlinkFactory.newPathFactory(factory.storagePluralName()));
        }

        @Override
        public void pullFrom(final Board resource) {
            reset(resource.listings);
        }

        @Override
        public void pushInto(final Board resource) {
            // nothing to do
        }

        @Override
        public void setEnabled(final boolean isEnabled) {
            // TODO
        }
    }
}
