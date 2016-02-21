require 'rails_helper'
require 'json'

describe ResponseFormatter do
  let(:formatter) { ResponseFormatter.new(response) }
  let(:response) { JSON.parse(File.read(Rails.root.join('features','support','fixtures', 'response.json'))) }
  
  describe '#due_date' do
    it 'returns the due date' do
      expect(formatter.due_date).to eql('25/01/2015')
    end
  end
  
  describe '#generated' do
    it 'returns the generated at date' do
      expect(formatter.generated).to eql('11/01/2015')
    end
  end
  
  describe '#start_date' do
    it 'returns the start date of the bill' do
      expect(formatter.start_date).to eql('26/01/2015')
    end
  end
  
  describe '#end_date' do
    it 'returns the end date of the bill' do
      expect(formatter.end_date).to eql('25/02/2015')
    end
  end
  
  describe '#total_cost' do
    it 'returns the total cost of the bill' do
      expect(formatter.total_cost).to eql(136.03)
    end
  end
  
  describe '#subscriptions' do
    it "returns all the customer's subscriptions" do
      expect(formatter.subscriptions).to eql(
        [
          { "type"=>"tv", "name"=>"Variety with Movies HD", "cost"=>50.0}, 
          {"type"=>"talk", "name"=>"Sky Talk Anytime", "cost"=>5.0}, 
          {"type"=>"broadband", "name"=>"Fibre Unlimited", "cost"=>16.4}
        ]
      )
    end
    
    describe '#total_subscriptions_cost' do
      it "returns the total cost of the customer's subscriptions" do
        expect(formatter.total_subscriptions_cost).to eql(71.40)
      end
    end
    
    describe '#calls' do
      it "returns all the customer's calls" do
        expect(formatter.calls).to eql(
          [
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769","duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"07716393769", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}, 
            {"called"=>"02074351359","duration"=>"00:23:03","cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03","cost"=>2.13}, 
            {"called"=>"02074351359", "duration"=>"00:23:03", "cost"=>2.13}
          ]
        )
      end
    end
    
    describe '#calls_cost' do
      it "returns the total cost of the customer's calls" do
        expect(formatter.calls_cost).to eql(59.64)
      end
    end
    
    describe '#rentals' do
      it "returns all the customer's sky store rentals" do
        expect(formatter.rentals).to eql(
          [
            {"title"=>"50 Shades of Grey", "cost"=>4.99}
          ]
        )
      end
    end
    
    describe '#buy_and_keeps' do
      it "returns all the customer's sky store buy to keep purchases" do
        expect(formatter.buy_and_keeps).to eql(
          [
            {"title"=>"That's what she said", "cost"=>9.99}, 
            {"title"=>"Broke back mountain", "cost"=>9.99}
          ]
        )
      end
    end
    
    describe '#sky_store_total' do
      it "returns the total customer's sky store spend" do
        expect(formatter.sky_store_total).to eql(24.97)
      end
    end
    
    
  end
end

