package com.zhonghong.university.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUtil {

	/**
	 * 拷贝文件及文件夹到指定路径
	 * 
	 * @param path
	 * @param copyPath
	 * @throws IOException
	 */
	public static void copyPath(String path, String copyPath) throws IOException {
		File newFile = new File(copyPath);
		if (!newFile.exists()) {
			newFile.mkdir();
		}

		File filePath = new File(path);
		copy(path, copyPath + File.separator + filePath.getName());
	}

	/**
	 * 拷贝文件及文件夹下的文件到指定路径
	 * 
	 * @param path
	 * @param copyPath
	 * @throws IOException
	 */
	public static void copy(String path, String copyPath) throws IOException {
		File filePath = new File(path);
		DataInputStream read;
		DataOutputStream write;
		if (filePath.isDirectory()) {
			File[] list = filePath.listFiles();
			for (int i = 0; i < list.length; i++) {
				String newPath = path + File.separator + list[i].getName();
				String newCopyPath = copyPath + File.separator + list[i].getName();
				File newFile = new File(copyPath);
				if (!newFile.exists()) {
					newFile.mkdir();
				}
				copy(newPath, newCopyPath);
			}
		} else if (filePath.isFile()) {
			read = new DataInputStream(new BufferedInputStream(new FileInputStream(path)));
			write = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(copyPath)));
			byte[] buf = new byte[1024 * 512];
			while (read.read(buf) != -1) {
				write.write(buf);
			}
			read.close();
			write.close();
		} else {
			System.out.println("请输入正确的文件名或路径名");
		}
	}

	/**
	 * 以字节为单位读取文件，常用于读二进制文件，如图片、声音、影像等文件。
	 */
	public static String readFileByBytes(String fileName) {
		File file = new File(fileName);
		String filecontent = "";
		if (!file.exists()) {
			return null;
		} else {
			BufferedReader reader = null;
			try {
				reader = new BufferedReader(new FileReader(file));
				String tempString = null;
				// 一次读入一行，直到读入null为文件结束
				while ((tempString = reader.readLine()) != null) {
					// 显示行号
					filecontent = filecontent + tempString;
				}
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e1) {
					}
				}
			}
			return filecontent;
		}
	}

	/**
	 * 删除指定路径的文件夹及文件
	 * 
	 * @param fileName
	 * @return
	 */
	/**
	 * 根据路径删除指定的目录或文件，无论存在与否
	 * 
	 * @param sPath
	 *            要删除的目录或文件
	 * @return 删除成功返回 true，否则返回 false。
	 */
	public static boolean deleteFolder(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 判断目录或文件是否存在
		if (!file.exists()) { // 不存在返回 false
			return flag;
		} else {
			// 判断是否为文件
			if (file.isFile()) { // 为文件时调用删除文件方法
				return deleteFile(sPath);
			} else { // 为目录时调用删除目录方法
				return deleteDirectory(sPath);
			}
		}
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public static boolean deleteFile(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}

	/**
	 * 删除目录（文件夹）以及目录下的文件
	 * 
	 * @param sPath
	 *            被删除目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	public static boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		boolean flag = true;
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			} // 删除子目录
			else {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag)
			return false;
		// 删除当前目录
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}
	

	/**
	 * 文件下载
	 * 
	 * @param response
	 * @param str
	 */
	public static void downFile(HttpServletResponse response, String path, String fileName) {
		try {
			File file = new File(path);
			if (file.exists()) {
				InputStream ins = new FileInputStream(path);
				BufferedInputStream bins = new BufferedInputStream(ins);// 放到缓冲流里面
				OutputStream outs = response.getOutputStream();// 获取文件输出IO流
				BufferedOutputStream bouts = new BufferedOutputStream(outs);
				response.setContentType("application/x-download");// 设置response内容的类型
				response.setHeader("Content-disposition",
						"attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));// 设置头部信息
				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				// 开始向网络传输文件流
				while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
					bouts.write(buffer, 0, bytesRead);
				}
				bouts.flush();// 这里一定要调用flush()方法
				ins.close();
				bins.close();
				outs.close();
				bouts.close();
			}
		} catch (IOException e) {
			//logger.error("文件下载出错", e);
		}
	}

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		/*
		 * copyPath("D:/temp", "D:/temp10"); copyPath("D:/temp1", "D:/temp10");
		 */

		// deleteFolder("D:/temp10");

		// TODO Auto-generated method stub
		// 需要压缩的文件或目录的路径
		//doZip("D:/temp1","D:/temp1.zip");
	}

	/**
	 * 功能：把 sourceDir 目录下的所有文件进行 zip 格式的压缩，保存为指定 zip 文件
	 * 
	 * @param sourceDir
	 *            如果是目录，eg：D:\\MyEclipse\\first\\testFile，则压缩目录下所有文件；
	 *            如果是文件，eg：D:\\MyEclipse\\first\\testFile\\aa.zip，则只压缩本文件
	 * @param zipFile
	 *            最后压缩的文件路径和名称,eg:D:\\MyEclipse\\first\\testFile\\aa.zip
	 */
	public static File doZip(String sourceDir, String tempDir, String zipFilePath) throws IOException {

        File tempfile = new File(tempDir);
        if(!tempfile.exists()) {
        	tempfile.mkdir(); // 如果目录不存在创建目录
        }
		
        
		File file = new File(sourceDir);
		File zipFile = new File(zipFilePath);
		ZipOutputStream zos = null;
		try {
			// 创建写出流操作
			OutputStream os = new FileOutputStream(zipFile);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			zos = new ZipOutputStream(bos);

			String basePath = null;

			// 获取目录
			if (file.isDirectory()) {
				basePath = file.getPath();
			} else {
				basePath = file.getParent();
			}

			zipFile(file, basePath, zos);
		} finally {
			if (zos != null) {
				zos.closeEntry();
				zos.close();
			}
		}

		return zipFile;
	}

	/**
	 * @param source
	 *            源文件
	 * @param basePath
	 * @param zos
	 */
	private static void zipFile(File source, String basePath, ZipOutputStream zos) throws IOException {
		File[] files = null;
		if (source.isDirectory()) {
			files = source.listFiles();
		} else {
			files = new File[1];
			files[0] = source;
		}

		InputStream is = null;
		String pathName;
		byte[] buf = new byte[1024];
		int length = 0;
		try {
			for (File file : files) {
				if (file.isDirectory()) {
					pathName = file.getPath().substring(basePath.length() + 1) + "/";
					zos.putNextEntry(new ZipEntry(pathName));
					zipFile(file, basePath, zos);
				} else {
					pathName = file.getPath().substring(basePath.length() + 1);
					is = new FileInputStream(file);
					BufferedInputStream bis = new BufferedInputStream(is);
					zos.putNextEntry(new ZipEntry(pathName));
					while ((length = bis.read(buf)) > 0) {
						zos.write(buf, 0, length);
					}
				}
			}
		} finally {
			if (is != null) {
				is.close();
			}
		}

	}

}
