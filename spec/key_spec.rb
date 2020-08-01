describe 'teclado', :key, :smoke do

  before(:each) do
    visit '/key_presses'
  end

  it 'simulando as teclas símbolos' do
    find('#campo-id').send_keys :space
    space = find('#result').text
    expect(page).to have_content'You entered: SPACE'
    expect(page).to have_content space
  end

  it 'validando teclas com array dentro do for', :teclas do
    # %i para enviar simbolos do teclado dentro de uma array
    teclas = %i[tab escape space enter shift control alt]
    #realizando for incrementando valor da varíavel em t
    teclas.each do |t|
      find('#campo-id').send_keys t
      expect(page).to have_content 'You entered: ' + t.to_s.upcase
    end
  end

  it 'validando letras', :letras do
    # %w para enviar letras do teclado dentro de uma arrray
    letras = %w[a b c d e f g ]
    letras.each do |a|
      find('#campo-id').send_keys a
      expect(page).to have_content 'You entered: ' + a.to_s.upcase
    end
  end
end