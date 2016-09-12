# Modify your program to only print the students whose name begins with a specific letter.

# get student names from user
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
    # return the array of students
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# iterate through names and ONLY print out students whose names begin with R
def print(students)
  students.each do |student|
    name = "#{student[:name]}"
    if name[0] == 'R'
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
