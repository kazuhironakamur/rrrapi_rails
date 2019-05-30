require 'nkf'

class CustomerController < ApplicationController

    def filter(ignores=[])
        @objects = Tokmta.all.
        joins(:ksnmta).
        joins(:nhsmta).
        list.
        select('ksnmta.mannm, nhsmta.nhscd, nhsmta.nhsnm, nhsmta.nhsnk, nhsmta.nhsada, nhsmta.nhsadb, nhsmta.nhsadc, nhsmta.nhstl, nhsmta.nhsfx')
        #paginate(page: params[:page])
        super(ignores)
    end

    def search
        @model_name = 'Tokmta'

        filter(%w{ toknm nhsnm })

        @objects = @objects.where(['REGEXP_LIKE(tokcd, ?)', '^[ABCDEFGIMNO].*'])
        
        %w{ toknm nhsnm }.each{|word|
            unless @qp[word].blank?
                @qp[word].strip.gsub('　', ' ').split(' ').each{|n|
                    full_n = NKF.nkf("--katakana -w", n) # 全角カナへ変換
                    full_n = full_n.tr('a-z', 'Ａ-Ｚ') # 全角大文字英数字へ変換
                    full_n = full_n.tr('A-Z', 'Ａ-Ｚ')
                    full_n = full_n.tr('ａ-ｚ', 'Ａ-Ｚ')
            
                    @objects = @objects.where("TO_MULTI_BYTE(UTL_I18N.TRANSLITERATE(UPPER(UTL_I18N.TRANSLITERATE(#{word}, 'hiragana_hwkatakana')), 'hwkatakana_fwkatakana')) LIKE ?", '%' + full_n + '%')
                }
                @qp.delete(word)
            end
        }
        p '###################'
        p WillPaginate.total_entries

        render json: @objects
    end

    #下のメソッドは使ってない
    def get_tokmta
        @model_name = 'Tokmta'
        filter
        @tokmta = @objects.select("tokcd, toknm, toknk, tokada, tokadb, tokadc, toktl, tokfx, mancd")
                          .where(['REGEXP_LIKE(tokmta.tokcd, ?)', '^[ABCDEFGIMNO].*'])
    end

    def get_ksnmta
        @model_name = 'Ksnmta'
        filter
        @tokmta = @objects.select("mancd, mannm")
    end

    def get_nhsmta
        @model_name = 'Nhsmta'
        filter
        @tokmta = @objects.select("nhstokcd, nhscd, nhsnm, nhsnk, nhsada, nhsadb, nhsadc, nhstl, nhsfx")
    end

    def ksnmta_extract
        @model_name = 'Ksnmta'
        filter
        @ksnmta = @objects.select("mancd, mannm")
    end
end
