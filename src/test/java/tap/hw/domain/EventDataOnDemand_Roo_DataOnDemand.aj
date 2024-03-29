// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package tap.hw.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tap.hw.domain.Event;
import tap.hw.domain.EventDataOnDemand;
import tap.hw.domain.Team;
import tap.hw.domain.TeamDataOnDemand;

privileged aspect EventDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EventDataOnDemand: @Component;
    
    private Random EventDataOnDemand.rnd = new SecureRandom();
    
    private List<Event> EventDataOnDemand.data;
    
    @Autowired
    private TeamDataOnDemand EventDataOnDemand.teamDataOnDemand;
    
    public Event EventDataOnDemand.getNewTransientEvent(int index) {
        Event obj = new Event();
        setEventDate(obj, index);
        setHwScore(obj, index);
        setLocation(obj, index);
        setOpponent(obj, index);
        setOpponentScore(obj, index);
        setTeam(obj, index);
        return obj;
    }
    
    public void EventDataOnDemand.setEventDate(Event obj, int index) {
        Date eventDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEventDate(eventDate);
    }
    
    public void EventDataOnDemand.setHwScore(Event obj, int index) {
        String hwScore = "hwScore_" + index;
        obj.setHwScore(hwScore);
    }
    
    public void EventDataOnDemand.setLocation(Event obj, int index) {
        String location = "location_" + index;
        obj.setLocation(location);
    }
    
    public void EventDataOnDemand.setOpponent(Event obj, int index) {
        Team opponent = teamDataOnDemand.getRandomTeam();
        obj.setOpponent(opponent);
    }
    
    public void EventDataOnDemand.setOpponentScore(Event obj, int index) {
        String opponentScore = "opponentScore_" + index;
        obj.setOpponentScore(opponentScore);
    }
    
    public void EventDataOnDemand.setTeam(Event obj, int index) {
        Team team = teamDataOnDemand.getRandomTeam();
        obj.setTeam(team);
    }
    
    public Event EventDataOnDemand.getSpecificEvent(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Event obj = data.get(index);
        Long id = obj.getId();
        return Event.findEvent(id);
    }
    
    public Event EventDataOnDemand.getRandomEvent() {
        init();
        Event obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Event.findEvent(id);
    }
    
    public boolean EventDataOnDemand.modifyEvent(Event obj) {
        return false;
    }
    
    public void EventDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Event.findEventEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Event' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Event>();
        for (int i = 0; i < 10; i++) {
            Event obj = getNewTransientEvent(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
