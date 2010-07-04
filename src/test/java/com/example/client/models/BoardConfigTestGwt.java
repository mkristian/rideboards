/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceFactory;

/**
 * GWT JUnit tests must extend GWTTestCase.
 */
public class BoardConfigTestGwt extends AbstractApplicationResourceTestGwt<BoardConfig> {

        private BoardConfig resource;

    private static final String RESOURCE_XML = "<board_config>"
                                                     + "<id>1</id>"
                                                     + "<board_id>1</board_id>"
                                                     + "<locale_id>1</locale_id>"
                                                     + "<map_url>first valule of map_url</map_url>"
                                                     + "<directions_url>first valule of directions_url</directions_url>"
                                                     + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                                     + "<updated_at>2009-07-09 17:14:48.0</updated_at>"
                                                     + "</board_config>";

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
        return "<board_configs>" + resource1Xml() + resource2Xml() + "</board_configs>";
    }

    @Override
    protected ResourceFactory<BoardConfig> factorySetUp() {
        return new BoardConfigFactory(this.repository,
         this.notifications, this.userFactory);
    }

    @Override
    protected Resource<BoardConfig> resourceSetUp() {
        this.resource = this.factory.newResource(idValue());

        this.resource.id = 1;
				  this.resource.boardId = 1;
				  this.resource.localeId = 1;
				  this.resource.mapUrl = "first valule of map_url";
				  this.resource.directionsUrl = "first valule of directions_url";

        this.repository.addXmlResponse(RESOURCE_XML);

        this.resource.save();

        return this.resource;
    }

    @Override
    public void doTestCreate() {
        assertEquals("first valule of map_url", this.resource.mapUrl);
    }

    @Override
    public void doTestUpdate() {
        this.resource.mapUrl = changedValue();
        this.resource.save();
        assertEquals(this.resource.mapUrl, changedValue());
    }

    private final static String XML = "<board_config>"
                                            + "<id>1</id>"
                                            + "<board_id>1</board_id>"
                                            + "<locale_id>1</locale_id>"
                                            + "<map_url>first valule of map_url</map_url>"
                                            + "<directions_url>first valule of directions_url</directions_url>"
                                            + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                            + "<updated_at>2007-07-09 17:14:48.0</updated_at>"
                                            + "</board_config>";

    @Override
    protected String changedValue() {
        return "second value of map_url";
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
        return "first valule of map_url";
    }
}
