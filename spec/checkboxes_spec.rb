describe'caixa de seleção',:checkbox do

  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
  end

  it 'marcando uma opção' do
    check('thor').uncheck
  end

  it 'desmarcando checkbox' do
    uncheck('antman')
  end

  it 'marcando com find set true' do
    find('input[Value=cap]').set (true)
  end

  it 'desmarcando checkbox', :desmarcando_set do
    #removendo marcação com find.set(false)
    find('input[value=ant-man]').set (false)
  end

  after(:each) do
    sleep 3
  end
end