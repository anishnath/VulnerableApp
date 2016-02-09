<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="left">

<h3>Navigation</h3>
<ul>
		    <li><a href="command.jsp"><font size="2px">Command Injection</font></a></li>
            <li><a href="command-injection.jsp"><font size="2px">Command Injection File Download</font> </a></li>
            <li><a href="upload.jsp"><font size="2px">Unrestrcited File Upload </font></a></li>
            <li><a href="cross-site.jsp"><font size="2px">Cross Site Scripting (XSS)</font></a></li>
            <li><a href="csrftest.jsp"><font size="2px">Cross Site Request Forgery (CSRF) </font> </a></li>
            <li><a href="clickjack.jsp"><font size="2px">ClickJacking </font> </a></li>
            <li><a href="informationleakage.jsp"><font size="2px">Information Leakage </font> </a></li>
            <li><a href="httpmethod.jsp"><font size="2px">HTTP TRACE/TRACK Method</font> </a></li>
            <li><a href="/HTTPOnly"><font size="2px">HttpOnly Flag Cookie Protection</font> </a></li>
            <li><a href="sqlinjection1.jsp"><font size="2px">SQL Injection</font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">LDAP Injection<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">XML Injection<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">XPATH Injection<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">Heartbleed check<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">Poddle Check<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">CVE Testing<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">Buffer/Integer Overflow<small>*</small></font> </a></li>  </li>
            <li><a href="preview.jsp"><font size="2px">XSS/XML Validation Overflow<small>*</small></font> </a></li>  </li>
			
</ul>


<h3>Support</h3>

	

	
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<table>
<tr><td><input type="hidden" name="on0" value="JUST $1 SUPPORT">JUST $1 SUPPORT</td></tr><tr><td><input type="text" name="os0" maxlength="200"></td></tr>
</table>
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>
</div>

<div class="leftbottom"> </div>

<div style="clear: both;"> </div>

<div id="footer">
<div class="footerleft">Copyright &copy; 2016 by <a href="#"></a> | <a href="#">Privacy Policy</a> | <a href="#">Copyright</a></div>
<div style="clear: both;"> </div>
</div>