<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Covid19Project.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
	<link rel="stylesheet" href="style2.css"/>
</head>
<body>
    <form runat="server">
    <div class= "Background">
	     <div class= "Form">
			 <div class="paragraph">
			     <p style="font-size:30px;">Menu</p>
			 </div>
			     <asp:Button  ID="Button1" runat="server" type="submit" class="sub" Text="Manage Patients" OnClick="Button1_Click"/>
                 <asp:Button  ID="Button2" runat="server" type="submit" class="sub" Text="Manage Doctors" OnClick="Button2_Click"/>
                 <asp:Button  ID="Button3" runat="server" type="submit" class="sub" Text="Log Out" OnClick="Button3_Click"/>
	         </div>
			 </div>
    </form>
</body>
</html>
