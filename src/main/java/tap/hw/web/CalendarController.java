package tap.hw.web;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tap.hw.domain.Event;

import java.util.List;

@RequestMapping("/calendar")
@Controller
public class CalendarController {

    @RequestMapping(value = "eventFeed")
    public String events( @RequestParam String start, @RequestParam String end, ModelMap modelMap,Model uiModel, HttpServletRequest request, HttpServletResponse response) {
        DateTime startDateTime = new DateTime(Long.parseLong(start));
        DateTime endDateTime = new DateTime(Long.parseLong(end));
        TypedQuery<Event> query = Event.findEventsByEventDateBetween(startDateTime.toDate(), endDateTime.toDate());
        List<Event> eventList = query.getResultList();
        uiModel.addAttribute("events", eventList);

        return "events/list";
    }


    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "calendar/index";
    }
}
