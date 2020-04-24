package file;

import java.io.File;

public class FileExample {
	public static void main(String[] args) {

		String path = "/home/leadon/Dev/git/javaScript/javaScript/WebContent";
		File temp = new File(path);
		File[] fileList = temp.listFiles();

		if (fileList.length > 0) {

			for (File file : fileList) {

				System.out.println(file.getName());

				if (file.isDirectory()) {
					String addPath = path + "/" + file.getName();
					File addTemp = new File(addPath);
					File[] addList = addTemp.listFiles();

					for (File addFile : addList) {
						if (addFile.getName().indexOf("html") > 0)
							System.out.println("  " + addFile.getName());
						else if (addFile.getName().indexOf("jsp") > 0)
							System.out.println("  " + addFile.getName());
					}

				}

			} // main loop

		} else {
			System.out.println("no list");
		}
	}
}
