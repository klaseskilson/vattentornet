function checkDate(){
  var picked_date = Date.parse(document.getElementById('booking_date').value);
  var now = new Date();
  if(picked_date < now){
    alert("Datumet du valt är inte i framtiden!")
    return false;
  }else{
    return true;
  }
}
