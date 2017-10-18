class DashboardController < ApplicationController
    def index
        @jobs = Job.order(:level)
    end
end





