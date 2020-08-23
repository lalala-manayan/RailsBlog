ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :brief, :body, :user_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :brief, :body, :user_id, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # 閲覧、編集、削除をコントロールすることができる.
  # ユーザー情報など消えたら問題になるModelは制限を加えたりすることがある
  actions :all
  config.per_page = 20  
  
  #showページ
  show do
    attributes_table do
      row :title
      row :body
      row :tags do
        post.tags.collect { |n| n.name }.join(', ')
      end
      
    end
  end
  
  #formのコード
  form do |f|
    f.inputs '投稿' do
      f.input :title
      f.input :brief     
      f.input :body
      f.has_many :post_tags, allow_destroy: true, new_record: true do |t|
        t.input :tag_id,
                label: 'タグ',
                as: :select,
                collection: Tag.all
      end
      f.actions
    end
  end
  permit_params :title,
                :brief,
                :body,
                question_tags_attributes: [:id, :tag_id, :_destroy]
end
