/**
 * 
 */
package com.example.client.views.boards;

import com.google.gwt.user.client.ui.SimplePanel;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceFactory;
import de.saumya.gwt.session.client.Session;
import de.saumya.gwt.session.client.Session.Action;
import de.saumya.gwt.translation.common.client.route.PathFactory;
import de.saumya.gwt.translation.common.client.widget.HyperlinkFactory;
import de.saumya.gwt.translation.common.client.widget.ResourceBindings.Binding;

public abstract class LinkBinding<FROM extends Resource<FROM>, TO extends Resource<TO>>
        extends SimplePanel implements Binding<FROM> {

    private final Session          session;

    private final PathFactory      pathFactory;

    private final HyperlinkFactory hyperlinkFactory;

    public LinkBinding(final Session session,
            final ResourceFactory<TO> factory,
            final HyperlinkFactory hyperlinkFactory) {
        this.session = session;
        this.hyperlinkFactory = hyperlinkFactory;
        this.pathFactory = hyperlinkFactory.newPathFactory(factory.storagePluralName());
    }

    protected void pullFrom(final TO resource) {
        // TODO use session to determine the link to be active or not
        clear();
        if (this.session.isAllowed(Action.UPDATE, "listings")) {
            add(this.hyperlinkFactory.newHyperlink(resource.display(),
                                                   this.pathFactory.editPath(resource.id,
                                                                             false)));
        }
        else {
            add(this.hyperlinkFactory.newHyperlink(resource.display(),
                                                   this.pathFactory.showPath(resource.id,
                                                                             false)));

        }
    }

    @Override
    public void pushInto(final FROM resource) {
        // not applicable
    }

    @Override
    public void setEnabled(final boolean isEnabled) {
        // not applicable
    }

}