class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    # defaults = {
    #   name: "default_name",
    #   title: "scrub",
    #   salary: 1,
    #   boss: nil
    # }
    #
    # options = defaults.merge(opts)

    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    bonus = 0

    @employees.each do |employee|
      bonus += employee.salary * multiplier
    end

    bonus
  end

end

if __FILE__ == $0
  ned = Manager.new("Ned", "Founder", 1000000, nil)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  david = Employee.new("David", "TA", 10000, darren)
  shawna = Employee.new("Shawna", "TA", 12000, darren)

  darren.employees << david << shawna
  ned.employees += darren.employees + [darren]

  puts ned.bonus(5) # => 500_000
  puts darren.bonus(4) # => 88_000
  puts david.bonus(3) # => 30_000
end
