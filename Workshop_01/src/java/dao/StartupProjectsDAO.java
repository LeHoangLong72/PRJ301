package dao;

import dto.StartupProjectsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;


public class StartupProjectsDAO implements IDAO<StartupProjectsDTO, String>{

    @Override
    public boolean create(StartupProjectsDTO entity) {
        String sql = "INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimated_launch)"
                + "VALUES (?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getProjectID());
            ps.setString(2, entity.getProjectName());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setDate(5, new java.sql.Date(entity.getEstimatedLaunch().getTime()));
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<StartupProjectsDTO> readAll() {
        return null;
    }

    @Override
    public StartupProjectsDTO readByUsername(String username) {
        return null;
    }

    @Override
    public boolean update(StartupProjectsDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String username) {
        return false;
    }

    @Override
    public List<StartupProjectsDTO> search(String searchTerm) {
        return null;
    }
    
    public List<StartupProjectsDTO> searchByName(String searchTerm){
        List<StartupProjectsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                StartupProjectsDTO projects = new StartupProjectsDTO(
                        rs.getInt("project_id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getDate("estimated_launch"));
                list.add(projects);
           }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
    
}
