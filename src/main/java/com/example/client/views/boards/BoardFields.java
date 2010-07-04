/**
 *
 */
package com.example.client.views.boards;

import com.example.client.models.Board;

import de.saumya.gwt.persistence.client.TimestampFactory;
import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.gui.client.bindings.CheckBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.IntegerTextBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class BoardFields extends ResourceFields<Board> {

    public BoardFields(final GetTextController getTextController,
            final ResourceBindings<Board> bindings) {
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
        add("enabled", new CheckBoxBinding<Board>() {

            @Override
            public void pullFrom(final Board resource) {
                setValue(resource.enabled);
            }

            @Override
            public void pushInto(final Board resource) {
                resource.enabled = getValue();
            }
        });
    }
}
