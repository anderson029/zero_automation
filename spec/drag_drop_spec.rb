describe 'Drag and Drop', :drop do
  before(:each)do
    visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
  end

  it 'homem aranha pertence ao time do stark',:positivo do
    stark = find('.team-stark .column')
    cap = find('.team-cap .column')
    spiderman= find('img[alt="Homem Aranha"]')
    spiderman.drag_to stark
    expect(stark).to have_css 'img[alt="Homem Aranha"]'
    expect(cap).not_to have_css 'img[alt="Homem Aranha"]'
  end

  it 'movendo a imagem para o tem stark e retornando ao team cap', :movtwo do
    stark = find('.team-stark .column')
    cap = find('.team-cap .column')
    spiderman= find('img[alt="Homem Aranha"]')
    spiderman.drag_to stark
    expect(stark).to have_css 'img[alt="Homem Aranha"]'
    spiderman.drag_to cap
    expect(cap).to have_css 'img[alt="Homem Aranha"]'
  end
end