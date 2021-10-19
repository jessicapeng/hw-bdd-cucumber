# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|  
  movies_table.hashes.each do |movie|
 # print("\n")
#  print(movie)
  Movie.create!(movie)
  
      # push movies to database
      
    # push moves into database
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2| 
   #check index of e1 appears before e2 
   #  page.body is the entire content of the page as a string.

   # print(page.body.class)
    html = page.body
    if html.index(e1) < html.index(e2)
        ret = true
    else
        ret = false
    end 
  
# fail "Unimplemented"
  ret 
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    ratings = rating_list.split(", ")
    if uncheck
        ratings.each{|x| uncheck(x)}
    else
        ratings.each{|x| check(x)}
    end 
  #  print("hellooooo")
 #   print("uncheck is")
 #   print(uncheck)
 #   print("ratings_list is")
 #   print(rating_list)
  #  print("\n")
  #  print("done")
  #  
  #  ratings.each{|x| I uncheck x}
  
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#  fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  html = page.body
  movies = ['Aladdin', 'The Terminator', 'When Harry Met Sally', 'The Help', 'Chocolat', 'Amelie', '2001: A Space Odyssey', 'The Incredibles','Raiders of the Lost Ark','Chicken Run']
  movies.each{ |m| 
      if html.index(m) == nil
          ret = false
      end
  }
  ret = true
  # fail "Unimplemented"
  ret
end


