package net.entity.mapper;

import net.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ControllerAdvice;

import java.util.List;
import java.util.Map;

@Repository
@Component
@Transactional(rollbackFor=Exception.class)
public interface UserMapper {
    @Transactional
    public User selectUser(int id);

    @Transactional
    public User selectByUsername(String username);

    @Transactional(rollbackFor = Exception.class)
    public boolean insertUser(User user);

    List<User> selectAllUser();

    boolean updataImg(Map<String, String> map);

}
