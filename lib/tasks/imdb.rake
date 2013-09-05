require 'pry'


namespace :imdb do
  desc "Pulling in data from imdb into movie model"
  task :pull => :environment do


  	letters = ("a".."z").to_a
   
  	letters.each do |letter|
  		Imdb::Search.new(letter).movies.each do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

      


  			Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end

  desc "Pulling in now playing data from themoviedb into movie model"
  task :now_playing => :environment do

  	Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

  	a = Tmdb::Movie.now_playing
  	
 			a.each do |letter|
  		Imdb::Search.new(letter["title"]).movies[0..2].collect do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

  			Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end

  desc "Pulling in popular data from themoviedb into movie model"
  task :popular => :environment do

    Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

    a = Tmdb::Movie.popular
    
      a.each do |letter|
      Imdb::Search.new(letter["title"]).movies[0..2].collect do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

        Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)     
      end
    end
  end

  desc "Pulling in top rated data from themoviedb into movie model"
  task :top_rated => :environment do

    Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

    a = Tmdb::Movie.top_rated
    
      a.each do |letter|
      Imdb::Search.new(letter["title"]).movies[0..2].collect do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

        Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)     
      end
    end
  end

  desc "Pulling in top250 data from imdb into movie model"
  task :top250 => :environment do


      Imdb::Top250.new.movies[0..1].collect do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')


        Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)     
    end
  end

  desc "Pulling in data from imdb into movie model"
  task :custom => :environment do


    letters = ["The Shawshank Redemption","The Godfather","The Godfather Part II","Pulp Fiction","The Good, the Bad and the Ugly","The Dark Knight","12 Angry Men","Schindlers List","The Lord of the Rings The Return of the King","Fight Club","Star Wars Episode V  The Empire Strikes Back","The Lord of the Rings The Fellowship of the Ring","One Flew Over the Cuckoos Nest","Inception","Goodfellas","Star Wars Episode IV  A New Hope","Seven Samurai","Forrest Gump","The Matrix","The Lord of the Rings The Two Towers","City of God","Se7en","The Silence of the Lambs","Once Upon a Time in the West","Casablanca","The Usual Suspects","Raiders of the Lost Ark","Rear Window","Its a Wonderful Life","Psycho","Lyon","Sunset Boulevard","American History X","Apocalypse Now","Terminator 2 Judgment Day","Memento","Saving Private Ryan","City Lights","Dr Strangelove or How I Learned to Stop Worrying and Love the Bomb","Alien","Modern Times","Spirited Away","North by Northwest","Back to the Future","Life Is Beautiful","The Shining","Citizen Kane","The Pianist","The Departed","Paths of Glory","Vertigo","Django Unchained","The Dark Knight Rises","Double Indemnity","Aliens","Taxi Driver","American Beauty","The Green Mile","Gladiator","Untouchable","WALLE","The Lives of Others","Toy Story 3","The Great Dictator","The Prestige","A Clockwork Orange","Amelie","Lawrence of Arabia","To Kill a Mockingbird","Reservoir Dogs","Das Boot","Cinema Paradiso","The Lion King","The Treasure of the Sierra Madre","Star Wars Episode VI  Return of the Jedi","The Third Man","Requiem for a Dream","Once Upon a Time in America","Eternal Sunshine of the Spotless Mind","Full Metal Jacket","Braveheart","Oldboy","LA Confidential","Chinatown","Singin in the Rain","Bicycle Thieves","Monty Python and the Holy Grail","Rashomon","Metropolis","Princess Mononoke","Some Like It Hot","Amadeus","2001 A Space Odyssey","All About Eve","The Sting","The Apartment","Witness for the Prosecution","Unforgiven","Indiana Jones and the Last Crusade","Grave of the Fireflies","Raging Bull","The Bridge on the River Kwai","Die Hard","Batman Begins","A Separation","Yojimbo","Inglourious Basterds","Snatch","For a Few Dollars More","Toy Story","The Great Escape","Mr Smith Goes to Washington","Up","Downfall","Pans Labyrinth","On the Waterfront","The General","The Seventh Seal","Heat","The Elephant Man","The Kid","The Maltese Falcon","Blade Runner","Scarface","Wild Strawberries","Rebecca","Gran Torino","Fargo","Ikiru","Ran","The Big Lebowski","Touch of Evil","The Gold Rush","The Deer Hunter","Cool Hand Luke","It Happened One Night","No Country for Old Men","Lock, Stock and Two Smoking Barrels","Les Diaboliques","Casino","Good Will Hunting","The Sixth Sense","Strangers on a Train","Platoon","The Thing","Jaws","Sin City","Butch Cassidy and the Sundance Kid","Trainspotting","Kill Bill Vol 1","The Wizard of Oz","Warrior","The Secret in Their Eyes","The Grapes of Wrath","High Noon","Hotel Rwanda","Gone with the Wind","Annie Hall","My Neighbour Totoro","Avengers Assemble","V for Vendetta","Finding Nemo","Dial M for Murder","Notorious","How to Train Your Dragon","Into the Wild","Life of Brian","The Hunt","The Night of the Hunter","There Will Be Blood","Network","The Terminator","BenHur","Million Dollar Baby","The Big Sleep","The Kings Speech","Stand by Me","The Best Years of Our Lives","The 400 Blows","Groundhog Day","Twelve Monkeys","Mary and Max","Dog Day Afternoon","Donnie Darko","Howls Moving Castle","Amores Perros","Persona","The Bourne Ultimatum","Gandhi","The Killing","A Beautiful Mind","The Graduate","Black Swan","The Princess Bride","Whos Afraid of Virginia Woolf","8","The Hustler","La Strada","Rocky","The Man Who Shot Liberty Valance","Anatomy of a Murder","Slumdog Millionaire","Rope","The Exorcist","Barry Lyndon","The Manchurian Candidate","The Wild Bunch","In the Name of the Father","Stalag 17","Monsters Inc","Infernal Affairs","Life of Pi","Memories of Murder","The Truman Show","Fanny and Alexander","Stalker","Pirates of the Caribbean The Curse of the Black Pearl","Roman Holiday","Sleuth","3 Idiots","Like Stars on Earth","Harry Potter and the Deathly Hallows Part 2","A Fistful of Dollars","Jurassic Park","Ip Man","Star Trek","The Hobbit An Unexpected Journey","Incendies","District 9","Shutter Island","A Streetcar Named Desire","Ratatouille","La Haine","The Artist","The Diving Bell and the Butterfly","Rain Man","All Quiet on the Western Front","Nausica of the Valley of the Wind","Beauty and the Beast","Rosemarys Baby","Papillon","Harvey","Mystic River","Before Sunrise","Spring Summer Autumn Winter and Spring","Festen","In the Mood for Love","The Untouchables","Three Colours Red"]
   
    letters.each do |letter|
      Imdb::Search.new(letter).movies[0..5].collect  do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

      


        Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)     
      end
    end
  end



end