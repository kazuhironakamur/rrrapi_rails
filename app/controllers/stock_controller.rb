class StockController < ApplicationController
    def filter
        @objects = nil
        super
    end

    #在庫系の取得処理をまとめたメソッド
    def aggregate
        @zaisma_sum = zaisma_sum[0]["sum"]
        @zaitra_import_sum = zaitra_import_sum[0]["sum"]
        @zaitra_export_sum = zaitra_export_sum[0]["sum"]
        @idntra_sum = idntra_sum[0]["sum"]
        @odntra_sum = odntra_sum[0]["sum"]
        @jdntrb_sum = jdntrb_sum[0]["sum"]
        @sethin_sum = sethin_sum[0]["sum"]
        @free_sum = @zaisma_sum + @zaitra_import_sum \
                    + @zaitra_export_sum + @idntra_sum + @odntra_sum
        
        render json:{
            "free_sum" => @free_sum,
            "jdntrb_sum" => @jdntrb_sum,
            "sethin_sum" => @sethin_sum,
            "free_stock" => @free_sum - @jdntrb_sum - @sethin_sum
        }
    end

    def free_sum
        render json:{
            "free_sum" => zaisma_sum[0]["sum"] + zaitra_import_sum[0]["sum"] \
             + zaitra_export_sum[0]["sum"] + idntra_sum[0]["sum"] + odntra_sum[0]["sum"]
             # - jdntrb_sum[0]["sum"] - sethin_sum[0]["sum"]
        }
    end

    # フリー在庫の取得
    def free
        render json:{
            "free_stock" => zaisma_sum[0]["sum"] + zaitra_import_sum[0]["sum"] \
             + zaitra_export_sum[0]["sum"] + idntra_sum[0]["sum"] \
             + odntra_sum[0]["sum"] - jdntrb_sum[0]["sum"] - sethin_sum[0]["sum"]
        }
    end

    # 月次在庫の取得
    def zaisma_sum
        @model_name = 'Zaisma'
        filter
        @zaisma_sum = @objects.select("nvl(sum(smazaisu), 0) as sum")
    end

    # 在庫受払トラン(入荷分）集計
    def zaitra_import_sum
        @model_name = 'Zaitra'
        filter
        @zaitra_import_sum = @objects.import.select("nvl(sum(movsu), 0) as sum")
    end

    # 在庫受払トラン(出荷分）集計
    def zaitra_export_sum
        @model_name = 'Zaitra'
        filter
        @zaitra_export_sum = @objects.export.select("nvl(sum(movsu) * -1, 0) as sum")
    end

    # 入荷トラン集計
    def idntra_sum
        @model_name = 'Idntra'
        filter
        @idntra_sum = @objects.select("nvl(sum(inpchgsu - srechgsu), 0) as sum")
    end

    # 出荷トラン集計
    def odntra_sum
        @model_name = 'Odntra'
        filter
        @odntra_sum = @objects.select("nvl(sum(otpchgsu - urichgsu), 0) * -1 as sum")
    end
    
    # 出荷予定トラン集計
    def jdntrb_sum
        @model_name = 'Jdntrb'
        filter
        @jdntrb_sum = @objects.select("nvl(sum(sytsu - jlnotpsu), 0) as sum")
    end

    # 受注引き当て数
    def render_jdntrb_sum
        render json:{
            "jdntrb_sum" => jdntrb_sum[0]["sum"]
        }
    end

    # セット品引き当て数集計
    def sethin_sum
        @model_name = 'Hsttra'
        filter
        @sethin_sum = @objects.select("nvl(sum(istsu - movsu), 0) as sum")
    end

    # セット品引き当て数
    def render_sethin_sum
        render json:{
            "sethin_sum" => sethin_sum[0]["sum"]
        }
    end

end
