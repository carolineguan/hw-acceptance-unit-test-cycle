require 'spec_helper'
require 'rails_helper'
 describe "Movie" do
    before(:all) do
      @movie_1 = Movie.create(title: "title_1",rating: "G", description:"dummy", director: "same",release_date: 123123)
      @movie_2 = Movie.create(title: "title_2",rating: "G", description:"dummy", director: "same",release_date: 123123)
      @movie_3 = Movie.create(title: "title_3",rating: "G", description:"dummy", director: "kdjfhsk",release_date: 123123)
      @movie_4 = Movie.create(title: "title_4",rating: "G", description:"dummy", director: nil,release_date: 123123)
    end
  describe 'searching same director' do
  
    context 'director exists' do
     
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(@movie_1.title).uniq).to eql(["title_1", "title_2"])
        expect(Movie.similar_movies(@movie_1.title).uniq).to_not include(['title_3'])
        expect(Movie.similar_movies(@movie_3.title).uniq).to eql(['title_3'])
      end
    end
     context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(@movie_4.title)).to eql(nil)
      end
    end
  end
 describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end