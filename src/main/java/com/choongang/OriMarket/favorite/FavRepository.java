package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FavRepository extends JpaRepository<Fav,Long> {

    Fav findByUserSeqAndFavStoreName(User userSeq, String favStoreName);
   List <Fav> findByUserSeq(User userSeq);

}
