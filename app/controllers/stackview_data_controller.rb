class StackviewDataController < ApplicationController
  # stackview doesn't like it if certain things are blank
  DefaultStackviewDocAttributes = {
    "measurement_height_numeric" => 1,
    "shelfrank" => 1,
    "measurement_page_numeric" => 1
  }

  # config for different call number types; we don't
  # fully support call number types yet, but are building for it. 
  # with the exception of the 'test' type
  class_attribute :_config_for_types
  self._config_for_types = {
    'default' => {
      :fetch_adapter => lambda { RailsStackview::DbWindowFetcher.new }
    },
    'test' => {
      :fetch_adapter => lambda { RailsStackview::MockFetcher.new }
    },
    'lc' => {
      :link => lambda do |hash|
        "https://catalyst.library.jhu.edu/catalog/#{hash['system_id']}"
      end
    }
  }
  def self.set_config_for_type(type, attributes)
    type = type.to_s
    config = (self._config_for_types[type] ||= {})
    config.merge! attributes

    return config
  end
  def self.config_for_type(type)
    type = type.to_s

    config  = self._config_for_types[type]
    unless config
      raise ArgumentError, "No config found for #{type}"
    end
    default = _config_for_types['default']

    return config.reverse_merge(default)
  end
  def config_for_type(type)
    self.class.config_for_type(type)
  end
  # mostly for testing
  def self.remove_config_for_type(type)
    type = type.to_s
    _config_for_types.delete(type)
  end



  def fetch
    config = config_for_type( params[:call_number_type] )

    fetch_adapter = config[:fetch_adapter].call    

    # Make sure defaults are covered
    docs = fetch_adapter.fetch(params).collect {|d| d.reverse_merge DefaultStackviewDocAttributes }

    render :json => {'docs' => docs}
  end

end
