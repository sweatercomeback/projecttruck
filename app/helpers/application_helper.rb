# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def getYears
    arrYears = Array(1917..Time.now.year) #
    arrYears = arrYears.reverse
    
    
    return arrYears
   end
end
