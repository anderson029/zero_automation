describe 'IDs Dinâmicos', :ids_dinamicos do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'cadastro' do
       # find('#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput').set 'Anderson Teste'
       # find('#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt').set '123456'
       # find('#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block').click

        # Reduzindo ids dinâmicos (ex: acima) com css selector 
        # $ => termina com
        # ^ => inicia com 
        #* => contém

        find('input[id$=UsernameInput]').set 'Anderson Teste'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click
        result= find('#result').text
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        expect(result).to include 'Dados enviados. Aguarde aprovação do seu cadastro!'
        sleep 3
    end
end