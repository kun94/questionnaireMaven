package net.entity.mapper;

import net.entity.Connection;
import net.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
@Component
@Transactional(rollbackFor=Exception.class)
public interface ConnectionMapper {

    boolean insertCollection(Connection connection);

}
