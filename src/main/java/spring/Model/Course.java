package spring.Model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Course {

	@Id
	private int courseID;
	@Lob
	private byte[] image;
	private String coursename;
	private String description;
	
	
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public Course(int courseID, byte[] image, String coursename, String description) {
		super();
		this.courseID = courseID;
		this.image = image;
		this.coursename = coursename;
		this.description = description;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Course [courseID=" + courseID + ", image=" + Arrays.toString(image) + ", coursename=" + coursename
				+ ", description=" + description + "]";
	}


	
	
	
}
