class CategoriesController < ApplicationController
    def list
        @categories = Category.all
    end
end
