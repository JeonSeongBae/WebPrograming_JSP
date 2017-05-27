<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%@page import="javax.mail.Authenticator" %>
<%@page import="javax.mail.PasswordAuthentication" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   System.out.println(request.getParameter("ID").toString());
   System.out.println(request.getParameter("Email").toString());
   String ID = request.getParameter("ID").toString();
   String Email = request.getParameter("Email").toString();

   try {
      String sbj = "2017 웹프로그래밍(HW1) 회원가입을 위해 인증을 진행해주세요.";
      String src = "tjdqo007@gmail.com"; // 보내는사람 email주소
      String link = "http://localhost:8080/HW1/certification.jsp?ID=" + ID; // 인증을 완료할 jsp주소
      String msg = "<div><p>아래 버튼을 클릭하시면 회원가입이 완료됩니다.</p><br>";
      msg += "<form method='POST' action='" + link + "'><input type='submit' value='인증하기'></form></div>";
      
      Properties p = new Properties();
      
      p.put("mail.smtp.user", Email);
      p.put("mail.smtp.host", "smtp.gmail.com");
      
      p.put("mail.smtp.port", "465");
      p.put("mail.smtp.starttls.enable", "true");
      p.put("mail.smtp.auth", "true");
      p.put("mail.smtp.debug", "true");
      
      p.put("mail.smtp.socketFactory.port", "465");
      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      p.put("mail.smtp.socketFactory.fallback", "false"); // SMTP 서버에 접속하기 위한 정보들
      
      try { 
         Session mailSession = Session.getInstance(p, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication("tjdqo007@gmail.com","tjdqo1234"); // gmail 메일 ID / PWD 
            }
         });
         
         
         mailSession.setDebug(true); // Create a default MimeMessage object.
         
         Message message = new MimeMessage(mailSession); // Set From: header field of the header. 
         message.setFrom(new InternetAddress(src)); // Set To: header field of the header. 
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(Email)); // Set Subject: header field
         message.setSubject(sbj); // Now set the actual message 
         message.setContent(msg, "text/html; charset=UTF-8"); // 내용과 인코딩 // Send message 
         Transport.send(message); // System.out.println("Sent message successfully...."); // sResult = "Sent message successfully...."; 
      } catch (Exception e) {
         e.printStackTrace(); 
         System.out.println("Error: unable to send message...." + e.toString());
      } 
   } catch (Exception err){ 
      System.out.println(err.toString());
   }

%>

   <div>
      <span>인증 메일이 발송되었습니다. (<%=Email %>)로 발송된 이메일을 확인 후, 이메일에 첨부된 URL을 클릭하시면 회원가입이 완료됩니다.</span>
      <button onclick="location.href='loginPage.jsp'">홈으로</button>
   </div>
</body>
</html>