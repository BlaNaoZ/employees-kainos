package org.example.resources;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Message {

    private String name;
    private String address;
    private String nino;
    private String bankAcc;
    private int salary;
    private short employeeNumber;

    private String department;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNino() {
        return nino;
    }

    public void setNino(String nino) {
        this.nino = nino;
    }

    public String getBankAcc() {
        return bankAcc;
    }

    public void setBankAcc(String bankAcc) {
        this.bankAcc = bankAcc;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public short getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(short employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @JsonCreator
    public Message(@JsonProperty("name") String name,
                   @JsonProperty("address") String address,
                   @JsonProperty("nino") String nino,
                   @JsonProperty("bankAcc") String bankAcc,
                   @JsonProperty("salary") int salary,
                   @JsonProperty("employeeNumber") short employeeNumber,
                   @JsonProperty("department") String department
        ) {
        this.setName(name);
        this.setAddress(address);
        this.setNino(nino);
        this.setBankAcc(bankAcc);
        this.setSalary(salary);
        this.setEmployeeNumber(employeeNumber);
        this.setDepartment(department);
    }
}