require_relative 'modules/people'
require_relative 'modules/books'
require_relative 'modules/rental'

module App
  include PeopleListing
  include BookLisitng
  include RentalListing
end
