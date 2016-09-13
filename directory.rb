# get student info from user
def input_students
  puts "Please enter the student's information"
  puts "When you're done entering information, just hit return twice"
  # create an empty array
  students = []

  while true
    puts "Enter full name:"
    name = gets[0...-1]
    break if name.empty?
      puts "Enter cohort (e.g. 'February 2016'):"
      cohort = gets[0...-1]
      if cohort == ''
        cohort = 'September 2016'
      end
      puts "Enter main hobby:"
      hobby = gets[0...-1]
      if hobby == ''
        hobby = 'n/a'
      end
      puts "Enter location:"
      location = gets[0...-1]
      if location == ''
        location = 'London'
      end
    students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym, location: location.to_sym}
    puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

# Task: rewrite the each() method that prints all students using while or until control flow methods
def print_students(students)
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

# Task: print students grouped by cohorts
def print_cohorts(students)
  # create list of existing cohorts - method could be improved by creating this list automatically from the directory
  cohorts = ['February 2016','April 2016','September 2016']
  # iterate through the cohorts array one cohort at a time
  cohorts.map do |month|
    # convert the month to a symbol (since we're doing that during the input stage)
    month = month.to_sym
    # iterate through the students array
    students.find do |student|
      # if the student's cohort matches the current month in the cohort array, puts the student's information
      if student[:cohort] == month
        puts "#{student[:name]} (#{student[:cohort]} cohort), main hobby: #{student[:hobby]}, location: #{student[:location]})".center(100)
      end
      # add a line break between cohorts
      puts
    end
  end
end

def print_footer(names)
  if names.length == 1
    puts  "Overall, we have #{names.count} great student".center(100)
  else
    puts "Overall, we have #{names.count} great students".center(100)
  end
end

# The following array of hashes is for use in quick testing
# students = [{name: "Hatty Jones", cohort: 'April 2016', hobby: 'climbing', location: 'Berlin'},
#              {name: "Rosie Gollancz", cohort: 'February 2016', hobby: 'trapeze', location: 'San Francisco'},
#              {name: "Lauren Ingram", cohort: 'September 2016', hobby: 'juggling', location: 'Austin'},
#              {name: "Ruby Doobey", cohort: 'April 2016', hobby: 'climbing', location: 'Geneva'}]

students = input_students
print_header
print_students(students)
# print_cohorts(students)
print_footer(students)
