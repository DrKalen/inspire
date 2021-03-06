class QuotesController < ApplicationController
    def index
     @quote = Quote.order("RANDOM()").first
    end

  

    def create
        @quote = Quote.create(quote_params)
        if @quote.invalid?
            flash[:error] = '<strong>Could not save:</strong> the information you entered is too long (quote>140 characters or author>50 characters) or too short (<3 characters).'
        end
        redirect_to root_path
    end

def about
end

    private

    def quote_params
        params.require(:quote).permit(:saying, :author)
    end
end
