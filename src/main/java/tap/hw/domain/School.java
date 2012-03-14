package tap.hw.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord
public class School {

    @NotNull
    private String name;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "school")
    private Set<Team> teams = new HashSet<Team>();


    public String toString(){
        return name;
    }
}
