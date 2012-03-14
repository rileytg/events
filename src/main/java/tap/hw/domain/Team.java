package tap.hw.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;

import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooJpaActiveRecord
public class Team {

    @NotNull
    @Enumerated
    private Gender gender;

    @ManyToOne
    private Sport sport;

    @ManyToOne
    private SportLevel sportLevel;

    @ManyToOne
    private School school;
    
    public String toString(){
        return school.getName() + " " + sportLevel.getName() + " " + sport.getName();
    }
}
