package pl.coderslab;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * @TODO - change antMatchers after development
     */

    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/user/**","/boards/**").hasRole("USER") // Only users with role USER can access /user/**
                .antMatchers("/admin/**").hasRole("ADMIN") // Only users with role ADMIN can access /admin/**
                .antMatchers("/login", "/register", "/").permitAll() // Allow public access to login, register, and home page
                .anyRequest().authenticated() // All other requests need to be authenticated
                .and()
                .formLogin()
                .loginPage("/login") // Custom login page
                .defaultSuccessUrl("/boards/list") // Redirect to user list after successful login
                .permitAll()
                .and()
                .logout()
                .logoutSuccessUrl("/") // Redirect to home page after logout
                .permitAll()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/403"); // Custom access denied page

        return http.build();
    }

}