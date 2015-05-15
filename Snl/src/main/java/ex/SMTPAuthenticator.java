package ex;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @author Ray
 *
 */
public class SMTPAuthenticator extends Authenticator {

 protected PasswordAuthentication getPasswordAuthentication() {
  String username = "kyseleee@gmail.com"; // gmail 사용자;
  String password = "kbdl26444";  // 패스워드;
  return new PasswordAuthentication(username, password);
 }

}