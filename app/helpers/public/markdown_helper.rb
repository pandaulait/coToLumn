module Public::MarkdownHelper
  require "redcarpet"
  require "coderay"

  # マークダウン形式の導入（redcarpet）
  def markdown(text)
    options = {
      filter_html:     true,     # htmlを出力しない
      hard_wrap:       true,     # マークダウン中の空行をhtmlに置き換え
      space_after_headers: true, # # と文字の間にスペースを要求
    }

    extensions = {
      autolink:           true,  # <>で囲まれてなくてもリンクを認識
      no_intra_emphasis:  true,  # 単語中の強調を認識しない
      fenced_code_blocks: true,  # フェンスのあるコードブロックを認識
      strikethrough:      true,  # ~ 2つで取り消し線
      tables:             true,  # テーブルを認識
      underline:          true,  # 斜線(* *)
      highlight:          true,  # ハイライト(== ==)
      quote:              true,  # 引用符(" ")
      footnotes:          true,  # 脚注( ^[1] )
      escape_html:        true,  # xss対策 全てのHTMLタグをエスケープ(filter_htmlより優先)

    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
#------------------------------------------------------------------
  # 言語での記述（シンタックスハイライト）の導入（coderay）
    class HTMLwithCoderay < Redcarpet::Render::HTML
        def block_code(code, language)
            language = language.split(':')[0]

            case language.to_s
            when 'rb'         # rb も ruby　と認識させる。って意味。
                lang = 'ruby'
            when 'yml'
                lang = 'yaml'
            when 'css'
                lang = 'css'
            when 'html'
                lang = 'html'
            when ''
                lang = 'md'  # 空欄だとエラー?（Invalid id given:）
            else
                lang = language
            end

            CodeRay.scan(code, lang).div
        end
    end
end