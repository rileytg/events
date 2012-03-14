package tap.hw.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;
import tap.hw.domain.Team;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
        registry.addConverter(getTeamToStringConverter());
	}
    public Converter<Team, String> getTeamToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<tap.hw.domain.Team, java.lang.String>() {
            public String convert(Team team) {
                return team.toString();
            }
        };
    }
}
