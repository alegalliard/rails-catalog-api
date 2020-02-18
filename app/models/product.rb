class Product < ApplicationRecord
    belongs_to :category
    
    def as_json(options={})
        super(
            include: :category
        )
    end
end
