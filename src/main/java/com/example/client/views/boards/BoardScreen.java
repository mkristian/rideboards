/**
 *
 */
package com.example.client.views.boards;

import com.example.client.models.Board;
import com.example.client.models.BoardFactory;
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

public class BoardScreen extends ResourceScreen<Board> {

    private static class BoardHeaders extends ResourceHeaderPanel<Board> {

        public BoardHeaders(final GetTextController getTextController) {
            super(getTextController);
        }

        public void reset(final Board resource) {
            reset(resource.createdAt,
                  resource.createdBy,
                  resource.updatedAt,
                  resource.updatedBy);
        }
    }

    public BoardScreen(final LoadingNotice loadingNotice,
            final GetTextController getTextController,
            final BoardFactory factory, final Session session,
            final ResourceBindings<Board> bindings,
            final NotificationListeners listeners,
            final HyperlinkFactory hyperlinkFactory,
            final ListingFactory listingFactory) {
        super(loadingNotice,
                factory,
                session,
                new ResourcePanel<Board>(new BoardHeaders(getTextController),
                        new BoardFields(getTextController,
                                bindings,
                                listingFactory,
                                session,
                                hyperlinkFactory)),
                new ResourceCollectionPanel<Board>(loadingNotice,
                        new ResourceCollectionNavigation<Board>(loadingNotice,
                                factory,
                                getTextController),
                        new ResourceCollectionListing<Board>(session,
                                factory,
                                getTextController,
                                hyperlinkFactory)),
                new ResourceActionPanel<Board>(getTextController,
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
