
p "Adding Florida"
fla = Jurisdiction.find_or_create_by_name('Florida') do |j|
end

fla.move_to_child_of Jurisdiction.root

['Alachua County', 'Baker County', 'Bay County', 'Bradford County', "Brevard", 'Broward County', 'Calhoun County', 'Charlotte County', 'Citrus County', 'Clay County', 'Collier County', 
'Columbia County', 'Dade County', 'De Soto County','Dixie County', 'Duval County', 'Escambia County', 'Flagler County', 'Franklin County', 'Gadsden County','Gilchrist County', 
'Glades County', 'Gulf County', 'Hamilton County', 'Hardee County', 'Hendry County', 'Hernando County', 'Highlands County', 'Hillsborough County', 'Holmes County', 
'Indian River County', 'Jackson County', 'Jefferson County', 'Lafayette County', 'Lake County', 'Lee County', 'Leon County', 'Levy County', 'Liberty County', 'Madison County', 'Manatee County', 
'Marion County', 'Martin County', 'Monroe County', 'Nassau County', 'Okaloosa County', 'Okeechobee County', 'Orange County', 'Osceloa County', 'Palm Beach County', 'Pasco County', 
'Pinellas County', 'Polk County', 'Putnam County', 'St. Johns County', 'St. Lucie County', 'Santa Rosa County', 'Sarasota County', 'Seminole County', 'Sumter County', 'Suwannee County', 
'Taylor County', 'Union County', 'Volusia County', 'Wakulla County', 'Walton County', 'Washington County'].each do |county|
  j = Jurisdiction.find_or_create_by_name(county);
  j.move_to_child_of(fla)
end
