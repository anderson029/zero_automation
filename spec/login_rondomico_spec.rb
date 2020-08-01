describe 'Login 2', :rand, :smoke do

    before(:each) do
        visit '/login2'
    end

    it 'com data de nascimento', :campo_randomico do
        #utilizando comando do capybara para inserir dados no campo
        #fill_in 'userId', with: 'stark'
        #fill_in 'passId', with: 'jarvis!'

        #outra forma tbm é preencher os campos encontrando elemendo direto na página e inserindo dados
        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'
        form_login = find('#login')

        case form_login.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
    end
end

