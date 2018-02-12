package net.zypro.zq.dao;

import java.util.List;

import org.hibernate.Session;

import net.zypro.zq.bean.ProjectImage;

public interface ProjectImageDAO extends IBaseDAO<ProjectImage> {
     List<ProjectImage> findByProjectId(Session session,int id);
}
