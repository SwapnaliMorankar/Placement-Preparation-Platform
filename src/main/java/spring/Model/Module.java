package spring.Model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Module {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int moduleID;
    private String moduleName;
    private String moduleDescription;
    @Lob
    private byte[] pdfDocument;
     
    @ManyToOne
    @JoinColumn(name = "courseID")
    private Course course;

	public int getModuleID() {
		return moduleID;
	}

	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleDescription() {
		return moduleDescription;
	}

	public void setModuleDescription(String moduleDescription) {
		this.moduleDescription = moduleDescription;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public byte[] getPdfDocument() {
		return pdfDocument;
	}

	public void setPdfDocument(byte[] pdfDocument) {
		this.pdfDocument = pdfDocument;
	}

	public Module(int moduleID, String moduleName, String moduleDescription, byte[] pdfDocument, Course course) {
		super();
		this.moduleID = moduleID;
		this.moduleName = moduleName;
		this.moduleDescription = moduleDescription;
		this.pdfDocument = pdfDocument;
		this.course = course;
	}

	public Module() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Module [moduleID=" + moduleID + ", moduleName=" + moduleName + ", moduleDescription="
				+ moduleDescription + ", pdfDocument=" + Arrays.toString(pdfDocument) + ", course=" + course + "]";
	}

	
    

}
