# Helper methods defined here can be accessed in any controller or view in the application

module Tod
  class App
    module ProposalHelper

      def validate_fields_size(a_field, min_size = 3)
        if a_field.length < min_size
          raise ("The value " + a_field + " should have more than " +
                   min_size.to_s + " characters."
                )
        end
      end

      def field_length_enough?(a_field, min_size = 3)
        a_field.length > min_size
      end

      def merge_search(title_search, tag_search)
        title_search + tag_search
      end

    end

    helpers ProposalHelper
  end
end
