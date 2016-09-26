package com.sanhak.hrsurvey.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:mailing/ScheduledMail.xml")
public class MailConfig {

}
