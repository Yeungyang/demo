<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD id=Head1>
    <TITLE>人力资源管理系统</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <STYLE type=text/css>
        * {
            FONT-SIZE: 12px;
            COLOR: white
        }

        #logo {
            COLOR: white
        }

        #logo A {
            COLOR: white
        }

        FORM {
            MARGIN: 0px
        }
    </STYLE>
    <SCRIPT src="top/Clock.js" type=text/javascript></SCRIPT>
    <script language="JavaScript" type="text/JavaScript">
        function quit() {
            if (confirm("您确实要退出本系统吗？")) {
                window.location.href = "exitSave.jsp";
            }
        }
    </script>
    <META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY
        style="BACKGROUND-IMAGE: url(images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
<form id="form1">
    <DIV id=logo
         style="BACKGROUND-IMAGE: url(images/logo.png); BACKGROUND-REPEAT: no-repeat">
        <DIV
                style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
            <A
                    href="http://localhost:1479/Web/sys/Top.aspx#"><IMG src="top/mail.gif"
                                                                        align=absMiddle border=0></A> 您有新消息<A
                id=HyperLink1
                href="#">0</A>条 <IMG
                src="top/menu_seprator.gif" align=absMiddle> <A id=HyperLink2
                                                                href="manager_list.action" target="mainFrame"
                                                                onClick="javascript:;">返回首页</A> <IMG
                src="top/menu_seprator.gif" align=absMiddle> <A id=HyperLink3
                                                                href="javascript:quit()" target="_parent">退出系统</A></DIV>
        <DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
        <DIV
                style="BACKGROUND-IMAGE: url(images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
            <TABLE cellSpacing=0 cellPadding=0 width="100%">
                <TBODY>
                <TR>
                    <TD>
                        <DIV><IMG src="top/nav_pre.gif" align=absMiddle>欢迎 <SPAN
                                id=lblBra>系统管理员 </SPAN></DIV>
                    </TD>
                    <TD align=right width="70%"><SPAN style="PADDING-RIGHT: 50px"><A
                            href="javascript:history.go(-1);"><IMG src="top/nav_back.gif"
                                                                   align=absMiddle border=0>后退</A> <A
                            href="javascript:history.go(1);"><IMG
                            src="top/nav_forward.gif" align=absMiddle border=0>前进</A> <A
                            href="javascript:quit()" target=_top><IMG
                            src="top/nav_changePassword.gif" align=absMiddle border=0>重新登录</A> <A href="#"
                                                                                                  target=mainFrame><IMG
                            src="top/nav_resetPassword.gif"
                            align=absMiddle border=0>修改密码</A> <A
                            href="#" target=mainFrame><IMG
                            src="top/nav_help.gif" align=absMiddle border=0>帮助</A> <IMG
                            src="top/menu_seprator.gif" align=absMiddle> <SPAN
                            id=clock></SPAN></SPAN></TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
    </DIV>
    <SCRIPT type=text/javascript>
        var clock = new Clock();
        clock.display(document.getElementById("clock"));
    </SCRIPT>
</form>
</BODY>
</HTML>
