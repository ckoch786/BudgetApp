class BudgetsController < ApplicationController
    def index
        @budget_entries = Budget.all
    end

    def new
        @budget_entry = Budget.new
    end

    def create
        @budget_entry = Budget.new(params.require(:budget).permit( :expense_category, :date, :payment_method, :site, :cost, :notes))

        respond_to do |format|
            if @budget_entry.save
                format.html { redirect_to budgets_path, notice: "Budget entry was successfully created!" } 
            else
                format.html { render :new }
            end
        end
    end

    def edit
        @budget_entry = Budget.find(params[:id])
    end

    def update
        @budget_entry = Budget.find(params[:id])
        
        respond_to do |format|
           if @budget_entry.update(params.require(:budget).permit(
            :expense_category,
            :date,
            :payment_method,
            :site,
            :cost,
            :notes
            ))
            format.html { redirect_to budgets_path, notice: "Your budget entry was successfully updated!" }
           else
            format.html { render :edit }
           end
        end
    end

    def show
        @budget_entry = Budget.find(params[:id])
    end
end
