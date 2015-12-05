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
                .withUser("artist").password("pass").roles("USER");
                //.withUser("venue").password("pass").roles("USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers('/admin/**').hasAnyRole('ADMIN')
                .antMatchers('/artist/**').hasAnyRole('USER', 'ADMIN')
                .antMatchers('/').permitAll()
                .and()
                .formLogin().permitAll()
                .and()
                .logout().permitAll()
    }

    //<-- --="" .inmemoryauthentication="" .withuser="" auth="" code="" configureglobal="" end="" exception="" in="" of="" password="" previous="" public="" roles="" snippet="" throws="" user="" uthenticationmanagerbuilder="" utowired="" void="">
//    .and()
//    .withUser('admin').password('admin').roles('ADMIN');

}
