module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
  def static_map_for(latitude, longitude, name, options = {})
    params = {
        :center => [latitude, longitude].join(","),
        :zoom => 14,
        :size => "640x480",
        :markers => [latitude, longitude].join(","),
        :sensor => true
    }.merge(options)

    query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string}", :alt => name, class: "googmap"
  end
end
