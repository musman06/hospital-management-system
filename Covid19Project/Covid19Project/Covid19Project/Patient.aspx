<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="Covid19Project.Patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient</title>
    <link rel="stylesheet" href="style1.css"/>
</head>
<body>
    <form runat="server">
        <div class= "Background">
     <div class="Side">
         <button onclick="AP()" type="button" class="click">Add Patient</button>
		 <button onclick="DP()" type="button" class="click">Delete Patient</button>
		 <button onclick="SP()" type="button" class="click">Search Patient Details</button>
		 <asp:Button ID="Button3" runat="server" type="button" class="click" Text="View All Patient Details" OnClick="Button3_Click"/>
		 <asp:Button ID="Button4" runat="server" type="button" class="click" Text="Total Patients" OnClick="Button4_Click" />
		 <button onclick="VPS()" type="button" class="click">View Patient Symptoms</button>
		 <button onclick="ASP()" type="button" class="click">Add Patient Symptom</button>
         <button onclick="ADP()" type="button" class="click">Assign Doctor to Patient</button>
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
         <p id="SS" onclick="Verification()" hidden="hidden"  style="margin:auto;">Success</p>
	 </div>
	 
	 <div class="AllForms">
	     <h1 style="background:linear-gradient(to right, #3eadcf, #abe9cd);position:absolute; left:70px;border-radius: 5px;border-style:double;">Input Box</h1>
		 <div hidden="hidden" id ="demo" class="Patient1">
                 <asp:TextBox ID="Patient11" runat="server" type="text" class="input" placeholder="Patient Name"></asp:TextBox>
			     <asp:TextBox ID="Patient12" runat="server" type="text" class="input" placeholder="Patient Address"></asp:TextBox>
                 <asp:TextBox ID="Patient13" runat="server" type="text" class="input" placeholder="Patient Age"></asp:TextBox>
			     <asp:TextBox ID="Patient14" runat="server" type="text" class="input" placeholder="Patient Gender"></asp:TextBox>
                 <asp:TextBox ID="Patient15" runat="server" type="text" class="input" placeholder="Patient Blood Group"></asp:TextBox>
                 <asp:TextBox ID="Patient16" runat="server" type="text" class="input" placeholder="Contact"></asp:TextBox>
				 <asp:TextBox ID="Patient17" runat="server" type="text" class="input" placeholder="Patient WardID"></asp:TextBox>
                 <asp:TextBox ID="Patient18" runat="server" type="text" class="input" placeholder="Patient RoomNo"></asp:TextBox>
				 <asp:TextBox ID="Patient19" runat="server" type="text" class="input" placeholder="Patient DoctorID"></asp:TextBox>
                 <asp:Button  ID="Button7" runat="server" type="button" class="click3" Text="Submit" OnClick="Button7_Click"  ></asp:Button>
		 </div>
		 <div  hidden="hidden" id="demo1" class="Patient2">
		         <asp:TextBox ID="Patient21" runat="server" type="text" class="input" placeholder="Enter Patient ID"></asp:TextBox>
                 <asp:Button  ID="Button8" runat="server" type="button" class="click3" Text="Submit" OnClick="Button8_Click" ></asp:Button>
		 </div>
		 <div  hidden="hidden" id="demo2" class="Patient3">
		         <asp:TextBox ID="Patient31" runat="server" type="text" class="input" placeholder="Enter Patient ID"></asp:TextBox>
		         <asp:Button  ID="Button5" runat="server" type="button" class="click3" Text="Submit" OnClick="Button5_Click" ></asp:Button>
		 </div>
		 <div  hidden="hidden" id="demo3" class="Patient4">
                 <asp:TextBox ID="Patient41" runat="server" type="text" class="input" placeholder="Enter Symptom"></asp:TextBox>
                 <asp:TextBox ID="Patient42" runat="server" type="text" class="input" placeholder="Enter Patient ID"></asp:TextBox>
				 <asp:Button  ID="Button9" runat="server" type="button" class="click3" Text="Submit" OnClick="Button9_Click" ></asp:Button>
		 </div>
		 <div  hidden="hidden" id="demo4" class="Patient5">
                 <asp:TextBox ID="Patient51" runat="server" type="text" class="input" placeholder="Enter Patient ID"></asp:TextBox>
		         <asp:Button  ID="Button6" runat="server" type="button" class="click3" Text="Submit" OnClick="Button6_Click"  ></asp:Button>
		 </div>
         <div  hidden="hidden" id="demo5" class="Patient6">
                 <asp:TextBox ID="Patient61" runat="server" type="text" class="input" placeholder="Enter Patient ID"></asp:TextBox>
                 <asp:TextBox ID="Patient62" runat="server" type="text" class="input" placeholder="Enter Doctor ID"></asp:TextBox>
                 <asp:Button  ID="Button10" runat="server" type="button" class="click3" Text="Submit" OnClick="Button10_Click"  ></asp:Button>
         </div>
	 </div>
	 
</div>
    </form>
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
    function ADP() {
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
    function Verification()
    {
        document.getElementById("SS").style.display("inline");
    }
</script>
    
</body>
</html>
