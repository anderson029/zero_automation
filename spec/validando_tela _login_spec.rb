describe 'Validando tela login' do
    it 'login sucesso'do
        #comando visitar página
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        #comando preencher
        fill_in 'userId', with: 'stark'
        fill_in 'passId', with: 'jarvis!'
        click_button 'Login'
        #Verificando se a mensagem é apresentada na tela
        expect(find('#flash').visible?).to be true
        #Transformando a string em texto e verificando se é idêntico com eql
        ##expect(find('#flash').text).to eql 'Olá, Tony Stark. Você acessou a área logada!'
        # include só verifica se contém o valor da string no conteúdo
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        #Verificando se o meu elemento contém a string mencionada
        #$expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'login sem informar crendenciais' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        click_button 'Login'
        expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'
    end
   
    it 'login com credencial inválida' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        fill_in 'userId', with: 'usuário inválido'
        #Comando para utilizar o teclado (.send_keys)
        find('#userId').send_keys(:backspace)
        sleep 5
        fill_in 'passId', with: 'senha inválida'
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'
    end
end

