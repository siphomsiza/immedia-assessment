module ApplicationHelper
  include FontAwesome::Rails::IconHelper

    def currency_format v
      return unless v
      number_to_currency(v, unit: currency_unit, separator: ".", delimiter: " ", :precision => 2)
    end

    def number_format v
      return unless v
      number_with_precision( v.to_f, :separator => '.', :delimiter => ' ', :precision => 2)
    end

    def date_format d
      d.strftime("%F") if d
    end
    alias :df :date_format

    def date_format_at d
      d.strftime("%F at %H:%M") if d
    end
    alias :df_at :date_format_at

    def datetime_format d
      d.strftime("%F %H:%M") if d
    end
    alias :dtf :datetime_format

    def datetime_with_sec_format d
      d.strftime("%F %H:%M:%S") if d
    end

    def html_submit(content=fa_icon('save', :text => "Save"), extra={})
      content_tag "button", content.html_safe,  submit_options(extra)
    end

    def submit_options(extra={})
      { "type" => "submit",  "class" => "btn  btn-primary  ", 'data-disable-with' => "<i class='fa fa-spinner fa-spin'></i> Please wait...".html_safe }.with_indifferent_access.merge(extra)
    end

end
