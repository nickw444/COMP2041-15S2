#!/usr/bin/python
import os
output_buffer = []
header_buffer = ["content-type: text/html"]

query_string = os.environ.get('QUERY_STRING')
## Or $ENV{"QUERY_STRING"} in perl

cookie = os.environ.get('HTTP_COOKIE', '')
## Or $ENV{"HTTP_COOKIE"} in Perl

#output_buffer.append(str(cookie or 'Not logged in'))

if (len(cookie.strip()) > 0):
   cookies = cookie.split(';')
   for cookie in cookies:
      cookie = cookie.split('=', 1)
      #output_buffer.append(cookie[0].strip() == 'currentUser')
      if (cookie and cookie[0] and cookie[0].strip() == 'currentUser'):
         pass
         output_buffer.append("Welcome, " + cookie[1])


if len(query_string.strip()):
   query_string = query_string.split('=')
if (len(query_string) > 0):
   output_buffer.append("User wants to set cookie")
   output_buffer.append(str(query_string))
   cookie_string = "Set-Cookie: currentUser=" + query_string[1];
   header_buffer.append(cookie_string)
   output_buffer.append(cookie_string)
   

print ("\n\r".join(header_buffer))
print ("\r\n\r\n")
print ("<br />\r\n".join(map(str, output_buffer)))
print ("<form><input type='text' name='cookieValue'/><input type='submit' value='Set the Cookie'/></form>");
#print ($COOKIE);
