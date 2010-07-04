package com.example.client;

import com.example.client.models.BoardFactory;
import com.example.client.models.Board;
import com.example.client.views.boards.BoardScreen;

import com.example.client.models.BoardConfigFactory;
import com.example.client.models.BoardConfig;
import com.example.client.views.board_configs.BoardConfigScreen;

import com.example.client.models.VenueConfigFactory;
import com.example.client.models.VenueConfig;
import com.example.client.views.venue_configs.VenueConfigScreen;

import com.example.client.models.VenueFactory;
import com.example.client.models.Venue;
import com.example.client.views.venues.VenueScreen;

import de.saumya.gwt.translation.common.client.widget.ResourceBindings;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.RootPanel;

import de.saumya.gwt.translation.common.client.route.ScreenController;
import de.saumya.gwt.translation.gui.client.GUIContainer;

public class Application implements EntryPoint {

    @Override
    public void onModuleLoad() {
        final GUIContainer container = new GUIContainer(RootPanel.get());
        final ScreenController screenController = container.screenController;

        BoardFactory boardFactory = new BoardFactory(container.repository,
                container.notifications,
                container.userFactory);
        BoardScreen boardScreen = new BoardScreen(container.loadingNotice,
                 container.getTextController,
                 boardFactory,
                 container.session,
                 new ResourceBindings<Board>(),
                 container.listeners,
                 container.hyperlinkFactory);
        screenController.addScreen(boardScreen, "boards");

        BoardConfigFactory boardConfigFactory = new BoardConfigFactory(container.repository,
                container.notifications,
                container.userFactory);
        BoardConfigScreen boardConfigScreen = new BoardConfigScreen(container.loadingNotice,
                 container.getTextController,
                 boardConfigFactory,
                 container.session,
                 new ResourceBindings<BoardConfig>(),
                 container.listeners,
                 container.hyperlinkFactory);
        screenController.addScreen(boardConfigScreen, "board_configs");

        VenueConfigFactory venueConfigFactory = new VenueConfigFactory(container.repository,
                container.notifications,
                container.userFactory);
        VenueConfigScreen venueConfigScreen = new VenueConfigScreen(container.loadingNotice,
                 container.getTextController,
                 venueConfigFactory,
                 container.session,
                 new ResourceBindings<VenueConfig>(),
                 container.listeners,
                 container.hyperlinkFactory);
        screenController.addScreen(venueConfigScreen, "venue_configs");

        VenueFactory venueFactory = new VenueFactory(container.repository,
                container.notifications,
                container.userFactory);
        VenueScreen venueScreen = new VenueScreen(container.loadingNotice,
                 container.getTextController,
                 venueFactory,
                 container.session,
                 new ResourceBindings<Venue>(),
                 container.listeners,
                 container.hyperlinkFactory);
        screenController.addScreen(venueScreen, "venues");
    }
}
