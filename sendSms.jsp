<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.twilio.Twilio" %>
<%@ page import="com.twilio.rest.api.v2010.account.Message" %>
<%@ page import="com.twilio.type.PhoneNumber" %>
<%
final String ACCOUNT_SID = "AC57f700b2c50ac46e19e7be47481ba31a";
final String AUTH_TOKEN = "df7a803c43edfabad09da30f1c4fc6e5";
try{
Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

Message message = Message.creator(new PhoneNumber("+642041349959"),
    new PhoneNumber("+6498869510"), 
    "Hey Buddy").create();

System.out.println(message.getSid());
}
catch(Exception e){
	System.out.println(e);
}
%>