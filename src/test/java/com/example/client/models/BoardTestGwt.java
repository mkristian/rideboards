/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceFactory;

/**
 * GWT JUnit tests must extend GWTTestCase.
 */
public class BoardTestGwt extends AbstractApplicationResourceTestGwt<Board> {

        private Board resource;

    private static final String RESOURCE_XML = "<board>"
                                                     + "<id>1</id>"
                                                     + "<name>first valule of name</name>"
                                                     + "<fullname>first valule of fullname</fullname>"
                                                     + "<position>1</position>"
                                                     + "<enabled>false</enabled>"
                                                     + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                                     + "<updated_at>2009-07-09 17:14:48.0</updated_at>"
                                                     + "</board>";

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
        return "<boards>" + resource1Xml() + resource2Xml() + "</boards>";
    }

    @Override
    protected ResourceFactory<Board> factorySetUp() {
        return new BoardFactory(this.repository,
         this.notifications, this.userFactory);
    }

    @Override
    protected Resource<Board> resourceSetUp() {
        this.resource = this.factory.newResource(idValue());

        this.resource.id = 1;
				  this.resource.name = "first valule of name";
				  this.resource.fullname = "first valule of fullname";
				  this.resource.position = 1;
				  this.resource.enabled = false;

        this.repository.addXmlResponse(RESOURCE_XML);

        this.resource.save();

        return this.resource;
    }

    @Override
    public void doTestCreate() {
        assertEquals("first valule of name", this.resource.name);
    }

    @Override
    public void doTestUpdate() {
        this.resource.name = changedValue();
        this.resource.save();
        assertEquals(this.resource.name, changedValue());
    }

    private final static String XML = "<board>"
                                            + "<id>1</id>"
                                            + "<name>first valule of name</name>"
                                            + "<fullname>first valule of fullname</fullname>"
                                            + "<position>1</position>"
                                            + "<enabled>false</enabled>"
                                            + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                            + "<updated_at>2007-07-09 17:14:48.0</updated_at>"
                                            + "</board>";

    @Override
    protected String changedValue() {
        return "second value of name";
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
        return "first valule of name";
    }
}
