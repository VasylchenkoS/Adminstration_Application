package com.vasilchenko.mvc.web;

import com.vasilchenko.java.components.Position;
import com.vasilchenko.java.model.Employee;
import com.vasilchenko.mvc.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	public String showEmployeePage(Model model){
		model.addAttribute("employee", employeeService.getEmployee());
		return "employee/main_employee";
	}

	@RequestMapping(value = "/employees/edit/{id}", method = RequestMethod.GET)
	public String editEmployee(@PathVariable("id") String id, Model model){
		Employee employee = employeeService.getEmployeeById(Integer.parseInt(id));
		model.addAttribute("employee", employee);
		model.addAttribute("positions", Position.values());
		return "employee/update_employee";
	}
	@RequestMapping(value = "/employees/{id}/update", method = RequestMethod.POST)
	public String updateEmployeePage(Employee employee, @PathVariable("id") String id, Model model) {
		employeeService.modifyEmployee(employee);
		model.addAttribute("employee", employeeService.getEmployeeById(Integer.parseInt(id)));
		model.addAttribute("positions", Position.values());
		model.addAttribute("flag", "modify");
		return "employee/update_employee";
	}

	@RequestMapping(value = "/employees/add", method = RequestMethod.GET)
	public String addEmployee(Model model) {
		model.addAttribute("employee", new Employee());
		model.addAttribute("positions", Position.values());
		return "employee/add_employee";
	}

	@RequestMapping(value = "/employees/new", method = RequestMethod.POST)
	public String saveEmployee(@RequestParam("surname") String surname,
							   @RequestParam("name") String name,
							   @RequestParam("position") String position,
							   @RequestParam("birth") String birth,
							   @RequestParam("phone") String phone,
							   @RequestParam("salary") String salary,
							   Model model) {
		Employee employee = new Employee();
		employee.setSurname(surname);
		employee.setName(name);
		if (!position.isEmpty())
			employee.setPosition(Position.valueOf(position));
		if (!birth.isEmpty())
			employee.setBirth(Date.valueOf(birth));
		if (!phone.isEmpty())
			employee.setPhone(phone);
		if (!salary.isEmpty())
			employee.setSalary(Float.parseFloat(salary));
		employeeService.addNewEmployee(employee);
		model.addAttribute("employee", employee);
		model.addAttribute("positions", Position.values());
		model.addAttribute("flag", "add");
		return "employee/update_employee";
	}

	@RequestMapping(value = "/employees/remove/{id}", method = RequestMethod.GET)
	public String removeEmployee(Model model, @PathVariable("id") String id) {
		employeeService.removeEmployee(Integer.parseInt(id));
		model.addAttribute("remove_flag", true);
		return "redirect:/employees";
	}

}