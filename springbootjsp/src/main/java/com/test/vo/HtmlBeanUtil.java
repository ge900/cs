
package com.test.vo;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;
import org.junit.Test;

import java.io.File;
import java.io.IOException;


/**
 * Created by Administrator on 2016/1/15.
 */

public class HtmlBeanUtil {

    public static HtmlBean createBean(File file){
        HtmlBean hb = new HtmlBean();
        try {
            Source sc = new Source(file);
            Element element = sc.getFirstElement(HTMLElementName.TITLE);
            Element desurl = sc.getElementById("desurl");
            Element pxy = sc.getElementById("pxy");
            if(element==null){
                return null;
            }
            hb.setTitle(element.getTextExtractor().toString());
            hb.setContext(sc.getTextExtractor().toString());
            String path = file.getAbsolutePath();
            //
           // hb.setUrl("c:" + path.substring(3));
            hb.setUrl(desurl.getTextExtractor().toString());
            hb.setPxy(pxy.getTextExtractor().toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hb;

    }
}

