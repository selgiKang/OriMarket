package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class FavService {

    private final FavRepository favRepository;

    public boolean favInsert(Fav fav) {
        Fav favIn = favRepository.save(fav);

        if (favIn == null) {
            return false;
        } else {
            return true;
        }
    }

    public void favDelete(User userSeq, String favStoreName) {
        Fav fav = favRepository.findByUserSeqAndFavStoreName(userSeq, favStoreName);
        favRepository.delete(fav);
    }

    public boolean favFavorite(User userSeq, String favStoreName) {

        Fav fav = favRepository.findByUserSeqAndFavStoreName(userSeq, favStoreName);
        if (fav == null) {
            return false;
        }
        return true;
    }

    public List<Fav> favList(User userSeq) {
        List<Fav> favListResult = favRepository.findByUserSeq(userSeq);

        return favListResult;
    }
}

