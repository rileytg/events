package tap.hw.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tap.hw.domain.Sport;

@RequestMapping("/sports")
@Controller
@RooWebScaffold(path = "sports", formBackingObject = Sport.class)
public class SportController {
}
