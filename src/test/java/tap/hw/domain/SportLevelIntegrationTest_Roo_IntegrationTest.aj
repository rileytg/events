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
import tap.hw.domain.SportLevel;
import tap.hw.domain.SportLevelDataOnDemand;
import tap.hw.domain.SportLevelIntegrationTest;

privileged aspect SportLevelIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SportLevelIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SportLevelIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SportLevelIntegrationTest: @Transactional;
    
    @Autowired
    private SportLevelDataOnDemand SportLevelIntegrationTest.dod;
    
    @Test
    public void SportLevelIntegrationTest.testCountSportLevels() {
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", dod.getRandomSportLevel());
        long count = SportLevel.countSportLevels();
        Assert.assertTrue("Counter for 'SportLevel' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SportLevelIntegrationTest.testFindSportLevel() {
        SportLevel obj = dod.getRandomSportLevel();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to provide an identifier", id);
        obj = SportLevel.findSportLevel(id);
        Assert.assertNotNull("Find method for 'SportLevel' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SportLevel' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SportLevelIntegrationTest.testFindAllSportLevels() {
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", dod.getRandomSportLevel());
        long count = SportLevel.countSportLevels();
        Assert.assertTrue("Too expensive to perform a find all test for 'SportLevel', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SportLevel> result = SportLevel.findAllSportLevels();
        Assert.assertNotNull("Find all method for 'SportLevel' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SportLevel' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SportLevelIntegrationTest.testFindSportLevelEntries() {
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", dod.getRandomSportLevel());
        long count = SportLevel.countSportLevels();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SportLevel> result = SportLevel.findSportLevelEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SportLevel' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SportLevel' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SportLevelIntegrationTest.testFlush() {
        SportLevel obj = dod.getRandomSportLevel();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to provide an identifier", id);
        obj = SportLevel.findSportLevel(id);
        Assert.assertNotNull("Find method for 'SportLevel' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySportLevel(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'SportLevel' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SportLevelIntegrationTest.testMergeUpdate() {
        SportLevel obj = dod.getRandomSportLevel();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to provide an identifier", id);
        obj = SportLevel.findSportLevel(id);
        boolean modified =  dod.modifySportLevel(obj);
        Integer currentVersion = obj.getVersion();
        SportLevel merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'SportLevel' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SportLevelIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", dod.getRandomSportLevel());
        SportLevel obj = dod.getNewTransientSportLevel(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SportLevel' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'SportLevel' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SportLevelIntegrationTest.testRemove() {
        SportLevel obj = dod.getRandomSportLevel();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SportLevel' failed to provide an identifier", id);
        obj = SportLevel.findSportLevel(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SportLevel' with identifier '" + id + "'", SportLevel.findSportLevel(id));
    }
    
}
