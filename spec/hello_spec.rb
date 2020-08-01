describe 'primeiro script' do
    it  'visitar página' do
        expect(page.title).to eql 'Training Wheels Protocol'
    end
end