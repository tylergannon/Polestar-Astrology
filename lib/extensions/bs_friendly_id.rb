module Extensions
  module BsFriendlyId
    extend ActiveSupport::Concern

    module ClassMethods
      def friendly_id(column)
        # alias_method :find_without_friendly_id, :find
        # alias_method :find, :find_with_friendly_id
        @column = column
        const_set('ID_COLUMN', @column)
        before_create do |model|
          model.slug = model.send(column).parameterize
        end
        before_update do |model|
          model.slug = model.send(column).parameterize # if model.send("#{column}_changed?")
        end
      end

      def find(*args)
        id = args[0]
        if id.kind_of?(String)
          if id.to_i > 0
            super(*args)
          else
            val = find_by(slug: args[0])
            if val
              return val
            else
              raise ActiveRecord::RecordNotFound.new("Could not find object with ID=#{args[0]}")
            end
          end
        else
          super(*args)
        end
      end
    end
  end
end