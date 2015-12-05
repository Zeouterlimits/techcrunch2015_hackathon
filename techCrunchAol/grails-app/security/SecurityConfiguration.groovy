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
        http
                .authorizeRequests()
                .antMatchers('/venue/**').hasAnyRole('VENUE', 'ARTIST')
                .antMatchers('/artist/**').hasAnyRole('VENUE', 'ARTIST')
                .antMatchers('/').permitAll()
                .and()
                .formLogin().permitAll()
                .and()
                .logout().permitAll()
    }

//    @Bean
//    public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
//        final Properties users = new Properties();
//        users.put("artist","pass","ARTIST", enabled); //add whatever other user you need
//        users.put("venue","pass", "VENUE", enabled);
//        return new InMemoryUserDetailsManager(users);
//    }

    //<-- --="" .inmemoryauthentication="" .withuser="" auth="" code="" configureglobal="" end="" exception="" in="" of="" password="" previous="" public="" roles="" snippet="" throws="" user="" uthenticationmanagerbuilder="" utowired="" void="">
//    .and()
//    .withUser('admin').password('admin').roles('ADMIN');

}
