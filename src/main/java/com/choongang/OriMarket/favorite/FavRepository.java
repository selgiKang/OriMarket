package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FavRepository extends JpaRepository<Fav,Long> {

    Fav findByUserSeqAndFavStoreName(User userSeq, String favStoreName);
}
