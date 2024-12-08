module Jekyll
  class I18nPermalinkTag < Liquid::Tag
    def initialize(_tag_name, lang, _tokens)
      super
      @lang = lang
    end 

    def render(context)
      site = context.registers[:site]

      lang = context[@lang]
      unless site.config["languages"].include? lang
        throw "Error: Locale '#{lang}' is not supported by the site"
      end
      
      page = context.registers[:page]

      default_lang = site.config['languages'][0]
      return "/#{default_lang}#{page['permalink']}" if lang == default_lang

      keyed_permalink = "permalink_#{lang}"
      return "/#{lang}#{page[keyed_permalink]}" if page[keyed_permalink] 

      # Fallback incase there is no permalink key
      "/#{lang}#{page['permalink']}"
    end
  end
end

Liquid::Template.register_tag('i18n_permalink', Jekyll::I18nPermalinkTag)
