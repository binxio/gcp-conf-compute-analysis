require 'pdf/reader'

describe 'LaTeX PDF' do
  reader = PDF::Reader.new('main.pdf')

  it 'should have 2 pages' do
    expect(reader.page_count).to eq(2)
  end
  #it 'should be titled The Ericsson \LaTeX\ Document Class' do
  #  expect(reader.info[:Title]).to eq('The Ericsson LaTeX Document Class')
  #end
  it 'should be made by TeX' do
    expect(reader.info[:Creator]).to eq('TeX')
  end
  #it 'should be authored by EISAMAR' do
  #  expect(reader.info[:Author]).to eq('EISAMAR Martin Isaksson')
  #end
  it 'Should be A4 sized' do
    expect(reader.pages[0].attributes[:MediaBox]).to eq([0, 0, 595.276, 841.89])
  end
  #it 'should have 2 fonts on page 1' do
  #  expect(reader.pages[0].fonts.keys.size).to eq(2)
  #end
  it 'should start with a title' do
    expect(reader.pages[0].text).to match('Gitlab CI pipeline for LaTeX')
  end
  it 'first page should contain Lorem ipsum' do
    expect(reader.pages[0].text).to match('Lorem ipsum dolor sit amet')
  end
  it 'last page should contain reference' do
    expect(reader.pages[0].text).to match('References')
  end
  it 'last page should contain reference' do
    expect(reader.pages[0].text).to match('Knuth')
  end
end