package tap.hw.web;

import org.joda.time.DateTime;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tap.hw.domain.Event;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/calendar")
@Controller
public class CalendarController {

    @RequestMapping(value = "eventFeed")
    public ResponseEntity<String> events( @RequestParam String start, @RequestParam String end, ModelMap modelMap,Model uiModel, HttpServletRequest request, HttpServletResponse response) {
        DateTime startDateTime = new DateTime(Long.parseLong(start));
        DateTime endDateTime = new DateTime(Long.parseLong(end));
        TypedQuery<Event> query = Event.findEventsByEventDateBetween(startDateTime.toDate(), endDateTime.toDate());
        List<Event> eventList = query.getResultList();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Event> result = Event.findAllEvents();
        return new ResponseEntity<String>(Event.toJsonArray(result), headers, HttpStatus.OK);
    }


    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "calendar/index";
    }
}
