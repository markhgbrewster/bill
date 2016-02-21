class ResponseFormatter
  attr_reader :response
  private :response
  
  def initialize(response)
    @response = response
  end
  
  def generated
    format_date_string(response["statement"]["generated"])
  end

  def due_date
     format_date_string(response["statement"]["due"])
  end
  
  def start_date
    format_date_string(response["statement"]["period"]["from"])
  end
  
  def end_date
    format_date_string(response["statement"]["period"]["to"])
  end
  
  def total_cost
    response["total"]
  end
  
  def subscriptions
    response["package"]["subscriptions"] 
  end
  
  def total_subscriptions_cost
    response["package"]["total"]
  end
  
  def calls
    response["callCharges"]["calls"]
  end
  
  def calls_cost
     response["callCharges"]["total"]
  end
  
  def rentals
    response["skyStore"]["rentals"]
  end
  
  def buy_and_keeps
    response["skyStore"]["buyAndKeep"]
  end
  
  def sky_store_total
    response["skyStore"]["total"]
  end
  
  private
    def format_date_string(date_string)
      if date_string.present?
         date_string.to_date.strftime("%d/%m/%Y")
       else
         "Unable to retrieve date"
       end
    end

end