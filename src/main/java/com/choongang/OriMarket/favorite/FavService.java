package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class FavService {

    @Autowired
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
}

