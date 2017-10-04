class ApiWrapperSkeleton::Resources::Users < ApiWrapperSkeleton::Resource
  endpoint :sign_in,  method: :post, path: '/users/sign_in'
  endpoint :sign_out,  method: :post, path: '/users/sign_out'
  endpoint :create, method: :post, path: '/users'
  endpoint :show, method: :get,  path: '/users/:id'
end
