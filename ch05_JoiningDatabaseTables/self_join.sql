use music_club ;

select a.music_fan, b.music_fan
from music_preference a 
    inner join music_preference b 
        on a.favorite_genre = b.favorite_genre
where a.music_fan != b.music_fan
order by a.music_fan ;