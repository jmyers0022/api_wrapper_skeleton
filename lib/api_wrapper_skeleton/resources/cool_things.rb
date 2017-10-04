class ApiWrapperSkeleton::Resources::CoolThings < ApiWrapperSkeleton::Resource
  endpoint :create, method: :post, path: '/cool_things'
  endpoint :update, method: :put, path: '/cool_things/:id'
  endpoint :show, method: :get,  path: '/cool_things/:id'
end
