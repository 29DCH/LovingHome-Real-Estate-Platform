package com.ljq.house.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.*;

/**
 * @Author: ljq
 * @Date: 19-1-4 上午8:35
 */
public class FileUtil {
    public static void createFile(HttpServletResponse response, HSSFWorkbook workbook, String fileName) {
        try {
            // 捕获内存缓冲区的数据，转换成字节数组
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            workbook.write(out);
            // 获取内存缓冲中的数据
            byte[] content = out.toByteArray();
            // 将字节数组转化为输入流
            InputStream in = new ByteArrayInputStream(content);
            //通过调用reset（）方法可以重新定位。
            response.reset();
            // 如果文件名是英文名不需要加编码格式，如果是中文名需要添加"iso-8859-1"防止乱码
            response.setHeader("Content-Disposition", "attachment; filename=" + new String((fileName + ".xls")
                    .getBytes(), "iso-8859-1"));
            response.addHeader("Content-Length", "" + content.length);
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            BufferedInputStream bis = new BufferedInputStream(in);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte[] buff = new byte[8192];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bis.close();
            bos.close();
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
