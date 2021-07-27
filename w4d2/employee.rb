class Employee

    attr_reader :salary, :name, :title, :boss

    def initialize (name, title, salary, boss)
        @name = name 
        @title = title
        @salary = salary
        @boss = boss

    end 

    def bonus(multiplier)
        bonus = @salary * multiplier 

    end 


end 

class Manager < Employee

    #attr_reader :

    def initialize (name, title, salary, boss, *employees)
        super(name, title, salary, boss)
        @employees = []
        employees.each do |employee|
            @employees << employee
        end 

    end 
    
    def bonus(multiplier)
        total = 0 

        @employees.each do |employee|
            total += employee.salary 
        end 
        total * multiplier 

    end 

    def add_employee(employee)
        @employees << employee

    end

end 


ned = Employee.new("ned", "engineer", 10000, "darren")
darren = Manager.new("darren", "manager", 2000, ned)
p ned.salary
p darren.salary
