package cn.edu.ncu;

import org.springframework.stereotype.Repository;

@Repository
public class BookDao {
    public void addBook(){
        System.out.println("add book info");
    }
}
