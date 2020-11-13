/* global CanvasJS */

function AAA()
{
    alert("AAAAAAAAAA");
}
function LoadPage(pagename){
    openPage(pagename);
}
function SetRedirect(pagename,id){
    var page = document.getElementById('pagere');
    var idre = document.getElementById('idre');
    page.value=pagename;
    idre.value=id;
    document.getElementById("re").submit();
}
function openPage(pageName) {
// Hide all elements with class="tabcontent" by default */
var i, tabcontent;
tabcontent = document.getElementsByClassName("divcontent");
for (i = 0; i < tabcontent.length; i++) {
  tabcontent[i].style.display = "none";
}
document.getElementById(pageName).style.display = "block";
}
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  var d = new Date();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('time').innerHTML =d.toDateString()+" "+
  h + ":" + m + ":" + s;
  
  var elms = document.querySelectorAll("[id='time']");
  for(var i = 0; i < elms.length; i++) 
  {
       elms[i].innerHTML =d.toDateString()+" "+
         h + ":" + m + ":" + s;
  }
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i;}  // add zero in front of numbers < 10
  return i;
}

function miniTable(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
        else {
            content.style.display = "none";
            btn.innerHTML="+";
         }
}
function miniChart(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
    content.style.width="500px";
}





function openForm(fname) {
    document.getElementById(fname).style.display = "block";
}

function closeForm(fname) {
    document.getElementById(fname).style.display = "none";
}
function clickme(name){
    document.getElementById(name).click();
}
function FilterTable(name,inputid) {
    var input, filter, table, tr, td, i, txtValue,value;
    input = document.getElementById(inputid);
    filter = input.value.toUpperCase();
    table = document.getElementById(name);
    tr = table.getElementsByTagName("tr");
    value = parseInt(document.getElementById("empselect").value);
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[value];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } 
            else {
              tr[i].style.display = "none";
            }
        }       
    }
}

function creatchart1() {    
    var chart = new CanvasJS.Chart("chartContainer1", {
//        width:320,
        title:{
        text: "Top Sell"              
        },
        data: [//array of dataSeries              
                { //dataSeries object

                     /*** Change type "column" to "bar", "area", "line" or "pie"***/
                    type: "column",
                    dataPoints: [
                        { label: "Tháng 7", y: 18000 },
                        { label: "Tháng 8", y: 29000 },
                        { label: "Tháng 9", y: 40000 },                                    
                        { label: "Tháng 10", y: 34000 },
                        { label: "Tháng 11", y: 24000 }
                    ]
                }
        ],
        options: {
                maintainAspectRatio:false,
                responsive: false
        }
        }
        );
    chart.render();
//    alert("AAAAAAAAAAAAAAAAAAA");
}

function creatchart2() {
     var chart = new CanvasJS.Chart("chartContainer2", {

         title:{
         text: "Top Sell"              
         },
         data: [//array of dataSeries              
                     { //dataSeries object

                     /*** Change type "column" to "bar", "area", "line" or "pie"***/
                     type: "column",
                     dataPoints: [
                         { label: "Tháng 7", y: 18000 },
                         { label: "Tháng 8", y: 29000 },
                         { label: "Tháng 9", y: 40000 },                                    
                         { label: "Tháng 10", y: 34000 },
                         { label: "Tháng 11", y: 24000 }
                                 ]
                 }
         ],
         options: {
             responsive: false
         }
         }
         );
         chart.render();
}