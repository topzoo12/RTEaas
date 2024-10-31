package egovframework.zieumtn.common.service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator
{
  protected static String username = "";
  protected static String password = "";

  public SMTPAuthenticator(String user, String pwd)
  {
      username = user;
      password = pwd;
  }

  public PasswordAuthentication getPasswordAuthentication()
  {
      return new PasswordAuthentication(username, password);
  }
}