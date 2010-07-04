/**
 *
 */
package com.example.client.views.board_configs;

import com.example.client.models.BoardConfig;

import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.gui.client.bindings.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class BoardConfigFields extends ResourceFields<BoardConfig> {

    public BoardConfigFields(final GetTextController getTextController,
            final ResourceBindings<BoardConfig> bindings) {
        super(getTextController, bindings);
        add("board_id", new IntegerTextBoxBinding<BoardConfig>() {

            @Override
            public void pullFrom(final BoardConfig resource) {
                setText(resource.boardId);
            }

            @Override
            public void pushInto(final BoardConfig resource) {
                resource.boardId = getTextAsInt();
            }
        }, 0, 123456);
        add("locale_id", new IntegerTextBoxBinding<BoardConfig>() {

            @Override
            public void pullFrom(final BoardConfig resource) {
                setText(resource.localeId);
            }

            @Override
            public void pushInto(final BoardConfig resource) {
                resource.localeId = getTextAsInt();
            }
        }, 0, 123456);
        add("map_url", new TextBoxBinding<BoardConfig>() {

            @Override
            public void pullFrom(final BoardConfig resource) {
                setText(resource.mapUrl);
            }

            @Override
            public void pushInto(final BoardConfig resource) {
                resource.mapUrl = getText();
            }
        }, true, 64);
        add("directions_url", new TextBoxBinding<BoardConfig>() {

            @Override
            public void pullFrom(final BoardConfig resource) {
                setText(resource.directionsUrl);
            }

            @Override
            public void pushInto(final BoardConfig resource) {
                resource.directionsUrl = getText();
            }
        }, true, 64);
    }
}
