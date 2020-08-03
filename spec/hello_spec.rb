describe 'primeiro script', :helo do

    it  'visitar página' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end
end