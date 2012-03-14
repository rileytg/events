package tap.hw.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tap.hw.domain.School;

@RequestMapping("/schools")
@Controller
@RooWebScaffold(path = "schools", formBackingObject = School.class)
public class SchoolController {
}
