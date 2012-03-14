package tap.hw.domain;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RooJavaBean
@RooToString
@RooEquals
@RooJpaActiveRecord(finders = { "findEventsByEventDateBetween" })
@RooJson
@RooWebJson(jsonObject = tap.hw.domain.Event.class)
public class Event {

    @ManyToOne
    @NotNull
    private Team team;

    @NotNull
    private String location;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "SS")
    private Date eventDate;

    @ManyToOne
    @NotNull
    private Team opponent;

    private String hwScore;

    private String opponentScore;

    private transient String title;

    private transient Long start;

    public String getTitle() {
        return team.toString();
    }

    public Long getStart() {
        return new DateTime(eventDate).toInstant().getMillis()/1000;
    }
}
