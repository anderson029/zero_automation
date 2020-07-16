describe 'Mouse hover', :hovers do 

  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/hovers'
  end

  it 'validando blade', :rodar_blade do
    @blade = find('img[alt=Blade]')
    @blade.hover
    expect(page).to have_content 'Nome: Blade'
  end

  # Dando o comando do jquery no console da página, quando o atributo tem um valor com caracteres especiais ou espaços temos que usar aspas duplas
  # e passar como string para o selector reconhecer.

  it 'validando Pantera Negra', :rodar_pantera do
    @pantera_negra = find('img[alt="Pantera Negra"') 
    @pantera_negra.hover
    expect(page).to have_content 'Nome: Pantera Negra'
  end
  
  it 'validando homem aranha', :rodarHomemAranha do
    @homem_aranha = find('img[alt="Homem Aranha"]')
    @homem_aranha.hover
    expect(page).to have_content 'Nome: Homem Aranha'
  end

  after(:each) do
    sleep 5 # temporário somente para verificar o resultado
  end
end