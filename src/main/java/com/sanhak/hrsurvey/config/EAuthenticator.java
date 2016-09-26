package com.sanhak.hrsurvey.config;

import javax.mail.PasswordAuthentication;

public class EAuthenticator extends javax.mail.Authenticator {
   public PasswordAuthentication getPasswordAuthentication(){
      String username = "heejulee";
      String password = "glwnr222";
      return new PasswordAuthentication(username, password);
   }
}
