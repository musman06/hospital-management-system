<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="Covid19Project.Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor</title>
    <link rel="stylesheet" href="style3.css"/>
</head>
<body>
    <form runat="server">
    <div class= "Background">
     <div class="Side">
         <button onclick="AP()" type="button" class="click">Add Doctor</button>
		 <button onclick="DP()" type="button" class="click">Delete Doctor</button>
		 <button onclick="SP()" type="button" class="click">Search Doctor Details</button>
         <asp:Button ID="Button3" runat="server" type="button" class="click" Text="View All Doctor Details" OnClick="Button3_Click"/>
		 <asp:Button ID="Button4" runat="server" type="button" class="click" Text="Total Doctors" OnClick="Button4_Click" />
		 <button onclick="VPS()" type="button" class="click">View All Patients In A Ward</button>
		 <button onclick="ASP()" type="button" class="click">View All Patients Assigned to A Doctor</button>
		 <button onclick="PDW()" type="button" class="click">View All Patients And Doctors In A Ward</button>
		 <asp:Button ID="Button1" runat="server" type="button" class="click1" Text="Go Back" OnClick="Button1_Click"/>
		 <asp:Button ID="Button2" runat="server" type="button" class="click2" Text="Log Out" OnClick="Button2_Click"/>
     </div>
	 <div class="DisplayBox">
	     <h1 style="background:linear-gradient(to right, #3eadcf, #abe9cd);position:absolute; left:250px;border-radius: 5px;border-style:double;">Display Box</h1>
         <br /> 
         <br />
         <br />
         <br />
         <asp:GridView style="margin:auto;" ID="GridView1" runat="server"> </asp:GridView>
	 </div>
	 
	 <div class="AllForms">
	     <h1 style="background:linear-gradient(to right, #3eadcf, #abe9cd);position:absolute; left:70px;border-radius: 5px;border-style:double;">Input Box</h1>
		 <div hidden="hidden" id ="demo" class="Doctor1">
                 <asp:TextBox ID="Doctor11" runat="server" type="text" class="input" placeholder="Doctor Name"></asp:TextBox>
                 <asp:TextBox ID="Doctor12" runat="server" type="text" class="input" placeholder="Doctor Address"></asp:TextBox>
                 <asp:TextBox ID="Doctor13" runat="server" type="text" class="input" placeholder="Doctor Age"></asp:TextBox>
                 <asp:TextBox ID="Doctor14" runat="server" type="text" class="input" placeholder="Doctor Gender"></asp:TextBox>
                 <asp:Button  ID="Button5" runat="server" type="button" class="click3" Text="Submit" OnClick="Button5_Click"  ></asp:Button>
		 </div>
		 <div hidden="hidden" id="demo1" class="Doctor2">
                 <asp:TextBox ID="Doctor21" runat="server" type="text" class="input" placeholder="Enter Doctor ID"></asp:TextBox>
		         <asp:Button  ID="Button6" runat="server" type="button" class="click3" Text="Submit" OnClick="Button6_Click"  ></asp:Button>
		 </div>
		 <div hidden="hidden" id="demo2" class="Doctor3">
		         <asp:TextBox ID="Doctor31" runat="server" type="text" class="input" placeholder="Enter Doctor ID"></asp:TextBox>
		         <asp:Button  ID="Button7" runat="server" type="button" class="click3" Text="Submit" OnClick="Button7_Click"  ></asp:Button>
		 </div>
		 <div hidden="hidden" id="demo3" class="Doctor4">
				 <asp:TextBox ID="Doctor41" runat="server" type="text" class="input" placeholder="Enter Doctor ID"></asp:TextBox>
		         <asp:Button  ID="Button8" runat="server" type="button" class="click3" Text="Submit" OnClick="Button8_Click" ></asp:Button>
		 </div>
		 <div hidden="hidden" id="demo4" class="Doctor5">
                 <asp:TextBox ID="Doctor51" runat="server" type="text" class="input" placeholder="Enter Ward ID"></asp:TextBox>
		         <asp:Button  ID="Button9" runat="server" type="button" class="click3" Text="Submit" OnClick="Button9_Click" ></asp:Button>
		 </div>
		 <div hidden="hidden" id="demo5" class="Doctor6">
		         <asp:TextBox ID="Doctor61" runat="server" type="text" class="input" placeholder="Enter Ward ID"></asp:TextBox>
		         <asp:Button  ID="Button10" runat="server" type="button" class="click3" Text="Submit" OnClick="Button10_Click"  ></asp:Button>
		 </div>
	 </div>
	 
</div>
<script>
    var x = 0;
    function AP() {
        if ((window.getComputedStyle(document.getElementById("demo5")).display == "none") && (window.getComputedStyle(document.getElementById("demo1")).display == "none") && (window.getComputedStyle(document.getElementById("demo2")).display == "none") && (window.getComputedStyle(document.getElementById("demo3")).display == "none") && (window.getComputedStyle(document.getElementById("demo4")).display == "none")) {
            if (x == 1) {
                document.getElementById("demo").style.display = "none";
                return x = 0;
            }
            else {
                document.getElementById("demo").style.display = "inline";
                return x = 1;
            }
        }
    }
    var y = 0;
    function DP() {
        if ((window.getComputedStyle(document.getElementById("demo5")).display == "none") && (window.getComputedStyle(document.getElementById("demo")).display == "none") && (window.getComputedStyle(document.getElementById("demo2")).display == "none") && (window.getComputedStyle(document.getElementById("demo3")).display == "none") && (window.getComputedStyle(document.getElementById("demo4")).display == "none")) {
            if (y == 1) {
                document.getElementById("demo1").style.display = "none";
                return y = 0;
            }
            else {
                document.getElementById("demo1").style.display = "inline";
                return y = 1;
            }
        }
    }
    var z = 0;
    function SP() {
        if ((window.getComputedStyle(document.getElementById("demo5")).display == "none") && (window.getComputedStyle(document.getElementById("demo")).display == "none") && (window.getComputedStyle(document.getElementById("demo1")).display == "none") && (window.getComputedStyle(document.getElementById("demo3")).display == "none") && (window.getComputedStyle(document.getElementById("demo4")).display == "none")) {
            if (z == 1) {
                document.getElementById("demo2").style.display = "none";
                return z = 0;
            }
            else {
                document.getElementById("demo2").style.display = "inline";
                return z = 1;
            }
        }
    }
    var a = 0;
    function ASP() {
        if ((window.getComputedStyle(document.getElementById("demo5")).display == "none") && (window.getComputedStyle(document.getElementById("demo")).display == "none") && (window.getComputedStyle(document.getElementById("demo1")).display == "none") && (window.getComputedStyle(document.getElementById("demo2")).display == "none") && (window.getComputedStyle(document.getElementById("demo4")).display == "none")) {
            if (a == 1) {
                document.getElementById("demo3").style.display = "none";
                return a = 0;
            }
            else {
                document.getElementById("demo3").style.display = "inline";
                return a = 1;
            }
        }
    }
    var b = 0;
    function VPS() {
        if ((window.getComputedStyle(document.getElementById("demo5")).display == "none") && (window.getComputedStyle(document.getElementById("demo")).display == "none") && (window.getComputedStyle(document.getElementById("demo1")).display == "none") && (window.getComputedStyle(document.getElementById("demo2")).display == "none") && (window.getComputedStyle(document.getElementById("demo3")).display == "none")) {
            if (b == 1) {
                document.getElementById("demo4").style.display = "none";
                return b = 0;
            }
            else {
                document.getElementById("demo4").style.display = "inline";
                return b = 1;
            }
        }
    }
    var c = 0;
    function PDW() {
        if ((window.getComputedStyle(document.getElementById("demo4")).display == "none") && (window.getComputedStyle(document.getElementById("demo")).display == "none") && (window.getComputedStyle(document.getElementById("demo1")).display == "none") && (window.getComputedStyle(document.getElementById("demo2")).display == "none") && (window.getComputedStyle(document.getElementById("demo3")).display == "none")) {
            if (c == 1) {
                document.getElementById("demo5").style.display = "none";
                return c = 0;
            }
            else {
                document.getElementById("demo5").style.display = "inline";
                return c = 1;
            }
        }
    }
</script>
    </form>
</body>
</html>
