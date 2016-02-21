class BillItemsController < ::ApplicationController
  
  def index
    response = HTTParty.get('http://safe-plains-5453.herokuapp.com/bill.json')
    @formatted_response ||= ResponseFormatter.new(JSON.parse(response.body))
  end

end