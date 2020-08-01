describe 'Tabelas', :tabs, :smoke do
    before(:each)do
        visit'/tables#'
    end
    # find = retorna um único elemento
    # all = retorna todos os elementos em array 
    # detect = comando ruby que permite identificar um selector para validação

    it 'validando o salário do tony stark da tabela' do
        atores = all('table tbody tr')
        tony = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}
        #puts tony.text
        expect(tony.text).to include '$ 10.000.000'
    end

    it 'Validando o sálario do Vin diesel' do
        atores = all('table tbody tr', text: '@vindiesel')
        expect(atores.text).to include '$ 10.000.000'
    end

    it 'validando o salário do tony chamando pela array', :sal_tony do
        atores = all('table tbody tr')[0].text
        expect(atores).to include '$ 10.000.000'
    end
    
    it 'validando se o nome vingadores está na coluna filme', :moviee do
        ator = find('table tbody tr', text: '@prattprattpratt')
        movie = ator.all('td')[2].text
        expect(movie).to eql 'Vingadores'
    end

    it 'Deve selecionar Chris Prat para remoção', :prat do
        prat = find('table tbody tr', text: 'Chris Prat')
        #del = prat.all('td')[5]
        #del.find('a', text:'delete').click
        prat.find('a', text:'delete').click

        ##### Validando modal em javaa 'alert' ##### 
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to include 'Chris Pratt foi selecionado para remoção!'
    end

    it 'Selecionando Vin Diesel para edição',:ed_vin do
        vin = find('table tbody tr', text: '@vindiesel')
        del = vin.all('td')[5]
        del.find('a', text:  'edit').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Vin Diesel foi selecionado para edição!' 
    end
end