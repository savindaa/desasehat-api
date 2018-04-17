class Forest::Article
  include ForestLiana::Collection
      
    collection :Article
      
    action 'Accept Article'
    action 'Decline Article'
    
    segment 'Pending' do
  end
    
end