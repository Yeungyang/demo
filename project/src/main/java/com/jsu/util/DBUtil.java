package com.jsu.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.beanutils.BeanUtils;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DBUtil {
    private static DataSource dataSource;

    static {
        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties");
        Properties properties = new Properties();
        try {
            properties.load(is);
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static <T> List<T> getList(Class<T> clazz, String sql, Object... args) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<T>();
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i + 1, args[i]);
                }
            }

            rs = ps.executeQuery();
            //获取结果集数据
            ResultSetMetaData rsmd = rs.getMetaData();
            //获取当前结果集的列数
            int colnum = rsmd.getColumnCount();

            while (rs.next()) {
                //key存放列名，value存放列值
                Map<String, Object> rowMap = new HashMap<String, Object>();
                for (int i = 1; i <= colnum; i++) {
                    String columnName = rsmd.getColumnLabel(i);
                    Object columnValue = rs.getObject(columnName);

                    if (columnValue instanceof java.sql.Date) {
                        java.sql.Date date = (java.sql.Date) columnValue;
                        columnValue = new java.util.Date(date.getTime());
                    }

                    rowMap.put(columnName, columnValue);
                }

                T bean = clazz.newInstance();

                for (Map.Entry<String, Object> entry : rowMap.entrySet()) {
                    String propertyName = entry.getKey();
                    Object propertyValue = entry.getValue();

                    //获取给propertyName属性赋值的set方法
                    /*String methodName = "set"+propertyName.substring(0,1).toUpperCase()+propertyName.substring(1);

                    //对象获取自己类对应的字节码文件
                    Method method = clazz.getMethod(methodName,propertyValue.getClass());
                    method.invoke(bean,propertyValue);*/

                    BeanUtils.setProperty(bean, propertyName, propertyValue);
                }

                list.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }

        return list;
    }

    /*public static int update(String sql, Object...args){

        Connection conn = null;
        PreparedStatement ps = null;
        int count = 0;
        try{
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            if(args != null){
                for(int i=0; i<args.length; i++){
                    ps.setObject(i+1,args[i]);
                }
            }

            count = ps.executeUpdate();
            //获取结果集数据
            ResultSetMetaData rsmd = rs.getMetaData();
            //获取当前结果集的列数
            int colnum = rsmd.getColumnCount();

            while(rs.next()){
                //key存放列名，value存放列值
                Map<String,Object> rowMap = new HashMap<>();
                for(int i=1; i<=colnum; i++){
                    String columnName = rsmd.getColumnName(i);
                    Object columnValue = rs.getObject(columnName);

                    if(columnValue instanceof java.sql.Date){
                        java.sql.Date date = (java.sql.Date)columnValue;
                        columnValue = new java.util.Date(date.getTime());
                    }

                    rowMap.put(columnName,columnValue);
                }

                T bean = clazz.newInstance();

                for(Map.Entry<String,Object> entry : rowMap.entrySet()){
                    String propertyName = entry.getKey();
                    Object propertyValue = entry.getValue();

                    //获取给propertyName属性赋值的set方法
                    //String methodName = "set"+propertyName.substring(0,1).toUpperCase()+propertyName.substring(1);

                    //对象获取自己类对应的字节码文件
                    //Method method = clazz.getMethod(methodName,propertyValue.getClass());
                    //method.invoke(bean,propertyValue);

                    BeanUtils.setProperty(bean,propertyName,propertyValue);
                }

                list.add(bean);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }

        return list;
    }
*/

    public static void close(Connection conn, Statement ps, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean update(String sql, Object... args) {

        Connection conn = null;
        PreparedStatement ps = null;
        Integer count = null;

        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    if (args[i] instanceof java.util.Date) {
                        java.util.Date date = (java.util.Date) args[i];
                        //转换成java.sql.Date
                        args[i] = new java.sql.Date(date.getTime());
                    }
                    ps.setObject(i + 1, args[i]);
                }
            }

            //返回更新的记录数
            count = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            System.out.println(1111111);
            close(conn, ps, null);
        }

        return count != null && count > 0 ? true : false;
    }

    public static Integer updateForPrimary(String sql, Object... args) {

        Connection conn = null;
        PreparedStatement ps = null;
        Integer primaryKey = null;//主键
        ResultSet rs = null;

        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    if (args[i] instanceof java.util.Date) {
                        java.util.Date date = (java.util.Date) args[i];
                        //转换成java.sql.Date
                        args[i] = new java.sql.Date(date.getTime());
                    }
                    ps.setObject(i + 1, args[i]);
                }
            }

            //返回更新的记录数
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                primaryKey = keys.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, null);
        }

        return primaryKey;
    }

    public static Integer getCount(String sql) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Integer count = 0;

        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            //返回更新的记录数
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }

        return count;
    }

    public static <T> T getOneObject(Class<T> clazz, String sql, Object... args) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        T bean = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i + 1, args[i]);
                }
            }

            rs = ps.executeQuery();
            //获取结果集数据
            ResultSetMetaData rsmd = rs.getMetaData();
            //获取当前结果集的列数
            int colnum = rsmd.getColumnCount();

            while (rs.next()) {
                //key存放列名，value存放列值
                Map<String, Object> rowMap = new HashMap<String, Object>();
                for (int i = 1; i <= colnum; i++) {
                    String columnName = rsmd.getColumnLabel(i);
                    Object columnValue = rs.getObject(columnName);

                    if (columnValue instanceof java.sql.Date) {
                        java.sql.Date date = (java.sql.Date) columnValue;
                        columnValue = new java.util.Date(date.getTime());
                    }

                    rowMap.put(columnName, columnValue);
                }

                bean = clazz.newInstance();

                for (Map.Entry<String, Object> entry : rowMap.entrySet()) {
                    String propertyName = entry.getKey();
                    Object propertyValue = entry.getValue();

                    BeanUtils.setProperty(bean, propertyName, propertyValue);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }

        return bean;
    }

    public static <T> boolean queryIfExist(Class<T> clazz, String sql, Object... args) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        T bean = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);

            if (args != null) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i + 1, args[i]);
                }
            }

            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return false;
    }
}
