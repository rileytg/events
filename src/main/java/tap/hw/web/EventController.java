package tap.hw.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tap.hw.domain.Event;

@RequestMapping("/events")
@Controller
@RooWebScaffold(path = "events", formBackingObject = Event.class)
public class EventController {
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, @RequestParam(required = false, value = "inPopup", defaultValue = "false") Boolean inPopup, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("event", Event.findEvent(id));
        uiModel.addAttribute("itemId", id);
        return inPopup ? "popup/events/show" : "events/show";
    }
}
