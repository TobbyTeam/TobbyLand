package kr.ac.kpu.ebiz.spring.tobbyproject.command;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class Department {

    @Autowired
    DepartmentRepository departmentRepository;

    List<Map> department;

    public Department(){

        this.department = departmentRepository.selectAll();

    }

    public List<Map> depatment() {

        return department;
    }


}
