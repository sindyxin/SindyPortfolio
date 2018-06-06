# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

readys = undefined #declaring undefined nuthing will happen

#-> declaring afunction
readys = -> 
  #.sortable is class from portfolio index.html.erb
  $('.sortable').sortable()
  return
$(document).ready readys
