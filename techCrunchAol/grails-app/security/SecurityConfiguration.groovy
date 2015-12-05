package security
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.*
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.context.annotation.Configuration

@Configuration
@EnableWebSecurity
class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                .withUser("artist").password("pass").roles("ARTIST");

        auth
                .inMemoryAuthentication()
                .withUser("venue").password("pass").roles("VENUE");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http
                .authorizeRequests()
                .antMatchers('/venue/**').hasAnyRole("ARTIST", "VENUE")
                .antMatchers('/artist/**').hasAnyRole("ARTIST", "VENUE")
                .antMatchers('/event/**').hasAnyRole("ARTIST", "VENUE")
                .antMatchers('/').permitAll()
                .and()
                .formLogin().permitAll()
                .and()
                .logout().permitAll()
    }

}
