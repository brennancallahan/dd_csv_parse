class Site
    attr_accessor :country, :site_number, :facility_name, :address, :city, :state, :zip

    def initialize(country, site_number, facility_name, address, city, state, zip)
        @country = country
        @site_number = site_number
        @facility_name = facility_name
        @address = address
        @city = city
        @state = state
        @zip = zip
    end
    
end