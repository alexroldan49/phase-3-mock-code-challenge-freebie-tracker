class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def received_one?(item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        if self == freebie.dev
            freebie.update(dev_id: dev.id)
        else 
            "you do not own this freebie"
        end
    end
end
