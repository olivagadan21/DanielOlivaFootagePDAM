package com.danieloliva.FootageBackend.security;

import com.danieloliva.FootageBackend.security.jwt.JwtAccessDeniedHandler;
import com.danieloliva.FootageBackend.security.jwt.JwtAuthorizationFilter;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.Collections;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Configuration
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final PasswordEncoder passwordEncoder;
    private final UserDetailsService userDetailsService;
    private final AuthenticationEntryPoint authenticationEntryPoint;
    private final JwtAuthorizationFilter filter;
    private final JwtAccessDeniedHandler accessDeniedHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .exceptionHandling()
                .authenticationEntryPoint(authenticationEntryPoint)
                .accessDeniedHandler(accessDeniedHandler)
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)

                .and()
                .authorizeRequests()
                //auth
                .antMatchers(HttpMethod.POST, "/auth/login").permitAll()
                .antMatchers(HttpMethod.POST, "/auth/register/user").permitAll()
                .antMatchers(HttpMethod.POST, "/auth/register/admin").hasRole("ADMIN")
                //usuario
                .antMatchers(HttpMethod.GET, "/usuarios/").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/usuarios/premium").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/usuarios/admin").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/usuarios/user").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/usuarios/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/usuarios/{id}").hasRole("ADMIN")
                //producto

                //seccion
                .antMatchers(HttpMethod.GET, "/seccion/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/seccion/").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/seccion/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/seccion/{id}").hasRole("ADMIN")
                //categoria
                .antMatchers(HttpMethod.GET, "/categoria/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/categoria/").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/categoria/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/categoria/{id}").hasRole("ADMIN")
                //talla
                .antMatchers(HttpMethod.GET, "/talla/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/talla/").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/talla/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/talla/{id}").hasRole("ADMIN")
                //marca
                .antMatchers(HttpMethod.GET, "/marca/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/marca/").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/marca/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/marca/{id}").hasRole("ADMIN")
                //anuncio
                .antMatchers(HttpMethod.GET, "/anuncio/").hasRole("ADMIN")
                .antMatchers(HttpMethod.POST, "/anuncio/").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/anuncio/{id}").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/anuncio/{id}").hasRole("ADMIN")
                .antMatchers("/h2-console/**").permitAll()
                .anyRequest().authenticated();

        http.addFilterBefore(filter, UsernamePasswordAuthenticationFilter.class);
        http.headers().frameOptions().disable();

    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("GET","POST", "DELETE"));
        configuration.setAllowedHeaders(Collections.singletonList("*"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}