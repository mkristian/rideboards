/**
 *
 */
package com.example.client.views.venues;

import com.example.client.models.Venue;

import de.saumya.gwt.translation.common.client.GetTextController;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings;
import de.saumya.gwt.translation.common.client.widget.ResourceFields;
import de.saumya.gwt.translation.gui.client.bindings.CheckBoxBinding;
import de.saumya.gwt.translation.gui.client.bindings.TextBoxBinding;

public class VenueFields
    extends ResourceFields<Venue>
{

    public VenueFields(final GetTextController getTextController, final ResourceBindings<Venue> bindings)
    {
        super( getTextController, bindings );
        add( "fullname", new TextBoxBinding<Venue>()
        {

            @Override
            public void pullFrom( final Venue resource )
            {
                setText( resource.fullname );
            }

            @Override
            public void pushInto( final Venue resource )
            {
                resource.fullname = getText();
            }
        }, true, 64 );
        add( "email", new TextBoxBinding<Venue>()
        {

            @Override
            public void pullFrom( final Venue resource )
            {
                setText( resource.email );
            }

            @Override
            public void pushInto( final Venue resource )
            {
                resource.email = getText();
            }
        }, true, 64 );
        add( "password", new TextBoxBinding<Venue>()
        {

            @Override
            public void pullFrom( final Venue resource )
            {
                setText( resource.password );
            }

            @Override
            public void pushInto( final Venue resource )
            {
                resource.password = getText();
            }
        }, true, 64 );
        add( "bcc", new CheckBoxBinding<Venue>()
        {

            @Override
            public void pullFrom( final Venue resource )
            {
                setValue( resource.bcc );
            }

            @Override
            public void pushInto( final Venue resource )
            {
                resource.bcc = getValue();
            }
        } );
        add( "enabled", new CheckBoxBinding<Venue>()
        {

            @Override
            public void pullFrom( final Venue resource )
            {
                setValue( resource.enabled );
            }

            @Override
            public void pushInto( final Venue resource )
            {
                resource.enabled = getValue();
            }
        } );
    }
}
