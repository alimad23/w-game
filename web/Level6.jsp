<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("username")==null) {
        response.sendRedirect("FirstPage.html");
    }
%>


<form action="LevelCompleteProcess.jsp" method="post">

    <script>
        var x = setInterval(function () {
            var time = document.getElementById("time").innerHTML;
            var second = parseInt(time.split(":")[1]);
            var minute = parseInt(time.split(":")[0]);
            second++;
            if (second == 60) {
                minute++;
                second = 0;
            }
            if (minute < 10 && second < 10) {
                document.getElementById("time").innerHTML = "0" + minute + ":0" + second;
            } else if (minute < 10 && second >= 10) {
                document.getElementById("time").innerHTML = "0" + minute + ":" + second;
            } else if (minute >= 10 && second < 10) {
                document.getElementById("time").innerHTML = minute + ":0" + second;
            } else {
                document.getElementById("time").innerHTML = minute + ":" + second;
            }
        }, 1000)
    </script>
    <script>
        function right(number) {

            var c1 = document.getElementById("mine").rows[number].cells[1].getAttribute("bgcolor");
            var c2 = document.getElementById("mine").rows[number].cells[2].getAttribute("bgcolor");
            var c3 = document.getElementById("mine").rows[number].cells[3].getAttribute("bgcolor");
            var c4 = document.getElementById("mine").rows[number].cells[4].getAttribute("bgcolor");
            var c5 = document.getElementById("mine").rows[number].cells[5].getAttribute("bgcolor");

            document.getElementById("mine").rows[number].cells[1].setAttribute("bgcolor", c5);
            document.getElementById("mine").rows[number].cells[2].setAttribute("bgcolor", c1);
            document.getElementById("mine").rows[number].cells[3].setAttribute("bgcolor", c2);
            document.getElementById("mine").rows[number].cells[4].setAttribute("bgcolor", c3);
            document.getElementById("mine").rows[number].cells[5].setAttribute("bgcolor", c4);

            var counter = document.getElementById("moves").innerHTML;
            var intCounter = parseInt(counter);
            intCounter++;
            document.getElementById("moves").innerHTML = intCounter;

            if (check()) {
                alert("DONE!");
                clearInterval(x);
                var hidden_moves = document.getElementById("hidden_moves");
                hidden_moves.setAttribute("value", document.getElementById("moves").innerHTML);
                var hidden_time = document.getElementById("hidden_time");
                hidden_time.setAttribute("value", document.getElementById("time").innerHTML);

            }


        }

        function left(number) {

            var c1 = document.getElementById("mine").rows[number].cells[1].getAttribute("bgcolor");
            var c2 = document.getElementById("mine").rows[number].cells[2].getAttribute("bgcolor");
            var c3 = document.getElementById("mine").rows[number].cells[3].getAttribute("bgcolor");
            var c4 = document.getElementById("mine").rows[number].cells[4].getAttribute("bgcolor");
            var c5 = document.getElementById("mine").rows[number].cells[5].getAttribute("bgcolor");

            document.getElementById("mine").rows[number].cells[1].setAttribute("bgcolor", c2);
            document.getElementById("mine").rows[number].cells[2].setAttribute("bgcolor", c3);
            document.getElementById("mine").rows[number].cells[3].setAttribute("bgcolor", c4);
            document.getElementById("mine").rows[number].cells[4].setAttribute("bgcolor", c5);
            document.getElementById("mine").rows[number].cells[5].setAttribute("bgcolor", c1);

            var counter = document.getElementById("moves").innerHTML;
            var intCounter = parseInt(counter);
            intCounter++;
            document.getElementById("moves").innerHTML = intCounter;


            if (check()) {
                alert("DONE!");
                clearInterval(x);
                var hidden_moves = document.getElementById("hidden_moves");
                hidden_moves.setAttribute("value", document.getElementById("moves").innerHTML);
                var hidden_time = document.getElementById("hidden_time");
                hidden_time.setAttribute("value", document.getElementById("time").innerHTML);

            }
        }

        function up(number) {
            var c1 = document.getElementById("mine").rows[1].cells[number].getAttribute("bgcolor");
            var c2 = document.getElementById("mine").rows[2].cells[number].getAttribute("bgcolor");
            var c3 = document.getElementById("mine").rows[3].cells[number].getAttribute("bgcolor");
            var c4 = document.getElementById("mine").rows[4].cells[number].getAttribute("bgcolor");
            var c5 = document.getElementById("mine").rows[5].cells[number].getAttribute("bgcolor");

            document.getElementById("mine").rows[1].cells[number].setAttribute("bgcolor", c2);
            document.getElementById("mine").rows[2].cells[number].setAttribute("bgcolor", c3);
            document.getElementById("mine").rows[3].cells[number].setAttribute("bgcolor", c4);
            document.getElementById("mine").rows[4].cells[number].setAttribute("bgcolor", c5);
            document.getElementById("mine").rows[5].cells[number].setAttribute("bgcolor", c1);


            var counter = document.getElementById("moves").innerHTML;
            var intCounter = parseInt(counter);
            intCounter++;
            document.getElementById("moves").innerHTML = intCounter;


            if (check()) {
                alert("DONE!");
                clearInterval(x);
                var hidden_moves = document.getElementById("hidden_moves");
                hidden_moves.setAttribute("value", document.getElementById("moves").innerHTML);
                var hidden_time = document.getElementById("hidden_time");
                hidden_time.setAttribute("value", document.getElementById("time").innerHTML);

            }
        }

        function down(number) {
            var c1 = document.getElementById("mine").rows[1].cells[number].getAttribute("bgcolor");
            var c2 = document.getElementById("mine").rows[2].cells[number].getAttribute("bgcolor");
            var c3 = document.getElementById("mine").rows[3].cells[number].getAttribute("bgcolor");
            var c4 = document.getElementById("mine").rows[4].cells[number].getAttribute("bgcolor");
            var c5 = document.getElementById("mine").rows[5].cells[number].getAttribute("bgcolor");

            document.getElementById("mine").rows[1].cells[number].setAttribute("bgcolor", c5);
            document.getElementById("mine").rows[2].cells[number].setAttribute("bgcolor", c1);
            document.getElementById("mine").rows[3].cells[number].setAttribute("bgcolor", c2);
            document.getElementById("mine").rows[4].cells[number].setAttribute("bgcolor", c3);
            document.getElementById("mine").rows[5].cells[number].setAttribute("bgcolor", c4);


            var counter = document.getElementById("moves").innerHTML;
            var intCounter = parseInt(counter);
            intCounter++;
            document.getElementById("moves").innerHTML = intCounter;

            if (check()) {
                alert("DONE!");
                clearInterval(x);
                var hidden_moves = document.getElementById("hidden_moves");
                hidden_moves.setAttribute("value", document.getElementById("moves").innerHTML);
                var hidden_time = document.getElementById("hidden_time");
                hidden_time.setAttribute("value", document.getElementById("time").innerHTML);

            }
        }

        function check() {
            var end = document.getElementById("end");
            var mine = document.getElementById("mine");
            var loop;
            var innerLoop;

            for (loop = 1; loop < 6; loop++) {
                for (innerLoop = 1; innerLoop < 6; innerLoop++) {
                    if (mine.rows[loop].cells[innerLoop].getAttribute("bgcolor") !== end.rows[loop - 1].cells[innerLoop - 1].getAttribute("bgcolor")) {
                        return false;
                    }
                }
            }
            return true;
        }
    </script>

    <html>
    <head>
        <title>Level 6</title>
    </head>
    <body>
    <center>
        <TABLE width="150" height="150" border="0" id="end">
            <TR height="30">
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
            </TR>
            <TR height="30">
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
            </TR>
            <TR height="30">
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
            </TR>
            <TR height="30">
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
            </TR>
            <TR height="30">
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
            </TR>
        </TABLE>
    </center>
    <br/><br/>
    <%--<center> this is the main table </center>--%>
    <center>
        <TABLE width="210" height="210" border="0" id="mine">
            <TR height="30">
                <TD width="30"></TD>
                <TD width="30"><input type="button" style="background-image: url('up.png')" onclick="up(1)"></TD>
                <TD width="30"><input type="button" style="background-image: url('up.png')" onclick="up(2)"></TD>
                <TD width="30"><input type="button" style="background-image: url('up.png')" onclick="up(3)"></TD>
                <TD width="30"><input type="button" style="background-image: url('up.png')" onclick="up(4)"></TD>
                <TD width="30"><input type="button" style="background-image: url('up.png')" onclick="up(5)"></TD>
                <TD width="30"></TD>
            </TR>
            <TR height="30">
                <TD width="30"><input type="button" style="background-image: url('left.png')" onclick="left(1)"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30"><input type="button" style="background-image: url('right.png')" onclick="right(1)"></TD>
            </TR>
            <TR height="30">
                <TD width="30"><input type="button" style="background-image: url('left.png')" onclick="left(2)"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30"><input type="button" style="background-image: url('right.png')" onclick="right(2)"></TD>
            </TR>
            <TR height="30">
                <TD width="30"><input type="button" style="background-image: url('left.png')" onclick="left(3)"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30"><input type="button" style="background-image: url('right.png')" onclick="right(3)"></TD>
            </TR>
            <TR height="30">
                <TD width="30"><input type="button" style="background-image: url('left.png')" onclick="left(4)"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="red"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30"><input type="button" style="background-image: url('right.png')" onclick="right(4)"></TD>
            </TR>
            <TR height="30">
                <TD width="30"><input type="button" style="background-image: url('left.png')" onclick="left(5)"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="#daa520"></TD>
                <TD width="30" bgcolor="green"></TD>
                <TD width="30"><input type="button" style="background-image: url('right.png')" onclick="right(5)"></TD>
            </TR>
            <TR height="30">
                <TD width="30"></TD>
                <TD width="30"><input type="button" style="background-image: url('down.png')" onclick="down(1)"></TD>
                <TD width="30"><input type="button" style="background-image: url('down.png')" onclick="down(2)"></TD>
                <TD width="30"><input type="button" style="background-image: url('down.png')" onclick="down(3)"></TD>
                <TD width="30"><input type="button" style="background-image: url('down.png')" onclick="down(4)"></TD>
                <TD width="30"><input type="button" style="background-image: url('down.png')" onclick="down(5)"></TD>
                <TD width="30"></TD>
            </TR>
        </TABLE>
        <br/> <br/>
    </center>
    <center>
        <p id="moves">0</p>
        <br/>
        <p id="time">00:00</p>
        <p>press the button if you want to submit your records!</p>
        <input type="submit" value="Submit">
        <input type="hidden" name="moves" id="hidden_moves">
        <input type="hidden" name="time" id="hidden_time">
        <input type="hidden" name="level" value="6">


    </center>
    </body>
    </html>
</form>