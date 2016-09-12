# In the input_students method the cohort value is hard-coded. - DONE
# How can you ask for both the name and the cohort? - DONE
# What if one of the values is empty? Can you supply a default value? - DONE
# The input will be given to you as a string? How will you convert it to a symbol? - DONE
# What if the user makes a typo? - TO DO

# get student info from user
def input_students
  puts "Please enter the student's information"
  puts "When you're done entering information, just hit return twice"
  # create an empty array
  students = []
  # get the first student's details
  puts "Full name:"
  name = gets.chomp
    if name != ''
      puts "Cohort:"
      cohort = gets.chomp
      if cohort == ''
        cohort = 'Sep'
      end
      puts "Main hobby:"
      hobby = gets.chomp
      if hobby == ''
        hobby = 'n/a'
      end
      puts "Location:"
      location = gets.chomp
      if location == ''
        location = 'London'
      end
      end

  # while the name is not empty, repeat this code for all following students
  while !name.empty? do
    # add the student hash to the array
    students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym, location: location.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Full name:(leave empty if you've finished entering students)"
    name = gets.chomp
    if name != ''
      puts "Cohort:"
      cohort = gets.chomp
      if cohort == ''
        cohort = 'Sep'
      end
      puts "Main hobby:"
      hobby = gets.chomp
      if hobby == ''
        hobby = 'n/a'
      end
      puts "Location:"
      location = gets.chomp
      if location == ''
        location = 'London'
      end
      end
  end
    # return the array of students
    students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

# Task: rewrite the each() method that prints all students using while or until control flow methods
def print(students)
  # set a value that we will set the method to loop up until - i.e. the number of students in the students array
  print_total = students.length
  # set a counter to increase during each loop
  count = 0
  # keep looping until the print_total has been reached - i.e. until every element in the array has been run through
  while count < print_total
    # set the student variable to the item in the array (the hash) to be accessed, as determined by the counter
    student = students[count]
    puts "#{student[:name]} (#{student[:cohort]} cohort, main hobby: #{student[:hobby]}, location: #{student[:location]})".center(100)
    # increase
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)
