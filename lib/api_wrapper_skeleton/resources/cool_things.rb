module ApiWrapperSkeleton
  module ResourceCollection
    class CoolThings < ApiWrapperSkeleton::Resource
      endpoint :create, http_method: :post, path: '/cool_things'
      endpoint :update, http_method: :put, path: '/cool_things/:id'
      endpoint :show, http_method: :get,  path: '/cool_things/:id'
    end
  end
end
