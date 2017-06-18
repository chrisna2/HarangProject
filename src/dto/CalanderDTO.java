package dto;

public class CalanderDTO {
	
	public String id;
    public String title;
    public String start;
    public String end;
    public String color;
    public boolean allDay;
    public String isuse;
    
	public String getIsuse() {
		return isuse;
	}
	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getId() {
    	return id;
    }
    public void setId(String id) {
    	this.id = id;
    }
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	

}
