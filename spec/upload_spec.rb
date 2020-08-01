describe 'Upload', :upload, :smoke do

  before (:each) do
    #método pwd retorna o caminho completo do diretório onde meu projeto está sendo executado!
    visit '/upload'
    @arquivo = Dir.pwd + '/spec/fixtures/logicadelphi.txt'
    @imagem = Dir.pwd + '/spec/fixtures/img4.jpg'
  end

  it 'Upload com arquivo texto', :arquivo_txt do
    attach_file('file-upload', @arquivo)
    click_button('file-submit')
    div_arquivo = find('#uploaded-file')
    expect(div_arquivo.text).to eql 'logicadelphi.txt'
  end

  it 'Upload de imagem_validando por nome da imagem', :validando_nome_arquivo do
    attach_file('file-upload', @imagem)
    click_button('file-submit')
    div_imagem = find('#uploaded-file')
    expect(div_imagem.text). to eql 'img4.jpg'
  end

  it 'Upload de imagem validando a imagem', :validando_imagem do
    attach_file('file-upload', @imagem)
    click_button('file-submit')
    # puts Capybara.default_max_wait_time = 10 (ver tempo de esperar, para boas práticas devemos remover o sleep e colocar nosso timeout na config do projeto)
    img = find('#new-image')
    expect(img[:src]).to include '/uploads/img4.jpg'
  end

  after (:each)do
    sleep 3
  end
end