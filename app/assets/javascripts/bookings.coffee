@checkDate = ->
  picked_date = Date.parse document.getElementById('booking_date').value
  now = new Date
  now.setHours 0, 0, 0, 0

  if now >= picked_date
    alert 'Datumet du valt ligger inte i framtiden'
    return false
  else
    return true
