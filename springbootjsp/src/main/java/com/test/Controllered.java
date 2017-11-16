package com.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by MS on 2017/8/3.
 */
@Controller
public class Controllered {

    @RequestMapping("/hello")
    public String helloJsp(Map<String,Object> map, HttpServletRequest request){
       // System.out.println("HelloController.helloJsp().hello="+"springboot--1");
       // map.put("hello", "springboot--1");
        String remoteAddr = request.getRemoteAddr();
        System.out.println("ip地址： "+remoteAddr);
        String header = request.getHeader("user-agent");
        System.out.println("浏览器信息： "+header);
        return "map";
    }

    @RequestMapping("/search")
    @ResponseBody
    public List search(String str){
        //System.out.println("HelloController.search");
        System.out.println("前台搜索内容: "+str);



        return CreateIndex.search(str);

       /* Map m1=new HashMap();
        m1.put("title","标题简介1");
        m1.put("conmment","内容1   bgdvdfvdavvvvvvvvvvvvvvvvvvvvvv实打实的vvvvvdgbgadgbazdvSVvzvSDVdb");
        m1.put("px",116.503884);
        m1.put("py",39.814887);

        Map m2=new HashMap();
        m2.put("title","标题简介2");
        m2.put("conmment","内容2   fdddddddddddddddddddddddddddddddddddddddddddd才存储想想是速度 ");
        m2.put("px",116.403884);
        m2.put("py",39.714887);

        Map m3=new HashMap();
        m3.put("title","标题简介3");
        m3.put("conmment","内容3  aaadaaaaaaaaaaacassssssssssssssssssssssssssss 坐车在坐车发发给想速度的阿斯ss");
        m3.put("px",116.503884);
        m3.put("py",39.914887);

        List list=new ArrayList();
        list.add(m1);
        list.add(m2);
        list.add(m3);*/


    }

   /* public static void main(String[] args) {
        SpringApplication.run(Controllered.class, args);
    }*/
   /*mybites*/
  /* @Resource
   UserMapper userMapper;
   @RequestMapping("/test")
   @ResponseBody
    public String user(){
        User user=userMapper.findUserByName("lilei");
       return user.toString();
   }*/
}
