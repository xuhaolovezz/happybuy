package com.happybuy.interceptor;

import com.happybuy.entity.PageBean;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

/**
 * 分页拦截器
 * Created by 徐豪 on 2017/6/12/012.
 */
//拦截Mybatis中StatementHandler中prepare方法，拦截参数是Connection
@Intercepts({@Signature(type = StatementHandler.class,method = "prepare",args = {Connection.class,Integer.class})})
public class PageInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        //获取要拦截的类
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        //通过反射获取拦截类中的StatementHandler对象
        MetaObject metaObject = SystemMetaObject.forObject(statementHandler);
        //获得StatementHandler的mappedStatement属性
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
        //配置文件中SQL语句的ID
        String id = mappedStatement.getId();
        //拦截以ByPage结尾的方法进行分页
        if( id.matches(".+ByPage$")){
            BoundSql boundSql = statementHandler.getBoundSql();
            //拿到原始SQL语句
            String sql = boundSql.getSql();
            //查询总条数的SQL语句
            String countSql = "select count(*) from (" + sql +")a";
            //通过invocation获得拦截方法的参数中的Connection
            Connection connection = (Connection) invocation.getArgs()[0];
            //创建语句查询对象
            PreparedStatement countStatement = connection.prepareStatement(countSql);
            //通过语句查询对象获得parameterHandler进而将sql参数放的sql语句中，来代替sql语句中的?
            ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
            //设置sql参数
            parameterHandler.setParameters(countStatement);
            ResultSet rs = countStatement.executeQuery();
            //获得传入XML配置文件map参数
            Map<String,Object> parameter = (Map<String, Object>) boundSql.getParameterObject();
            PageBean pageBean = (PageBean) parameter.get("pageBean");
            if ( rs.next() ){
                //设置总条数
                //pageBean.setTotalSize(rs.getInt(1));
            }
            //改造后带分页查询的SQL语句
            String pageSql = sql + " limit " + pageBean.getDbIndex() + "," + pageBean.getDbNumber();
            //通过反射将分页后的SQL语句放入
            metaObject.setValue("delegate.boundSql.sql",pageSql);
        }
        //返回程序继续执行
        return invocation.proceed();
    }

    /**
     * 判断拦截的是否是StatementHandler类
     * 是就返回当前类的代理对象，否就直接返回原对象
     * @param o
     * @return
     */
    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o,this);
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
