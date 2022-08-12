class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        if !!self.find_by(hired: true)
            self.find_by(hired: true)
        else
            "no actor has been hired for this role"
        end
    end

    def understudy
        if !!self.where("hired = ?", true).second
            self.where("hired = ?", true).second
        else
            "no actor has been hired for understudy for this role"
        end
    end
end