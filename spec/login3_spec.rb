describe 'Login com cadastro',:login_unico, :smoke do

  before(:each) do
    visit'/access'
  end

  it 'Login com sucesso', :tst1 do
    #outra forma de buscar elemento especifico quando houver duplicidade é buscando dentro do bloco de html Ex:
    #variavel = o formualario 
    #variavel.find 'passa_id_aqui'.set 'passa o valor' (ele vai setar o valor dentro da onde afirmamos)

    # bloco_html = find 'passa_id_aqui'
    #bloco_html.find('#usernameId').set 'stark'
    #bloco_html.find('#passwordId').set 'jarvis!'

    find('#usernameId').set 'stark'
    find('#passwordId').set 'jarvis!'
    click_button ('Entrar')
    mensagem = find('#flash')
    expect(mensagem.text).to include 'Olá, Tony Stark. Você acessou a área logada!'

    #configurando para criar evidências dos testes pode ser do tipo png, jpeg...
   # page.save_screenshot('log/login_sucesso.png')
  end

  it 'login utilizando escopo', :tst2 do
    #within = ele procura dentro do selector informado no caso 'login'
    within('#login') do
      find('#usernameId').set 'stark'
      find('#passwordId').set 'jarvis!'
      click_button('Entrar')
    end
      mensagem = find('#flash')
      expect(mensagem.text).to include 'Olá, Tony Stark. Você acessou a área logada!'
  end

  it 'senha inválida',:senha_incorreta do
    find('#usernameId').set 'stark'
    find('#passwordId').set 'senha inválida'
    click_button('Entrar')
    msg = find('#flash')
    expect(msg.visible?).to be true
    expect(msg.text).to include 'Senha é invalida!'
  end

  it 'cadastro com sucesso', :tst3 do

    within('#signup')do
      nome_cadastro = find('#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput')
      senha_cadastro = find('#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt')
      nome_cadastro.set 'Anderson'
      senha_cadastro.set '123456'
      click_link ('Criar Conta') 
    end
     mensagem = find('#result')
    expect(mensagem.text). to include 'Dados enviados. Aguarde aprovação do seu cadastro!'
  end

=begin
  #trazendo as descrição de cada cenário e tirando screen shot somente desse cenário
  na pasta spec_helper contém a configuração para tirar print no projeto todo
  
  after(:each) do |ex|
    nome = ex.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')
    page.save_screenshot('log/'+ nome + '.png')
  end
=end
end