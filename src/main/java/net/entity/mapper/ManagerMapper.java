package net.entity.mapper;

import net.entity.Manager;
import net.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Component
@Transactional(rollbackFor=Exception.class)
public interface ManagerMapper {

    @Transactional
    public Manager selectByManagerName(String managerName);

    @Transactional(rollbackFor = Exception.class)
    public boolean insertUser(User user);

}
