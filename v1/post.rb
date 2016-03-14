require 'grape'

module API
  module V1
    class Post < Grape::API
      resources :posts do
        desc '返回文章列表'
        get do
          [
            { title: 'Post 1', content: 'Content of Post 1' },
            { title: 'Post 2', content: 'Content of Post 2' },
            { title: 'Post 3', content: 'Content of Post 3' },
            { title: 'Post 4', content: 'Content of Post 4' }
          ]
        end

        desc '保存文章'
        params do
          requires :title, type: String, desc: '文章标题'
          requires :content, type: String, desc: '文章内容'
        end
        post do
          {
            id: 1,
            title: params[:title],
            content: params[:content]
          }
        end

        desc '更新文章'
        params do
          requires :title, type: String, desc: '文章标题'
          requires :content, type: String, desc: '文章内容'
        end
        put ':id' do
          {
            id: params[:id],
            title: params[:title],
            content: params[:content]
          }
        end
      end
    end
  end
end
