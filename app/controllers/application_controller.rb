class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from RubySpark::Device::ApiErro, with: :inter_error

    protect_from_forgery with: :exception

    before_action :set_csrf_cookie

    def set_csrf_cookie
        cookies['JTOKEN'] = form_authenticity_token
    end

    #只要在所有的 Controller 發生 ActiveRecord::RecordNotFound 例外，
    #就會在畫面上印出一個「查無資料」的字樣，並且設定 HTTP 狀態為 404
    def not_found
        render file: 'public/404.html',
            status: 404,
            layout: false
    end

    def inter_error
        render file: 'public/500.html',
            status: 500,
            layout: false
    end

end
