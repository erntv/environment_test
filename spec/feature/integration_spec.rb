# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book from form', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '10'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rowling')
        expect(page).to have_content('10')
        expect(page).to have_content('2020-01-01')
    end

    scenario 'submitted with empty inputs' do
        visit new_book_path
        click_on 'Create Book'
        expect(page).to have_content('prohibited this book from being saved')
    end
end

RSpec.describe 'Editing a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '10'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Create Book'

        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rowling')
        expect(page).to have_content('10')
        expect(page).to have_content('2020-01-01')
        expect(page).to have_content('Edit')
        click_on 'Edit'

        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '20'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Update Book'

        expect(page).to have_content('20')
        expect(page).to_not have_content('10')
    end

    scenario 'empty inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '10'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Create Book'

        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rowling')
        expect(page).to have_content('10')
        expect(page).to have_content('2020-01-01')
        expect(page).to have_content('Edit')
        click_on 'Edit'

        fill_in 'Title', with: ''
        fill_in 'Author', with: ''
        fill_in 'Price', with: ''
        fill_in 'Published', with: ''
        click_on 'Update Book'

        expect(page).to have_content('prohibited this book from being saved')
    end
end

RSpec.describe 'Deleting a book', type: :feature do
    scenario 'from button click' do
        visit new_book_path
        fill_in 'Title', with: 'oooooooooooooooo'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '10'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('Destroy')
        click_on 'Destroy'
        expect(page).to_not have_content('oooooooooooooooo')
    end
end

RSpec.describe 'Get book info', type: :feature do
    scenario 'click from main page' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'rowling'
        fill_in 'Price', with: '10'
        fill_in 'Published', with: '2020-01-01'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rowling')
        expect(page).to have_content('10')
        expect(page).to have_content('2020-01-01')
        click_on 'Show'
        expect(page).to have_content('Back')
        expect(page).to have_content('Edit')
        expect(page).to_not have_content('Destroy')
        expect(page).to have_content('harry potter')
        expect(page).to have_content('rowling')
        expect(page).to have_content('10')
        expect(page).to have_content('2020-01-01')
    end
end