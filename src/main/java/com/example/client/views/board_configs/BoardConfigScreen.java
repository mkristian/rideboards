/**
 *
 */
package com.example.client.views.board_configs;

import com.example.client.models.BoardConfig;
import com.example.client.models.BoardConfigFactory;

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

public class BoardConfigScreen extends ResourceScreen<BoardConfig> {

    private static class BoardConfigHeaders extends ResourceHeaderPanel<BoardConfig> {

        public BoardConfigHeaders(final GetTextController getTextController) {
            super(getTextController);
        }

        public void reset(final BoardConfig resource) {
            reset(resource, resource.updatedAt, resource.updatedBy);
        }
    }

    public BoardConfigScreen(final LoadingNotice loadingNotice,
            final GetTextController getTextController,
            final BoardConfigFactory factory, final Session session,
            final ResourceBindings<BoardConfig> bindings,
            final NotificationListeners listeners,
            final HyperlinkFactory hyperlinkFactory) {
        super(loadingNotice,
                factory,
                session,
               new ResourcePanel<BoardConfig>(new BoardConfigHeaders(getTextController),
                       new BoardConfigFields(getTextController, bindings)),
                new ResourceCollectionPanel<BoardConfig>(loadingNotice,
                        new ResourceCollectionNavigation<BoardConfig>(loadingNotice,
                                factory,
                                getTextController),
                        new ResourceCollectionListing<BoardConfig>(session,
                                factory,
                                getTextController,
                                hyperlinkFactory)),
                new ResourceActionPanel<BoardConfig>(getTextController,
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
