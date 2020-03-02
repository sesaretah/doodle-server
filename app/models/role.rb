class Role < ApplicationRecord
    def users
        results = []
        for user in User.all
           results << user if user.assignments.include? self.id
        end
        return results
    end

    def add_ability(title, value)
        self.abilities = [] if self.abilities.blank?
        self.abilities << {title: title, value: value} 
        self.save
    end

    def remove_ability(title)
        arr = []
        for a in self.abilities
            arr << a if a['title'] != title
        end
        self.abilities = arr
        self.save
    end
end
