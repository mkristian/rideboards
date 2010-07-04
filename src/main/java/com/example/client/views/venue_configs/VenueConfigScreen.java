/**
 *
 */
package com.example.client.views.venue_configs;

import com.example.client.models.VenueConfig;
import com.example.client.models.VenueConfigFactory;

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

public class VenueConfigScreen extends ResourceScreen<VenueConfig> {

    private static class VenueConfigHeaders extends ResourceHeaderPanel<VenueConfig> {

        public VenueConfigHeaders(final GetTextController getTextController) {
            super(getTextController);
        }

        public void reset(final VenueConfig resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }
    }

    public VenueConfigScreen(final LoadingNotice loadingNotice,
            final GetTextController getTextController,
            final VenueConfigFactory factory, final Session session,
            final ResourceBindings<VenueConfig> bindings,
            final NotificationListeners listeners,
            final HyperlinkFactory hyperlinkFactory) {
        super(loadingNotice,
                factory,
                session,
               new ResourcePanel<VenueConfig>(new VenueConfigHeaders(getTextController),
                       new VenueConfigFields(getTextController, bindings)),
                new ResourceCollectionPanel<VenueConfig>(loadingNotice,
                        new ResourceCollectionNavigation<VenueConfig>(loadingNotice,
                                factory,
                                getTextController),
                        new ResourceCollectionListing<VenueConfig>(session,
                                factory,
                                getTextController,
                                hyperlinkFactory)),
                new ResourceActionPanel<VenueConfig>(getTextController,
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
