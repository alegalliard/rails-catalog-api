class Category < ApplicationRecord
    belongs_to :product
    
    def author #ref a
        "Xuxa xo sarampo"
    end

    def as_json(options={}) #ref b
        super(methods: :author, root: false)
    end
end
