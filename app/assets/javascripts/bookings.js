function checkDate() {
  var picked_date = Date.parse(document.getElementById('booking_date').value);
  var now = new Date();
  now.setHours(0, 0, 0, 0);
  if (now >= picked_date) {
    alert("Datumet du valt är inte i framtiden!");
    return false;
  } else {
    return true;
  }
}
