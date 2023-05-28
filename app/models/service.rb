class Service < ApplicationRecord
    CATEGORY_DESCRIPTIONS = {
        'Commercial Plumbers' => 'Specialized in plumbing services for commercial properties.',
        'Sanitary Plumbers' => 'Focused on sanitary plumbing systems and installations.',
        'Service and repair plumber' => 'Providing plumbing maintenance, repairs, and troubleshooting.',
        'Residential plumber' => 'Offering plumbing services for residential properties.',
        'Water supply plumber' => 'Specializing in water supply systems and installations.'
      }.freeze
    
      validates :name, presence: true, uniqueness: true
      validates :description, presence: true
    
      def self.categories
        CATEGORY_DESCRIPTIONS.keys
      end
    
      def self.description(category)
        CATEGORY_DESCRIPTIONS[category]
      end
end
