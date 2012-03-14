// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package tap.hw.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import tap.hw.domain.School;
import tap.hw.domain.SchoolDataOnDemand;
import tap.hw.domain.SchoolIntegrationTest;

privileged aspect SchoolIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SchoolIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SchoolIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SchoolIntegrationTest: @Transactional;
    
    @Autowired
    private SchoolDataOnDemand SchoolIntegrationTest.dod;
    
    @Test
    public void SchoolIntegrationTest.testCountSchools() {
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", dod.getRandomSchool());
        long count = School.countSchools();
        Assert.assertTrue("Counter for 'School' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SchoolIntegrationTest.testFindSchool() {
        School obj = dod.getRandomSchool();
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'School' failed to provide an identifier", id);
        obj = School.findSchool(id);
        Assert.assertNotNull("Find method for 'School' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'School' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SchoolIntegrationTest.testFindAllSchools() {
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", dod.getRandomSchool());
        long count = School.countSchools();
        Assert.assertTrue("Too expensive to perform a find all test for 'School', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<School> result = School.findAllSchools();
        Assert.assertNotNull("Find all method for 'School' illegally returned null", result);
        Assert.assertTrue("Find all method for 'School' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SchoolIntegrationTest.testFindSchoolEntries() {
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", dod.getRandomSchool());
        long count = School.countSchools();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<School> result = School.findSchoolEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'School' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'School' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SchoolIntegrationTest.testFlush() {
        School obj = dod.getRandomSchool();
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'School' failed to provide an identifier", id);
        obj = School.findSchool(id);
        Assert.assertNotNull("Find method for 'School' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySchool(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'School' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SchoolIntegrationTest.testMergeUpdate() {
        School obj = dod.getRandomSchool();
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'School' failed to provide an identifier", id);
        obj = School.findSchool(id);
        boolean modified =  dod.modifySchool(obj);
        Integer currentVersion = obj.getVersion();
        School merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'School' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SchoolIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", dod.getRandomSchool());
        School obj = dod.getNewTransientSchool(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'School' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'School' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'School' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SchoolIntegrationTest.testRemove() {
        School obj = dod.getRandomSchool();
        Assert.assertNotNull("Data on demand for 'School' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'School' failed to provide an identifier", id);
        obj = School.findSchool(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'School' with identifier '" + id + "'", School.findSchool(id));
    }
    
}