class Product < ApplicationRecord
    def as_json(options={})
        super(
            include: :category
        )
    end
end
