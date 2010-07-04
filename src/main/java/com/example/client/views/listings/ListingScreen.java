/**
 *
 */
package com.example.client.views.listings;

import com.example.client.models.Listing;
import com.example.client.models.ListingFactory;

import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.HyperlinkFactory;
import de.saumya.gwt.translation.common.client.widget.LoadingNotice;
import de.saumya.gwt.translation.common.client.widget.NotificationListeners;
import de.saumya.gwt.translation.common.client.widget.ResourceActionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionListing;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionNavigation;
import de.saumya.gwt.translation.common.client.widget.ResourceCollectionPanel;
import de.saumya.gwt.translation.common.client.widget.ResourceHeaderPanel;
import de.saumya.gwt.translation.common.client.widget.ResourcePanel;
import de.saumya.gwt.translation.common.client.widget.ResourceScreen;

public class ListingScreen extends ResourceScreen<Listing> {

    private static class ListingHeaders extends ResourceHeaderPanel<Listing> {

        public ListingHeaders(final GetTextController getTextController) {
            super(getTextController);
        }

        public void reset(final Listing resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }
    }

    public ListingScreen(final LoadingNotice loadingNotice,
            final GetTextController getTextController,
            final ListingFactory factory, final Session session,
            final ResourceBindings<Listing> bindings,
            final NotificationListeners listeners,
            final HyperlinkFactory hyperlinkFactory) {
        super(loadingNotice,
                factory,
                session,
               new ResourcePanel<Listing>(new ListingHeaders(getTextController),
                       new ListingFields(getTextController, bindings)),
                new ResourceCollectionPanel<Listing>(loadingNotice,
                        new ResourceCollectionNavigation<Listing>(loadingNotice,
                                factory,
                                getTextController),
                        new ResourceCollectionListing<Listing>(session,
                                factory,
                                getTextController,
                                hyperlinkFactory)),
                new ResourceActionPanel<Listing>(getTextController,
                        bindings,
                        session,
                        factory,
                        listeners,
                        hyperlinkFactory,
                        true,
                        true),
                listeners,
                hyperlinkFactory);
    }

}
