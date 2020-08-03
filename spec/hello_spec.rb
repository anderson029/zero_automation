describe 'primeiro script', :helo do
    
    before(:each) do 
        #ajustando resolução da tela
        page.current_window.resize_to(1280, 800)
    end

    it  'visitar página' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end
end