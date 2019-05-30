Rails.application.routes.draw do
  
  get '/customer/search', to: 'customer#search'

  resources :nhsmta

  resources :ksnmta

  resources :tokmta

  get '/stock/sethin_sum', to: 'stock#render_sethin_sum'
  resources :hsttra

  get '/soumta/filter', to: 'soumta#filter'
  resources :soumta

  get '/jdntra/filter', to: 'jdntra#filter'
  get '/jdntra/backlog', to: 'jdntra#backlog'
  resources :jdntra

  # SouStockInfo用　現在在庫数(出荷予定在庫を未計上)
  get '/stock/free_sum', to: 'stock#free_sum'
  # 商品一覧用　フリー在庫数(出荷予定在庫を計上する)
  get '/stock/free', to: 'stock#free'

  get '/stock/aggregate', to: 'stock#aggregate'

  # 出荷予定トラン集計
  get '/stock/jdntrb_sum', to: 'stock#render_jdntrb_sum'

  resources :systba
  
  get '/zaisma/sum', to: 'zaisma#sum'
  get '/zaisma/filter', to: 'zaisma#filter'
  resources :zaisma
  
  get '/zaitra/import_sum', to: 'zaitra#import_sum'
  get '/zaitra/export_sum', to: 'zaitra#export_sum'
  resources :zaitra

  get '/idntra/sum', to: 'idntra#sum'
  get '/idntra/filter', to: 'idntra#filter'
  resources :idntra

  get '/odntra/sum', to: 'odntra#sum'
  get '/odntra/filter', to: 'odntra#filter'
  resources :odntra
  
  get '/jdntrb/sum', to: 'jdntrb#sum'
  get '/jdntrb/filter', to: 'jdntrb#filter'
  resources :jdntrb

  get '/clsmta/filter', to: 'clsmta#filter'
  resources :clsmta
  
  get '/brandmta/filter', to: 'brandmta#filter'
  resources :brandmta
  
  get '/itemstatusmta/filter', to: 'itemstatusmta#filter'
  resources :itemstatusmta
  
  get '/hinjancd/filter', to: 'hinjancd#filter'
  resources :hinjancd

  get '/udntra/filter', to: 'udntra#filter'
  resources :udntra
  
  get '/hinmta/filter', to: 'hinmta#filter'
  resources :hinmta
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
