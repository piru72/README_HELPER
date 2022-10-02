class Problem
  attr_accessor :name, :link

  def initialize(name, link)
    @name = name
    @link = link
  end
end

def read_problem(file)
  name = file.gets.chomp.to_s

  name.slice!("https://toph.co/p/")
  name = name.upcase
  name = name.gsub("-", " ")

  problemChild = Problem.new(name, "https://toph.co/p/" + name.downcase.gsub(" ", "-"))
  return problemChild
end

def read_problems()
  problem_file = File.new("problemlink.txt", "r")
  number_of_lines = File.foreach(problem_file).count
  puts number_of_lines
  problems = Array.new()

  while (number_of_lines > 0)
    problem = read_problem(problem_file)
    problems << problem
    number_of_lines -= 1
  end

  problem_file.close

  return problems
end

def print_problems(problemsList)
  forGithub = File.new("forGithub.txt", "w")
  total_problems = problemsList.size
  puts total_problems

  i = 0
  while (i < total_problems)
    forGithub.print "#{i + 1}. "
    forGithub.print "[#{problemsList[i].name}](#{problemsList[i].link})"
    forGithub.puts ""
    i += 1
  end
end

def main()
  problemsList = read_problems()
  print_problems(problemsList)
end

main()
