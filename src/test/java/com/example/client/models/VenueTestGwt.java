/**
 *
 */
package com.example.client.models;

import de.saumya.gwt.persistence.client.Resource;
import de.saumya.gwt.persistence.client.ResourceFactory;

/**
 * GWT JUnit tests must extend GWTTestCase.
 */
public class VenueTestGwt extends AbstractApplicationResourceTestGwt<Venue> {

        private Venue resource;

    private static final String RESOURCE_XML = "<venue>"
                                                     + "<id>1</id>"
                                                     + "<fullname>first valule of fullname</fullname>"
                                                     + "<email>first valule of email</email>"
                                                     + "<password>first valule of password</password>"
                                                     + "<bcc>false</bcc>"
                                                     + "<enabled>false</enabled>"
                                                     + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                                     + "<updated_at>2009-07-09 17:14:48.0</updated_at>"
                                                     + "</venue>";

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
        return "<venues>" + resource1Xml() + resource2Xml() + "</venues>";
    }

    @Override
    protected ResourceFactory<Venue> factorySetUp() {
        return new VenueFactory(this.repository,
         this.notifications, this.userFactory);
    }

    @Override
    protected Resource<Venue> resourceSetUp() {
        this.resource = this.factory.newResource(idValue());

        this.resource.id = 1;
				  this.resource.fullname = "first valule of fullname";
				  this.resource.email = "first valule of email";
				  this.resource.password = "first valule of password";
				  this.resource.bcc = false;
				  this.resource.enabled = false;

        this.repository.addXmlResponse(RESOURCE_XML);

        this.resource.save();

        return this.resource;
    }

    @Override
    public void doTestCreate() {
        assertEquals("first valule of fullname", this.resource.fullname);
    }

    @Override
    public void doTestUpdate() {
        this.resource.fullname = changedValue();
        this.resource.save();
        assertEquals(this.resource.fullname, changedValue());
    }

    private final static String XML = "<venue>"
                                            + "<id>1</id>"
                                            + "<fullname>first valule of fullname</fullname>"
                                            + "<email>first valule of email</email>"
                                            + "<password>first valule of password</password>"
                                            + "<bcc>false</bcc>"
                                            + "<enabled>false</enabled>"
                                            + "<created_at>2009-07-09 17:14:48.0</created_at>"
                                            + "<updated_at>2007-07-09 17:14:48.0</updated_at>"
                                            + "</venue>";

    @Override
    protected String changedValue() {
        return "second value of fullname";
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
        return "first valule of fullname";
    }
}
