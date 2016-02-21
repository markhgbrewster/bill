class ResponseFormatter
  attr_reader :response
  private :response
  
  def initialize(response)
    @response = response
  end
  
  def generated
    format_date_string(response["statement"]["generated"]) if response["statement"].present?
  end

  def due_date
     format_date_string(response["statement"]["due"]) if response["statement"].present?
  end
  
  def start_date
    format_date_string(response["statement"]["period"]["from"]) if response["statement"].present? && response["statement"]["period"].present?
  end
  
  def end_date
    format_date_string(response["statement"]["period"]["to"]) if response["statement"].present? && response["statement"]["period"].present?
  end
  
  def total_cost
    response["total"]
  end
  
  def subscriptions
    response["package"]["subscriptions"] if response["package"].present?
  end
  
  def total_subscriptions_cost
    response["package"]["total"] if response["package"].present?
  end
  
  def calls
    response["callCharges"]["calls"] if response["callCharges"].present?
  end
  
  def calls_cost
     response["callCharges"]["total"] if response["callCharges"].present?
  end
  
  def rentals
    response["skyStore"]["rentals"] if response["skyStore"].present?
  end
  
  def buy_and_keeps
    response["skyStore"]["buyAndKeep"] if response["skyStore"].present?
  end
  
  def sky_store_total
    response["skyStore"]["total"] if response["skyStore"].present?
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