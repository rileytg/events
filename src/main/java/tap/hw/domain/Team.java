package tap.hw.domain;

import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Team {

    @NotNull
    @Enumerated
    private Gender gender;

    @ManyToOne
    private Sport sport;

    @ManyToOne
    private SportLevel sportLevel;
}
