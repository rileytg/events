package tap.hw.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tap.hw.domain.SportLevel;

@RequestMapping("/sportlevels")
@Controller
@RooWebScaffold(path = "sportlevels", formBackingObject = SportLevel.class)
public class SportLevelController {
}
