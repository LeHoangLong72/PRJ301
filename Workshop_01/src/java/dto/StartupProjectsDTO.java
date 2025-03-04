package dto;

import java.util.Date;

public class StartupProjectsDTO {
    private int projectID;
    private String projectName;
    private String description;
    private String status;
    private Date estimatedLaunch;

    public StartupProjectsDTO() {
        this.projectID = 0;
        this.projectName = "";
        this.description = "";
        this.status = "";
        this.estimatedLaunch = null;
    }

    public StartupProjectsDTO(int projectID, String projectName, String description, String status, Date estimatedLaunch) {
        this.projectID = projectID;
        this.projectName = projectName;
        this.description = description;
        this.status = status;
        this.estimatedLaunch = estimatedLaunch;
    }

    public int getProjectID() {
        return projectID;
    }

    public void setProjectID(int projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEstimatedLaunch() {
        return estimatedLaunch;
    }

    public void setEstimatedLaunch(Date estimatedLaunch) {
        this.estimatedLaunch = estimatedLaunch;
    }
    
    
}
