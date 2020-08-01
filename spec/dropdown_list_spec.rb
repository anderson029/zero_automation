# para roda as tags basta informar: rspec --tag @nome_da_tag

describe'validando caixa de opções dropdown', :rodando_toda_sweet_teste, :smoke do
  before(:each) do
    visit'/dropdown'
  end
  
  it 'selecionando item especifico simples', :play_unico_cenario do
      #só funciona para elementos com id's
    select('Loki', from:'dropdown')
  end

  it 'selecionando outro'do
    select('Bucky', from:'dropdown')
  end

  it 'selecionando item sem id com método find', :encontrando_elemento_sem_id do
    drop = find('.avenger-list')
    drop.find('option', text:'Scott Lang').select_option
  end

  # método find retorna somente um elemento
  #método all retorna todos os elementos da lista
  #método sample 'sorteia' qualquer elemento da lista 

  it 'qualquer item da lista', :sample do
    drop = find('.avenger-list')
    drop.all('option').sample.select_option
  end
end