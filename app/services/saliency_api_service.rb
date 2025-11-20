require 'net/http'
require 'uri'

class SaliencyApiService
  def self.call(image_file, participants, fixations = 6, tier = 'enterprise_light')
    api_url = ENV['NUROVISION_API'] + '/predict/'
    uri = URI(api_url)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)

    form_data = [
      ['file', image_file, { filename: image_file.original_filename, content_type: image_file.content_type }],
      ['participants', participants.to_s],
      ['fixations', fixations.to_s],
      ['tier', tier]
    ]

    request.set_form(form_data, 'multipart/form-data')

    response = http.request(request)

    if response.code == '200'
      JSON.parse(response.body)
    else
      raise "API call failed with status #{response.code}: #{response.body}"
    end
  end
end