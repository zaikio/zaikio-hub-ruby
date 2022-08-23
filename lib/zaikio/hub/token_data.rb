module Zaikio
  module Hub
    class TokenData
      attr_reader :audience, :on_behalf_of, :subject, :scopes

      def self.from(payload)
        subjects = payload["sub"].split(">")

        new(
          audience: payload["aud"].first,
          on_behalf_of: subjects.first,
          subject: subjects.last,
          scopes: payload["scope"]
        )
      end

      def initialize(audience:, on_behalf_of:, subject:, scopes:)
        @audience = audience
        @on_behalf_of = on_behalf_of
        @subject = subject
        @scopes = scopes
      end

      def on_behalf_of_type
        @on_behalf_of_type ||= type_for(:on_behalf_of)
      end

      def on_behalf_of_id
        @on_behalf_of_id ||= id_for(:on_behalf_of)
      end

      def subject_type
        @subject_type ||= type_for(:subject)
      end

      def subject_id
        @subject_id ||= id_for(:subject)
      end

      private

      def type_for(key)
        public_send(key).split("/").first
      end

      def id_for(key)
        public_send(key).split("/").last
      end
    end
  end
end
