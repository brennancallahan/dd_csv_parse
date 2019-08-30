class Person
    attr_accessor :first_name, :middle_name, :last_name, :roles, :id_number, :email, :telephone
    
    def initialize(first_name, middle_name, last_name, roles, id_number, email, telephone)
        @first_name = first_name
        @middle_name = middle_name
        @last_name = last_name
        @roles = [roles]
        @id_number = id_number
        @email = email
        @telephone = telephone
    end

    def add_role(role)
        if !@roles.include?(role)
            @roles << role
        end
    end

end