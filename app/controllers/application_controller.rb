class ApplicationController < ActionController::API
  before_action only: [:filter, :index, :sum, :import_sum, :export_sum, :free, :backlog, :render_sethin_sum, :free_sum, :aggregate, :search] do
    set_row_per_page()
  end

  before_action :select, only: [:filter, :index]
  before_action :order, only: [:filter, :index]

  private
    def set_row_per_page()
      unless params[:row_limit].blank?
          @@row_limit = params[:row_limit].to_i
      else
          @@row_limit = 100
      end
    end

    def data_shaping(pkey)
      unless params[:id].blank?
        params[:id] = data_padding(pkey, params[:id]).upcase
      end
    end

    def data_padding(column_name, column_value)
      if @model_name.nil?
        column = controller_name.classify.constantize.columns_hash[column_name]
      else
        column = @model_name.classify.constantize.columns_hash[column_name]
      end
      
      unless column.nil?
        case column.type
        when :string then
          column_value.to_s.ljust(column.limit, ' ')
        else
          column_value
        end
      end

    end

    def filter(ignores=[])
      ignores.push('page', 'row_limit', 'order', 'select', '_')

      @qp = request.query_parameters

      if @model_name.nil?
        @objects = controller_name.classify.constantize.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
      else
        @objects = @model_name.classify.constantize.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
      end

      # すべてのパラメータを一致検索
      @qp.each{|key, value|
        next if ignores.include?(key)

        #クエリパラメータにモデルに存在しないカラムが含まれている場合に、スキップする
        if @model_name.nil?
          column = controller_name.classify.constantize.columns_hash[key]
        else
          column = @model_name.classify.constantize.columns_hash[key]
        end
        next if column.nil?

        values = []
        # 複数指定されていた場合、or検索を行う
        value.strip.gsub('　', ' ').split(' ').each{|v|
          values.push(data_padding(key, v))
        }
        @objects = @objects.where(key.to_sym => values)
      }
    end

    def select()
      unless params[:select].blank?
        if @objects.nil?
          @objects = controller_name.classify.constantize.all.paginate(page: params[:page], per_page: @@row_limit)
        end

        @objects = @objects.select(params[:select].gsub(' ', ','))
      end
    end

    def order()
      unless params[:order].blank?
        if @objects.nil?
          @objects = controller_name.classify.constantize.all.paginate(page: params[:page], per_page: @@row_limit)
        end

        params[:order].each{|key, value|
          value = 'ASC' unless ['ASC', 'DESC'].include?(value.upcase!)
          
          @objects = @objects.order(key + ' ' + value)
        }
      end
    end
end
