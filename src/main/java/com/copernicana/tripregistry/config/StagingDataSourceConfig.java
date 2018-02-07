//package com.copernicana.tripregistry.config;
//
//import javax.sql.DataSource;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Profile;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//
//@Configuration
//@Profile("staging")
//public class StagingDataSourceConfig {
//
////    @Value("${STAGING_MYSQL_DB_HOST}")
////    private String host;
////
////    @Value("${STAGING_MYSQL_DB_PORT}")
////    private String port;
////
////    @Value("${STAGING_MYSQL_DB_DATABASE}")
////    private String database;
////
////
////
////
////     @Value("${STAGING_MYSQL_DB_USERNAME}")
////    private String username;
////
////       @Value("${STAGING_MYSQL_DB_PASS}")
////    private String pass;
//
//
//
//
//    private String host = "s7.zenbox.pl";
//
//
//    private String port = "3306";
//
//
//    private String database = "multigoto_coper";
//
//
//    private String username = "multigoto_coper";
//
//
//    private String pass = "coper";
//
//
//    @Bean
//    public DataSource dataSource() {
//        String url = "jdbc:mysql://"+ host + ":" + port + "/" + database+"?useSSL=false&autoReconnect=true";
//        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
//        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
//        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
//        System.out.println(url);
//        return DataSourceBuilder
//                .create()
//                .username(username)
//                .password(pass)
//                .url(url)
//                .driverClassName("com.mysql.jdbc.Driver")
//                .build();
//    }
//
//}
//
//
////+ "?useSSL=false"