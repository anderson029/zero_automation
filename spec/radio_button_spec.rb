describe 'Botôes de Radio', :radio do
  
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/radios'
  end

  it 'seleção por ID', :button_id do
    choose('cap')
  end

  it 'seleção por find e css selector', :button_css do
    find('input[value=iron-man]').click
  end
  
  after(:each) do
    sleep 3
  end
end