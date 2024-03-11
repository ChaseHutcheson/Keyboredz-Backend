class ApplicationController < ActionController::API
    def root
        render json: {status: "running"}
    end
end
