package com.basic.util.poi.excel;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * excel插入图片
 * 
 * @author qiushi.zhou  
 * @date 2016年9月8日 下午2:34:45
 */
public class ExcelExportImg {
		
	
	public static void importImg(HSSFSheet sheet, String imgPath,String filePath){
		
		
		
	}

	public static void main(String[] args) {
		FileOutputStream fileOut = null;
		BufferedImage bufferImg = null;
		// 先把读进来的图片放到一个ByteArrayOutputStream中，以便产生ByteArray
		try {
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
			bufferImg = ImageIO.read(new File("F:/logo1.png"));
			ImageIO.write(bufferImg, "jpg", byteArrayOut);

			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet1 = wb.createSheet("test picture");
			// 画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
			HSSFPatriarch patriarch = sheet1.createDrawingPatriarch();
			// anchor主要用于设置图片的属性
			HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 255, 255,
					(short) 1, 1, (short) 5, 8);
			// 插入图片
			patriarch
					.createPicture(anchor, wb.addPicture(
							byteArrayOut.toByteArray(),
							HSSFWorkbook.PICTURE_TYPE_JPEG));
			fileOut = new FileOutputStream("D:/测试Excel.xls");
			// 写入excel文件
			wb.write(fileOut);
			System.out.println("----Excle文件已生成------");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fileOut != null) {
				try {
					fileOut.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
