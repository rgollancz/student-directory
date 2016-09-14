@students = []

# get student info from user
def input_students
  puts "Please enter the student's information"
  puts "When you're done entering information, just hit return twice"

  while true
    puts "Enter full name:"
    name = gets.chomp
    break if name.empty?
      puts "Enter cohort (e.g. 'February 2016'):"
      cohort = gets.chomp
      if cohort == ''
        cohort = 'September 2016'
      end
      puts "Enter main hobby:"
      hobby = gets.chomp
      if hobby == ''
        hobby = 'n/a'
      end
      puts "Enter location:"
      location = gets.chomp
      if location == ''
        location = 'London'
      end
      puts 'You entered:'
      puts "Name: #{name}"
      puts "Cohort: #{cohort}"
      puts "Hobby: #{hobby}"
      puts "Location: #{location}"
      puts "Made a mistake? Enter 'x' to re-enter the information, or any other key to save."
      answer = gets.chomp
        if answer == 'x'
          puts "Student information deleted!"
        else
          @students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym, location: location.to_sym}
          puts "Student information saved!"
        end
    puts "Now we have #{@students.count} students"
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  # set a value that we will set the method to loop up until - i.e. the number of students in the students array
  print_total = @students.count
  # set a counter to increase during each loop
  count = 0
  # keep looping until the print_total has been reached - i.e. until every element in the array has been run through
  while count < print_total
    # set the student variable to the item in the array (the hash) to be accessed, as determined by the counter
    student = @students[count]
    puts "#{student[:name]} (#{student[:cohort]} cohort, main hobby: #{student[:hobby]}, location: #{student[:location]})".center(100)
    # increase
    count += 1
  end
end

def print_cohorts
  # create list of existing cohorts - method could be improved by creating this list automatically from the directory
  cohorts = ['February 2016','April 2016','September 2016']
  # iterate through the cohorts array one cohort at a time
  cohorts.map do |month|
    # convert the month to a symbol (since we're doing that during the input stage)
    month = month.to_sym
    # iterate through the students array
    @students.find do |student|
      # if the student's cohort matches the current month in the cohort array, puts the student's information
      if student[:cohort] == month
        puts "#{student[:name]} (#{student[:cohort]} cohort), main hobby: #{student[:hobby]}, location: #{student[:location]})".center(100)
      end
      # add a line break between cohorts
      puts
    end
  end
end

def print_footer
  if @students.length == 1
    puts  "Overall, we have #{@students.count} great student".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Display the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Please try again."
  end
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# The following array of hashes is for use in quick testing
# students = [{name: "Hatty Jones", cohort: 'April 2016', hobby: 'climbing', location: 'Berlin'},
#              {name: "Rosie Gollancz", cohort: 'February 2016', hobby: 'trapeze', location: 'San Francisco'},
#              {name: "Lauren Ingram", cohort: 'September 2016', hobby: 'juggling', location: 'Austin'},
#              {name: "Ruby Doobey", cohort: 'April 2016', hobby: 'climbing', location: 'Geneva'}]

interactive_menu
