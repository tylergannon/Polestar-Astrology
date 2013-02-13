module Extensions
  module ActiveRecordExtensions
    def html_id
      "#{self.class.name.underscore.gsub(/\//, '_')}_#{id}"
    end
  end
end