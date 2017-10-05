module ApiWrapperSkeleton
  module ResourceCollection
    class Users < ApiWrapperSkeleton::Resource
      endpoint :sign_in,  http_method: :post, path: '/users/sign_in'
      endpoint :sign_out,  http_method: :post, path: '/users/sign_out'
      endpoint :create, http_method: :post, path: '/users'
      endpoint :show, http_method: :get,  path: '/users/:id'
    end
  end
end
