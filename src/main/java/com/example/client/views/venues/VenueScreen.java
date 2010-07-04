/**
 *
 */
package com.example.client.views.venues;

import com.example.client.models.Venue;
import com.example.client.models.VenueFactory;

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

public class VenueScreen extends ResourceScreen<Venue> {

    private static class VenueHeaders extends ResourceHeaderPanel<Venue> {

        public VenueHeaders(final GetTextController getTextController) {
            super(getTextController);
        }

        public void reset(final Venue resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }
    }

    public VenueScreen(final LoadingNotice loadingNotice,
            final GetTextController getTextController,
            final VenueFactory factory, final Session session,
            final ResourceBindings<Venue> bindings,
            final NotificationListeners listeners,
            final HyperlinkFactory hyperlinkFactory) {
        super(loadingNotice,
                factory,
                session,
               new ResourcePanel<Venue>(new VenueHeaders(getTextController),
                       new VenueFields(getTextController, bindings)),
                new ResourceCollectionPanel<Venue>(loadingNotice,
                        new ResourceCollectionNavigation<Venue>(loadingNotice,
                                factory,
                                getTextController),
                        new ResourceCollectionListing<Venue>(session,
                                factory,
                                getTextController,
                                hyperlinkFactory)),
                new ResourceActionPanel<Venue>(getTextController,
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
