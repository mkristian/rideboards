/**
 *
 */
package com.example.client.views.venue_configs;

import com.example.client.models.VenueConfig;

import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.gui.client.bindings.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class VenueConfigFields extends ResourceFields<VenueConfig> {

    public VenueConfigFields(final GetTextController getTextController,
            final ResourceBindings<VenueConfig> bindings) {
        super(getTextController, bindings);
        add("locale_id", new IntegerTextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.localeId);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.localeId = getTextAsInt();
            }
        }, 0, 123456);
        add("venue_id", new IntegerTextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.venueId);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.venueId = getTextAsInt();
            }
        }, 0, 123456);
        add("date_format", new TextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.dateFormat);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.dateFormat = getText();
            }
        }, true, 64);
        add("home_url", new TextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.homeUrl);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.homeUrl = getText();
            }
        }, true, 64);
        add("schedule_url", new TextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.scheduleUrl);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.scheduleUrl = getText();
            }
        }, true, 64);
        add("checklist_url", new TextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.checklistUrl);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.checklistUrl = getText();
            }
        }, true, 64);
        add("iframe_url", new TextBoxBinding<VenueConfig>() {

            @Override
            public void pullFrom(final VenueConfig resource) {
                setText(resource.iframeUrl);
            }

            @Override
            public void pushInto(final VenueConfig resource) {
                resource.iframeUrl = getText();
            }
        }, true, 64);
    }
}
