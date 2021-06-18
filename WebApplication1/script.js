
function clickresponce() {
    const btn = document.querySelector('#Button1');
    const sb = document.querySelector('#unique');
        /*event.preventDefault();*/
        /*alert(sb.value)*/
        if(sb.value==1)
        {
            var rupee = document.getElementById('TextBox1').value;
            var dollar = parseInt(rupee);
            dollar = dollar / 156.06;
            document.getElementById('TextBox2').value = dollar;
        }
        else if(sb.value==2)
        {
  
            var rupee = document.getElementById('TextBox1').value;
            var dollar = parseInt(rupee);
            dollar = dollar / 100;
            document.getElementById('TextBox2').value = dollar;
        }
        else
        {
            alert(sb.value);
        }
    return false;
}
function clickresponce1()
{
    const btn = document.querySelector('#Button2');
    const sb = document.querySelector('#unique');
        var dollar = document.getElementById('TextBox3').value;
        var rupee = parseInt(dollar);
        if (sb.value == 1) {
            rupee = rupee * 156.06;
            document.getElementById('TextBox4').value = rupee;
        }
        else if (sb.value== 2) {
            rupee = rupee * 100;
            document.getElementById('TextBox4').value = rupee;
             }
        else {
            alert(sb.value);
        }
    return false;
}
function clickresponce2() {
    const btn = document.querySelector('#Button3');
    const sb = document.querySelector('#unique');
        if (sb.value == 1) {
            document.getElementById('TextBox5').value = "USA Dollar";
        }
        else if (sb.value == 2) {
            document.getElementById('TextBox5').value = "Canadian Dollar";
        }
        else {
            alert(sb.value);
        }
        document.getElementById('TextBox6').value = "19L-2346";
    document.getElementById('TextBox1').value = " ";
    document.getElementById('TextBox2').value = " ";
    document.getElementById('TextBox3').value = " ";
    document.getElementById('TextBox4').value = " ";
    return false;
}