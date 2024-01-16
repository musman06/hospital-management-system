<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Covid19Project.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
	 <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <form runat="server">
        <div class= "Background">
	     <div class= "Form">
		     <div class="ButtonDivision">
			     <div id="butt"></div> 
		         <button type="button" class="click" onclick="Log()">Log In</button>
			     <button type="button" class="click" onclick="Sign()">Sign Up</button>
			 </div>
			 <div class="paragraph">
			     <p>Enter Details</p>
			 </div>
			 <div id ="Log"  class="inputMain">
                 <asp:TextBox ID="TextBox4" runat="server" class="input" placeholder="User Name" ></asp:TextBox>
                 <asp:TextBox ID="TextBox5" runat="server" class="input" placeholder="Enter Password" TextMode="Password" ></asp:TextBox>
                 <br />
                 <div class="paragraph">
                 <p hidden="hidden" onclick="Verify()" id="v1" >User Name or Password is Incorrect</p>
                 </div>
                 <asp:Button ID="Button1" runat="server" Text="Proceed" class="sub" OnClick="Button1_Click"/>
			 </div>
			 <div id= "signup" class="inputMain">
                 <asp:TextBox ID="TextBox1" runat="server" class="input" placeholder="User Name" ></asp:TextBox>
                 <asp:TextBox ID="TextBox3" runat="server" class="input" placeholder="Password" ></asp:TextBox>
                 <br />
                 <div class="paragraph">
                 <p hidden="hidden" onclick="Verify1()" id="v2" >Please Enter a Suitable UserName or Password</p>
                 <p hidden="hidden" onclick="Verify2()" id="v3" >The UserName Already Exists</p>
                 <p hidden="hidden" onclick="Verify3()" id="v4" >Registered</p>
                 </div>
                 <asp:Button ID="R1" runat="server" Text="Register" class="sub" OnClick="R1_Click" />
			 </div>
	     </div>
		 
	 </div>

     <script>
         var x = document.getElementById("Log");
         var y = document.getElementById("signup");
         var z = document.getElementById("butt");
         function Sign() {
             x.style.left = "-400px";
             y.style.left = "50px";
             z.style.left = "110px";
         }
         function Log() {
             x.style.left = "50px";
             y.style.left = "450px";
             z.style.left = "0px";
         }
         function Verify()
         {
             document.getElementById("v1").style.display = "inline";
         }
         function Verify1() {
             document.getElementById("v2").style.display = "inline";
         }
         function Verify2() {
             document.getElementById("v3").style.display = "inline";
         }
         function Verify3() {
             document.getElementById("v4").style.display = "inline";
         }

	 </script>
    </form>
</body>
</html>
