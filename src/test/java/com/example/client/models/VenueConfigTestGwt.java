/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceFactory;

/**
 * GWT JUnit tests must extend GWTTestCase.
 */
public class VenueConfigTestGwt extends AbstractApplicationResourceTestGwt<VenueConfig> {

        private VenueConfig resource;

    private static final String RESOURCE_XML = "<venue_config>"
                                                     + "<id>1</id>"
                                                     + "<locale_id>1</locale_id>"
                                                     + "<venue_id>1</venue_id>"
                                                     + "<date_format>first valule of date_format</date_format>"
                                                     + "<home_url>first valule of home_url</home_url>"
                                                     + "<schedule_url>first valule of schedule_url</schedule_url>"
                                                     + "<checklist_url>first valule of checklist_url</checklist_url>"
                                                     + "<iframe_url>first valule of iframe_url</iframe_url>"
                                                     + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                                     + "<updated_at>2009-07-09 17:14:48.0</updated_at>"
                                                     + "</venue_config>";

    @Override
    protected String resourceNewXml() {
        return RESOURCE_XML.replaceFirst("<created_at>[0-9-:. ]*</created_at>", "").replaceFirst("<updated_at>[0-9-:. ]*</updated_at>", "").replace("<id>1</id>", "");
    }

    @Override
    protected String resource1Xml() {
        return RESOURCE_XML;
    }

    @Override
    protected String resource2Xml() {
        return RESOURCE_XML.replace(">1<", ">2<");
    }

    @Override
    protected String resourcesXml() {
        return "<venue_configs>" + resource1Xml() + resource2Xml() + "</venue_configs>";
    }

    @Override
    protected ResourceFactory<VenueConfig> factorySetUp() {
        return new VenueConfigFactory(this.repository,
         this.notifications, this.userFactory);
    }

    @Override
    protected Resource<VenueConfig> resourceSetUp() {
        this.resource = this.factory.newResource(idValue());

        this.resource.id = 1;
				  this.resource.localeId = 1;
				  this.resource.venueId = 1;
				  this.resource.dateFormat = "first valule of date_format";
				  this.resource.homeUrl = "first valule of home_url";
				  this.resource.scheduleUrl = "first valule of schedule_url";
				  this.resource.checklistUrl = "first valule of checklist_url";
				  this.resource.iframeUrl = "first valule of iframe_url";

        this.repository.addXmlResponse(RESOURCE_XML);

        this.resource.save();

        return this.resource;
    }

    @Override
    public void doTestCreate() {
        assertEquals("first valule of date_format", this.resource.dateFormat);
    }

    @Override
    public void doTestUpdate() {
        this.resource.dateFormat = changedValue();
        this.resource.save();
        assertEquals(this.resource.dateFormat, changedValue());
    }

    private final static String XML = "<venue_config>"
                                            + "<id>1</id>"
                                            + "<locale_id>1</locale_id>"
                                            + "<venue_id>1</venue_id>"
                                            + "<date_format>first valule of date_format</date_format>"
                                            + "<home_url>first valule of home_url</home_url>"
                                            + "<schedule_url>first valule of schedule_url</schedule_url>"
                                            + "<checklist_url>first valule of checklist_url</checklist_url>"
                                            + "<iframe_url>first valule of iframe_url</iframe_url>"
                                            + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                            + "<updated_at>2007-07-09 17:14:48.0</updated_at>"
                                            + "</venue_config>";

    @Override
    protected String changedValue() {
        return "second value of date_format";
    }

    @Override
    protected int idValue() {
        return 1;
    }

    @Override
    protected String marshallingXml() {
        return XML;
    }

    @Override
    protected String value() {
        return "first valule of date_format";
    }
}
