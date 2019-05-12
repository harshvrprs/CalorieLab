import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC57f700b2c50ac46e19e7be47481ba31a";
  public static final String AUTH_TOKEN = "df7a803c43edfabad09da30f1c4fc6e5";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.creator(new PhoneNumber("+15558675309"),
        new PhoneNumber("+15017250604"), 
        "This is the ship that made the Kessel Run in fourteen parsecs?").create();

    System.out.println(message.getSid());
  }
}