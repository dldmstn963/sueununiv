package student.model.vo;

import java.sql.Date;

public class Student implements java.io.Serializable {
	private static final long serialVersionUID = 123465L;

	private String studentNo;
	private String studentName;
	private String studentSSN;
	private String studentAddress;
	private java.sql.Date entranceDate;
	private String absenceYN;
	private String departmentNo;
	private String studentPassword;
	private String studentImage;

	public Student() {
	}

	public Student(String studentNo, String studentName, String studentSSN, String studentAddress, Date entranceDate,
			String absenceYN, String departmentNo, String studentPassword, String studentImage) {
		super();
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.studentSSN = studentSSN;
		this.studentAddress = studentAddress;
		this.entranceDate = entranceDate;
		this.absenceYN = absenceYN;
		this.departmentNo = departmentNo;
		this.studentPassword = studentPassword;
		this.studentImage = studentImage;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentSSN() {
		return studentSSN;
	}

	public void setStudentSSN(String studentSSN) {
		this.studentSSN = studentSSN;
	}

	public String getStudentAddress() {
		return studentAddress;
	}

	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}

	public java.sql.Date getEntranceDate() {
		return entranceDate;
	}

	public void setEntranceDate(java.sql.Date entranceDate) {
		this.entranceDate = entranceDate;
	}

	public String getAbsenceYN() {
		return absenceYN;
	}

	public void setAbsenceYN(String absenceYN) {
		this.absenceYN = absenceYN;
	}

	public String getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(String departmentNo) {
		this.departmentNo = departmentNo;
	}

	public String getStudentPassword() {
		return studentPassword;
	}

	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}

	public String getStudentImage() {
		return studentImage;
	}

	public void setStudentImage(String studentImage) {
		this.studentImage = studentImage;
	}

	@Override
	public String toString() {
		return "Student [studentNo=" + studentNo + ", studentName=" + studentName + ", studentSSN=" + studentSSN
				+ ", studentAddress=" + studentAddress + ", entranceDate=" + entranceDate + ", absenceYN=" + absenceYN
				+ ", departmentNo=" + departmentNo + ", studentPassword=" + studentPassword + ", studentImage="
				+ studentImage + "]";
	}

}