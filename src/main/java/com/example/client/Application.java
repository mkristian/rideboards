package com.example.client;

import com.example.client.models.Board;
import com.example.client.models.BoardConfig;
import com.example.client.models.BoardConfigFactory;
import com.example.client.models.BoardFactory;
import com.example.client.models.Listing;
import com.example.client.models.ListingFactory;
import com.example.client.models.Venue;
import com.example.client.models.VenueConfig;
import com.example.client.models.VenueConfigFactory;
import com.example.client.models.VenueFactory;
import com.example.client.views.board_configs.BoardConfigScreen;
import com.example.client.views.boards.BoardScreen;
import com.example.client.views.listings.ListingScreen;
import com.example.client.views.venue_configs.VenueConfigScreen;
import com.example.client.views.venues.VenueScreen;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.RootPanel;

import de.saumya.gwt.translation.common.client.route.ScreenController;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.gui.client.GUIContainer;

public class Application implements EntryPoint {

    @Override
    public void onModuleLoad() {
        final GUIContainer container = new GUIContainer(RootPanel.get());
        final ScreenController screenController = container.screenController;

        final ListingFactory listingFactory = new ListingFactory(container.repository,
                container.notifications);
        final BoardFactory boardFactory = new BoardFactory(container.repository,
                container.notifications,
                container.userFactory,
                listingFactory);
        final ListingScreen listingScreen = new ListingScreen(container.loadingNotice,
                container.getTextController,
                listingFactory,
                container.session,
                new ResourceBindings<Listing>(),
                container.listeners,
                container.hyperlinkFactory,
                boardFactory);
        screenController.addScreen(listingScreen, "listings");

        final BoardScreen boardScreen = new BoardScreen(container.loadingNotice,
                container.getTextController,
                boardFactory,
                container.session,
                new ResourceBindings<Board>(),
                container.listeners,
                container.hyperlinkFactory,
                listingFactory);
        screenController.addScreen(boardScreen, "boards");

        final BoardConfigFactory boardConfigFactory = new BoardConfigFactory(container.repository,
                container.notifications,
                container.userFactory);
        final BoardConfigScreen boardConfigScreen = new BoardConfigScreen(container.loadingNotice,
                container.getTextController,
                boardConfigFactory,
                container.session,
                new ResourceBindings<BoardConfig>(),
                container.listeners,
                container.hyperlinkFactory);
        screenController.addScreen(boardConfigScreen, "board_configs");

        final VenueConfigFactory venueConfigFactory = new VenueConfigFactory(container.repository,
                container.notifications,
                container.userFactory);
        final VenueConfigScreen venueConfigScreen = new VenueConfigScreen(container.loadingNotice,
                container.getTextController,
                venueConfigFactory,
                container.session,
                new ResourceBindings<VenueConfig>(),
                container.listeners,
                container.hyperlinkFactory);
        screenController.addScreen(venueConfigScreen, "venue_configs");

        final VenueFactory venueFactory = new VenueFactory(container.repository,
                container.notifications,
                container.userFactory);
        final VenueScreen venueScreen = new VenueScreen(container.loadingNotice,
                container.getTextController,
                venueFactory,
                container.session,
                new ResourceBindings<Venue>(),
                container.listeners,
                container.hyperlinkFactory);
        screenController.addScreen(venueScreen, "venues");

        screenController.dispatchDefault();
    }
}
