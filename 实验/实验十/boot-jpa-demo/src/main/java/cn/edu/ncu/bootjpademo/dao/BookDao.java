package cn.edu.ncu.bootjpademo.dao;

import cn.edu.ncu.bootjpademo.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookDao extends JpaRepository<Book,String> {
    @Query(value = "select * from book where id < ?",nativeQuery = true)
    List<Book> queryBook(String id);
}