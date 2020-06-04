package net.codejava.spring.model;

public class Contact {
	//private int id;
	//private String directoryName;
	//private String fileName;
	private String Count;
	private String statusVal;
	//private String date;

	public Contact() {
	}

	public Contact(String DirectoryName, String FileName, String Status, String date) {
		//this.directoryName = DirectoryName;
		//this.fileName = FileName;
		this.Count = Status;
		//this.date = date;
	}

	//public int getId() {
		//return id;
	//}

	//public void setId(int id) {
		//this.id = id;
	//}

	//public String getDirectoryName() {
	//	return directoryName;
	//}

	//public void setDirectoryName(String DirectoryName) {
		//this.directoryName = DirectoryName;
	//}

	//public String getFileName() {
	//	return fileName;
	//}

	//public void setFileName(String FileName) {
		//this.fileName = FileName;
	//}

	public String getStatus() {
		return Count;
	}

	public void setStatus(String Status) {
		this.Count = Status;
	}
	

	//public String getdate() {
		//return date;
	//}

	//public void setdate(String date) {
		//this.date = date;
	//}

	@Override
	public String toString() {
		//return "Contact [id=" + id + ", directoryName=" + directoryName + ", FileName=" + fileName + ", Status="
			return "Contact[Status="+ Count +"]";
	}

	public String getStatusVal() {
		return statusVal;
	}

	public void setStatusVal(String statusVal) {
		this.statusVal = statusVal;
	}

	
	
	

}
